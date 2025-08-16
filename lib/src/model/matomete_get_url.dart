import 'package:freezed_annotation/freezed_annotation.dart';

part 'matomete_get_url.g.dart';
part 'matomete_get_url.freezed.dart';

@freezed
abstract class MatometeGetUrl with _$MatometeGetUrl {
  const factory MatometeGetUrl({
    required int status,
    @JsonKey(name: 'file_name')
    String? fileName,
    String? url,
    String? delkey,
    String? jwt,
  }) = _MatometeGetUrl;

  factory MatometeGetUrl.fromJson(Map<String, dynamic> json) => _$MatometeGetUrlFromJson(json);
}