import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gigafile_dart/src/http_utils.dart';
import 'package:gigafile_dart/src/model/download_request.dart';
import 'package:gigafile_dart/src/model/download_result.dart';
import 'package:gigafile_dart/src/model/file_info.dart';
import 'package:path/path.dart' as path;
import 'package:html/parser.dart' as html_parser;

class Downloader {
  String outputDir;
  bool prioritizeMatomete;
  final void Function(
    double progress,
    String fileName,
    int downloaded,
    int total
  )? progressCallback;

  late Dio _dio;
  CancelToken _cancelToken = CancelToken();

  Downloader({
    required this.outputDir,
    this.prioritizeMatomete = true,
    this.progressCallback
  }) {
    _dio = HttpUtils.createRetryClient();
  }

  void cancel() {
    _cancelToken.cancel('ユーザーがキャンセルしました');
  }

  Future<List<DownloadResult>> download(List<DownloadRequest> requests) async {
    _cancelToken = CancelToken();
    
    final List<DownloadResult> downloadedFiles = [];

    if (requests.where((request) => !HttpUtils.isValidGigaFileUrl(request.uri)).isNotEmpty) {
      throw DownloadResult.failure('以下のURLが無効です:\n${requests.where((request) => !HttpUtils.isValidGigaFileUrl(request.uri)).map((uri) => uri).join('\n')}');
    }

    for (var request in requests) {
      final filesInfo = await _parseFilesInfo(request.uri);

      if (filesInfo.isEmpty) {
        throw DownloadResult.failure('ダウンロード可能なファイルが見つかりません');
      }

      final fileId = HttpUtils.extractFileIdFromUrl(request.uri);

      final fileIdDir = path.join(outputDir, fileId);
      await Directory(fileIdDir).create(recursive: true);

      for (int idx = 0; idx < filesInfo.length; idx++) {
        try {
          final fileInfo = filesInfo[idx];
          final fileName = HttpUtils.sanitizeFileName(fileInfo.webName);
          final finalPath = path.join(fileIdDir, fileName);

          final downloadUrl = _buildDownloadUrl('https://${Uri.parse(request.uri).host}/${fileInfo.fileId}', request.dlKey, fileInfo.isMatomete);
          
          final success = await _downloadSingleFile(
            downloadUrl,
            finalPath,
            fileInfo.webName,
            idx,
            filesInfo.length,
          );

          if (success) {
            downloadedFiles.add(
              DownloadResult.success(finalPath)
            );
          }
        } catch (e) {
          downloadedFiles.add(
            DownloadResult.failure(e.toString())
          );
        }
      }
    }

    return downloadedFiles;
  }

  Future<List<FileInfo>> _parseFilesInfo(String uri) async {
    final filesInfo = <FileInfo>[];

    try {
      final response = await _dio.get(uri);

      final document = html_parser.parse(response.data);
      final matometeElement = document.querySelector('#contents_matomete');
      
      if (matometeElement != null) {

        if (prioritizeMatomete) {
          final fileId = HttpUtils.extractFileIdFromUrl(uri);

          final element = document.querySelector('#matomete_zip');

          final matometeFileInfoElements = element!.querySelectorAll('.matomete_file_info > span').where((element) => element.text.trim().isNotEmpty).toList();

          final nameElement = matometeFileInfoElements[0];
          final sizeElement = matometeFileInfoElements[1];
          
          filesInfo.add(FileInfo(
            webName: nameElement.text.trim(),
            sizeStr: sizeElement.text.trim(),
            fileId: fileId,
            isMatomete: true
          ));
        } else {
          final fileElements = document.querySelectorAll('.matomete_file');
        
          for (int i = 0; i < fileElements.length; i++) {
            final element = fileElements[i];

            final allSpans = element.querySelectorAll('.matomete_file_info > span').where((element) => element.text.trim().isNotEmpty).toList();
            
            final downloadButton = element.querySelector('.download_panel_btn_dl') ??
                                   element.querySelector('[onclick*="download"]') ??
                                   element.querySelector('a[href*="download"]') ??
                                   element.querySelector('.btn_dl');

            String webName = allSpans[0].text.trim();
            String sizeStr = allSpans[1].text.trim();

            if (webName.isEmpty || sizeStr.isEmpty) {
              final nameFromSize = element.querySelector('.matomete_file_info > span:nth-child(3)')?.text.trim() ?? '';
              final sizeFromName = element.querySelector('.matomete_file_info > span:nth-child(2)')?.text.trim() ?? '';
              
              if (webName.isEmpty && nameFromSize.isNotEmpty) {
                webName = nameFromSize;
              }
              if (sizeStr.isEmpty && sizeFromName.isNotEmpty) {
                sizeStr = sizeFromName;
              }
            }
            
            if (webName.isNotEmpty && downloadButton != null) {
              final onclick = downloadButton.attributes['onclick'] ?? '';
              final href = downloadButton.attributes['href'] ?? '';

              RegExpMatch? fileIdMatch = RegExp(r"download\(\d+,\s*'(.+?)'").firstMatch(onclick);
              if (fileIdMatch == null && href.isNotEmpty) {
                fileIdMatch = RegExp(r'file=([^&]+)').firstMatch(href);
              }

              String finalSizeStr = sizeStr;
              if (finalSizeStr.isEmpty) {
                finalSizeStr = '不明';
              }

              String extractedSize = finalSizeStr;
              RegExpMatch? sizeMatch = RegExp(r'（(.+?)）').firstMatch(finalSizeStr);
              if (sizeMatch != null) {
                extractedSize = sizeMatch.group(1)!;
              } else {
                sizeMatch = RegExp(r'\((.+?)\)').firstMatch(finalSizeStr);
                if (sizeMatch != null) {
                  extractedSize = sizeMatch.group(1)!;
                } else {
                  sizeMatch = RegExp(r'([0-9.,]+\s*[KMGTPE]?B)').firstMatch(finalSizeStr);
                  if (sizeMatch != null) {
                    extractedSize = sizeMatch.group(1)!;
                  }
                }
              }
              
              if (fileIdMatch != null && webName.isNotEmpty) {
                filesInfo.add(FileInfo(
                  webName: webName,
                  sizeStr: extractedSize,
                  fileId: fileIdMatch.group(1)!,
                  isMatomete: false
                ));
              }
            }
          }
        }
      } else {
        final fileId = HttpUtils.extractFileIdFromUrl(uri);
        final sizeElement = document.querySelector('.dl_size');
        final nameElement = document.querySelector('#dl');
        
        if (sizeElement != null && nameElement != null) {
          filesInfo.add(FileInfo(
            webName: nameElement.text.trim(),
            sizeStr: sizeElement.text.trim(),
            fileId: fileId,
            isMatomete: false
          ));
        }
      }
    } catch (e) {
      throw Exception('ページの解析に失敗しました: $e');
    }

    return filesInfo;
  }

