import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gigafile_dart/src/http_utils.dart';
import 'package:gigafile_dart/src/model/upload_request.dart';
import 'package:gigafile_dart/src/model/upload_result.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class Uploader {
  late Dio _dio;
  final void Function(
    String token,
    double progress,
    String? fileName,
    int uploaded,
    int total
  )? progressCallback;
  
  String? _server;
  CancelToken _cancelToken = CancelToken();

  Uploader({
    this.progressCallback
  }) {
    _dio = HttpUtils.createRetryClient();
  }

  void cancel() {
    _cancelToken.cancel('ユーザーがキャンセルしました');
  }

  Future<List<UploadResult>> upload(List<UploadRequest> requests) async {
    try {
      if (requests.where((request) => !request.file.existsSync()).isNotEmpty) {
        throw UploadResult.failure('以下のファイルが見つかりません:\n${requests.where((request) => !request.file.existsSync()).map((request) => request.file.path).join('\n')}');
      }

      _cancelToken = CancelToken(); 

      final List<UploadResult> results = [];

      for (final request in requests) {
        final file = request.file;

        final fileSize = await file.length();
        final chunks = (fileSize / (10 * 1024 * 1024)).ceil();
        final token = Uuid().v1().replaceAll('-', '');

        await _getServerInfo();

        final firstResult = await _uploadChunk(
          request,
          0,
          chunks,
          token
        );

        UploadResult? finalResult = firstResult;
        if (chunks > 1) {
          for (int i = 1; i < chunks; i++) {
            
            final result = await _uploadChunk(
              request,
              i,
              chunks,
              token
            );

            if (result.data?.url != null) {
              finalResult = result;
            }
          }
        }

        if (finalResult?.data?.url != null) {
          results.add(finalResult!);
        }
      }

      return results;
    } catch (e) {
      throw UploadResult.failure(e.toString());
    }
  }
  
  Future<void> _getServerInfo() async {
    try {
      final response = await _dio.get('https://gigafile.nu/');

      final responseText = response.data.toString();
      final serverMatch = RegExp(r'var server = "(.+?)"').firstMatch(responseText);
      
      if (serverMatch != null) {
        _server = serverMatch.group(1);
      } else {
        throw Exception('サーバー情報の取得に失敗しました');
      }
    } catch (e) {
      throw Exception('サーバー情報の取得に失敗しました: $e');
    }
  }

  Future<UploadResult> _uploadChunk(
    UploadRequest request,
    int chunkNo,
    int totalChunks,
    String token,
  ) async {
    try {
      final file = File(request.file.path);
      final fileSize = file.lengthSync();
      final startPos = chunkNo * (10 * 1024 * 1024);
      final endPos = ((chunkNo + 1) * (10 * 1024 * 1024)).clamp(0, fileSize);
      final chunkSize = endPos - startPos;

      final randomAccessFile = await file.open();
      await randomAccessFile.setPosition(startPos);
      final chunkData = await randomAccessFile.read(chunkSize);
      await randomAccessFile.close();

      final formData = FormData.fromMap({
        'id': token,
        'name': path.basename(file.path),
        'chunk': chunkNo.toString(),
        'chunks': totalChunks.toString(),
        'lifetime': request.lifetime.toString(),
        'file': MultipartFile.fromBytes(
          chunkData,
          filename: 'blob',
          contentType: DioMediaType('application', 'octet-stream'),
        ),
      });

      final response = await _dio.post<Map<String, dynamic>>(
        'https://$_server/upload_chunk.php',
        data: formData,
        cancelToken: _cancelToken,
        onSendProgress: (sent, total) {
          if (progressCallback != null) {
            final chunkSize = 10 * 1024 * 1024;

            final overallProgress = (chunkNo * chunkSize + sent) / fileSize;
            final fileName = path.basename(file.path);
            progressCallback?.call(
              token,
              overallProgress.clamp(0.0, 1.0),
              fileName,
              (chunkNo * chunkSize + sent).clamp(0, fileSize),
              fileSize,
            );
          }
        },
      );

      final responseData = response.data;
      if (responseData == null) {
        return UploadResult.failure('チャンク $chunkNo のアップロードでレスポンスが無効です');
      }

      return UploadResult.success(responseData);
    } catch (e) {
      return UploadResult.failure('チャンク $chunkNo のアップロード中にエラーが発生しました: $e');
    }
  }
}