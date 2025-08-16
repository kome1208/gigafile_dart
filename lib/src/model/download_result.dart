import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_result.freezed.dart';

@freezed
abstract class DownloadResult with _$DownloadResult {
  const factory DownloadResult({
    required String downloadedFile,
    required bool success,
    String? error,
  }) = _DownloadResult;

  factory DownloadResult.success(String file) {
    return DownloadResult(
      downloadedFile: file,
      success: true,
    );
  }

  factory DownloadResult.failure(String error) {
    return DownloadResult(
      downloadedFile: '',
      success: false,
      error: error,
    );
  }
}