  String _buildDownloadUrl(String requestUri, String? dlKey, bool isMatomete) {
    final uri = Uri.parse(requestUri);

    var downloadUrl = 'https://${uri.host}/${isMatomete ? 'dl_zip' : 'download'}.php?file=${uri.pathSegments.isNotEmpty ? uri.pathSegments.first : ''}';
    
    if (dlKey != null) {
      downloadUrl += '&dlkey=$dlKey';
    }
    
    return downloadUrl;
  }

  Future<bool> _downloadSingleFile(
    String downloadUrl,
    String finalPath,
    String originalFileName,
    int fileIndex,
    int totalFiles, {
    bool hasRetried = false,
  }) async {
    final tempPath = '$finalPath.dl';
    int totalSize = 0;
    DateTime lastUpdateTime = DateTime.now();
    final speedSamples = <double>[];
    final downloadUri = Uri.parse(downloadUrl);
    final requestUrl = 'https://${downloadUri.host}/${downloadUri.queryParameters['file']}';

    try {
      final testResponse = await _dio.get(
        downloadUrl,
        options: Options(
          responseType: ResponseType.stream,
          headers: {
            'Referer': requestUrl,
          },
        ),
      );

      final contentLengthHeader = testResponse.headers.value('content-length');
      if (contentLengthHeader != null) {
        totalSize = int.parse(contentLengthHeader);
      }

      if (totalSize > 0 && totalSize < 10000 && !hasRetried) {
        final responseStream = testResponse.data as ResponseBody;
        final List<int> bytes = [];
        await for (final chunk in responseStream.stream) {
          bytes.addAll(chunk);
          if (bytes.length > 2048) break;
        }

        final content = String.fromCharCodes(bytes);

        final redirectMatch = RegExp(r'location\.href="([^"]+)"').firstMatch(content);
        if (redirectMatch != null) {
          final redirectPath = redirectMatch.group(1)!;
          
          final baseUrl = requestUrl.split('/').take(3).join('/');
          final redirectUrl = redirectPath.startsWith('/') ? '$baseUrl$redirectPath' : redirectPath;
          
          try {
            await _dio.get(redirectUrl, options: Options(
              headers: {
                'Referer': requestUrl,
              },
            ));

            await Future.delayed(const Duration(seconds: 1));

            return await _downloadSingleFile(downloadUrl, finalPath, originalFileName, fileIndex, totalFiles, hasRetried: true);
          } catch (e) {
            return false;
          }
        }
      }

      final response = await _dio.get<List<int>>(
        downloadUrl,
        cancelToken: _cancelToken,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Referer': requestUrl,
          },
        ),
        onReceiveProgress: (received, total) {
          totalSize = total;
          
          final now = DateTime.now();
          final timeDiff = now.difference(lastUpdateTime);

          if (timeDiff.inMilliseconds >= 1000 && speedSamples.isNotEmpty) {
            final speed = received / (timeDiff.inMilliseconds / 1000);
            speedSamples.add(speed);
            if (speedSamples.length > 5) {
              speedSamples.removeAt(0);
            }
            lastUpdateTime = now;
          }

          if (progressCallback != null) {
            final progress = total > 0 ? received / total : 0.0;
            progressCallback?.call(progress, originalFileName, received, total);
          }
        },
      );

      final bytes = Uint8List.fromList(response.data!);
      await File(tempPath).writeAsBytes(bytes);

      final actualSize = await File(tempPath).length();

      if (actualSize < 10000 && !hasRetried) {
        try {
          final content = await File(tempPath).readAsString();
          if (content.contains('<html') || content.contains('location.href')) {
            print('Still receiving HTML page after first retry. File may be expired or protected.');
            return false;
          }
        } catch (e) {
          print(e);
        }
      }

      if (totalSize == actualSize || (totalSize == 0 && actualSize > 0)) {
        await File(tempPath).rename(finalPath);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}