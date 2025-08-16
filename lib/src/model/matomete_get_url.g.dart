// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matomete_get_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatometeGetUrl _$MatometeGetUrlFromJson(Map<String, dynamic> json) =>
    _MatometeGetUrl(
      status: (json['status'] as num).toInt(),
      fileName: json['file_name'] as String?,
      url: json['url'] as String?,
      delkey: json['delkey'] as String?,
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$MatometeGetUrlToJson(_MatometeGetUrl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'file_name': instance.fileName,
      'url': instance.url,
      'delkey': instance.delkey,
      'jwt': instance.jwt,
    };
