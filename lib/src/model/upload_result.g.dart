// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadResultData _$UploadResultDataFromJson(Map<String, dynamic> json) =>
    _UploadResultData(
      status: (json['status'] as num).toInt(),
      url: json['url'] as String?,
      delkey: json['delkey'] as String?,
      filename: json['filename'] as String?,
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$UploadResultDataToJson(_UploadResultData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'url': instance.url,
      'delkey': instance.delkey,
      'filename': instance.filename,
      'jwt': instance.jwt,
    };
