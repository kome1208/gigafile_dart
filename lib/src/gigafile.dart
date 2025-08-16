import 'package:dio/dio.dart';
import 'package:gigafile_dart/src/http_utils.dart';
import 'package:gigafile_dart/src/model/matomete_get_url.dart';

class Gigafile {
  late Dio _dio;

  Gigafile() {
    _dio = HttpUtils.createRetryClient();
  }

  Future<bool> removeFile(String url, String delkey) async {
    try {
      final uri = Uri.parse(url);

      final response = await _dio.get(
        'https://${uri.host}/remove.php',
        queryParameters: {
          'file': uri.path.split('/').firstWhere((str) => str.isNotEmpty),
          'delkey': delkey,
          '_': DateTime.now().millisecondsSinceEpoch
        }
      );

      return response.data['status'] == 0 ? true : false;
    } catch (e) {
      throw Exception('ファイルの削除に失敗しました: $e');
    }
  }

  Future<bool> setDLKey(String url, String delkey, String key) async {
    try {
      final uri = Uri.parse(url);

      final response = await _dio.get(
        'https://${uri.host}/set_dlkey.php',
        queryParameters: {
          'file': uri.path.split('/').firstWhere((str) => str.isNotEmpty),
          'delkey': delkey,
          'dlkey': key,
          '_': DateTime.now().millisecondsSinceEpoch
        }
      );
      print(response.data);
      return response.data['status'] == 0 ? true : false;
    } catch (e) {
      throw Exception('ダウンロードキーの設定に失敗しました: $e');
    }
  }

  Future<MatometeGetUrl> matometeGetUrl(List<String> urls, String? fileName, String lifetime, List<String>? dlkeys, String? dlkey) async {
    String server = '';

    if (!urls.every((value) => Uri.parse(value).host == Uri.parse(urls.first).host)) {
      throw Exception('指定されたサーバーが一致しません');
    } else {
      server = Uri.parse(urls.first).host;
    }

    final formData = {
      'urls': urls,
      'dlkeys': dlkeys ?? [],
      'file_name': fileName ?? '',
      'dlkey': dlkey ?? '',
      'lifetime': lifetime,
    };

    final urlencodedList = mapToUrlencoded(formData);

    if (urls.length > (dlkeys?.length ?? 0)) {
      final dlkeysLen = dlkeys?.length ?? 0;
      for (var i = dlkeysLen; i < urls.length; i++) {
        urlencodedList.add(Uri.encodeQueryComponent('dlkeys[]='));
      }
    }

    final response = await _dio.post(
      'https://$server/matomete_get_url.php',
      data: urlencodedList.join('&'),
      options: Options(
        contentType: Headers.formUrlEncodedContentType
      )
    );

    return MatometeGetUrl.fromJson(response.data);
  }

  static List<String> mapToUrlencoded(Map<String, dynamic> data) {
    final List<String> parts = [];

    data.forEach((key, value) {
      if (value is List) {
        for (final item in value) {
          parts.add('${Uri.encodeQueryComponent('$key[]')}=${Uri.encodeQueryComponent(item)}');
        }
      } else {
        parts.add('${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value.toString())}');
      }
    });

    return parts;
  }
}