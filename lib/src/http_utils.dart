import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'dart:io' as io;
import 'dart:math';

class HttpUtils {
  static Dio createRetryClient({
    int retries = 5,
    Duration backoffFactor = const Duration(milliseconds: 200),
    List<int> statusForceList = const [500, 502, 504],
    Duration timeout = const Duration(seconds: 30),
  }) {
    final dio = Dio();

    dio.options.connectTimeout = timeout;
    dio.options.receiveTimeout = Duration(seconds: timeout.inSeconds * 2);
    dio.options.sendTimeout = timeout;

    dio.options.headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0';

    if (dio.httpClientAdapter is IOHttpClientAdapter) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = io.HttpClient();
        client.connectionTimeout = timeout;
        client.idleTimeout = Duration(seconds: timeout.inSeconds * 2);
        client.userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0';
        return client;
      };
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          final requestOptions = error.requestOptions;

          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.connectionError ||
              error.type == DioExceptionType.unknown ||
              (error.response != null && 
               statusForceList.contains(error.response!.statusCode))) {

            final retryCount = requestOptions.extra['retryCount'] ?? 0;
            if (retryCount < retries) {
              requestOptions.extra['retryCount'] = retryCount + 1;

              final delay = Duration(
                milliseconds: backoffFactor.inMilliseconds * 
                            pow(2, retryCount).toInt(),
              );
              await Future.delayed(delay);

              try {
                final response = await dio.fetch(requestOptions);
                handler.resolve(response);
                return;
              } catch (e) {
                print(e);
              }
            }
          }
          
          handler.next(error);
        },
      ),
    );

    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    return dio;
  }

  static int sizeStringToBytes(String sizeStr) {
    if (sizeStr.isEmpty) return 0;
    
    final regex = RegExp(r'^(\d+)\s?(([KMGTPEZY]?)(iB|B)?)$', caseSensitive: false);
    final match = regex.firstMatch(sizeStr.trim());
    
    if (match == null) {
      throw ArgumentError('Invalid size format: $sizeStr');
    }
    
    final num = int.parse(match.group(1)!);
    final unit = (match.group(3) ?? 'B').toUpperCase();
    
    const units = ['B', 'K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y'];
    final unitIndex = units.indexOf(unit);
    
    if (unitIndex == -1) {
      throw ArgumentError('Unknown unit: $unit');
    }
    
    return (num * pow(1024, unitIndex)).toInt();
  }

  static String bytesToSizeString(int bytes) {
    if (bytes == 0) return '0B';
    
    const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(bytes) / log(1024)).floor();
    final size = bytes / pow(1024, i);
    
    return '${size.toStringAsFixed(2)} ${units[i]}';
  }

  static String formatTransferSpeed(int bytesPerSecond) {
    return '${bytesToSizeString(bytesPerSecond)}/s';
  }

  static String formatEta(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    
    return '${hours.toString().padLeft(2, '0')}:'
           '${minutes.toString().padLeft(2, '0')}:'
           '${seconds.toString().padLeft(2, '0')}';
  }

  static bool isValidGigaFileUrl(String url) {
    final pattern = RegExp(r'^https?:\/\/\d+?\.gigafile\.nu\/[a-z0-9-]+$');
    return pattern.hasMatch(url);
  }

  static String extractFileIdFromUrl(String url) {
    final match = RegExp(r'^https?:\/\/\d+?\.gigafile\.nu\/([a-z0-9-]+)$').firstMatch(url);
    if (match == null) {
      throw ArgumentError('Invalid GigaFile URL: $url');
    }
    return match.group(1)!;
  }

  static String sanitizeFileName(String fileName) {
    return fileName.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
  }
}