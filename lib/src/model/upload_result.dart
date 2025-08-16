import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_result.g.dart';
part 'upload_result.freezed.dart';

@freezed
abstract class UploadResult with _$UploadResult {
  const factory UploadResult({
    UploadResultData? data,
    required bool success,
    String? error,
  }) = _UploadResult;

  factory UploadResult.success(Map<String, dynamic> data) {
    return UploadResult(
      data: UploadResultData.fromJson(data),
      success: true,
    );
  }

  factory UploadResult.failure(String error) {
    return UploadResult(
      success: false,
      error: error,
    );
  }
}

@freezed
abstract class UploadResultData with _$UploadResultData {
  const factory UploadResultData({
    required int status,
    String? url,
    String? delkey,
    String? filename,
    String? jwt,
  }) = _UploadResultData;

  factory UploadResultData.fromJson(Map<String, dynamic> json) => _$UploadResultDataFromJson(json);
}