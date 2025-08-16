// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matomete_get_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatometeGetUrl {

 int get status;@JsonKey(name: 'file_name') String? get fileName; String? get url; String? get delkey; String? get jwt;
/// Create a copy of MatometeGetUrl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatometeGetUrlCopyWith<MatometeGetUrl> get copyWith => _$MatometeGetUrlCopyWithImpl<MatometeGetUrl>(this as MatometeGetUrl, _$identity);

  /// Serializes this MatometeGetUrl to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatometeGetUrl&&(identical(other.status, status) || other.status == status)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.url, url) || other.url == url)&&(identical(other.delkey, delkey) || other.delkey == delkey)&&(identical(other.jwt, jwt) || other.jwt == jwt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,fileName,url,delkey,jwt);

@override
String toString() {
  return 'MatometeGetUrl(status: $status, fileName: $fileName, url: $url, delkey: $delkey, jwt: $jwt)';
}


}

/// @nodoc
abstract mixin class $MatometeGetUrlCopyWith<$Res>  {
  factory $MatometeGetUrlCopyWith(MatometeGetUrl value, $Res Function(MatometeGetUrl) _then) = _$MatometeGetUrlCopyWithImpl;
@useResult
$Res call({
 int status,@JsonKey(name: 'file_name') String? fileName, String? url, String? delkey, String? jwt
});




}
/// @nodoc
class _$MatometeGetUrlCopyWithImpl<$Res>
    implements $MatometeGetUrlCopyWith<$Res> {
  _$MatometeGetUrlCopyWithImpl(this._self, this._then);

  final MatometeGetUrl _self;
  final $Res Function(MatometeGetUrl) _then;

/// Create a copy of MatometeGetUrl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? fileName = freezed,Object? url = freezed,Object? delkey = freezed,Object? jwt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,delkey: freezed == delkey ? _self.delkey : delkey // ignore: cast_nullable_to_non_nullable
as String?,jwt: freezed == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatometeGetUrl].
extension MatometeGetUrlPatterns on MatometeGetUrl {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatometeGetUrl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatometeGetUrl() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatometeGetUrl value)  $default,){
final _that = this;
switch (_that) {
case _MatometeGetUrl():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatometeGetUrl value)?  $default,){
final _that = this;
switch (_that) {
case _MatometeGetUrl() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int status, @JsonKey(name: 'file_name')  String? fileName,  String? url,  String? delkey,  String? jwt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatometeGetUrl() when $default != null:
return $default(_that.status,_that.fileName,_that.url,_that.delkey,_that.jwt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int status, @JsonKey(name: 'file_name')  String? fileName,  String? url,  String? delkey,  String? jwt)  $default,) {final _that = this;
switch (_that) {
case _MatometeGetUrl():
return $default(_that.status,_that.fileName,_that.url,_that.delkey,_that.jwt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int status, @JsonKey(name: 'file_name')  String? fileName,  String? url,  String? delkey,  String? jwt)?  $default,) {final _that = this;
switch (_that) {
case _MatometeGetUrl() when $default != null:
return $default(_that.status,_that.fileName,_that.url,_that.delkey,_that.jwt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatometeGetUrl implements MatometeGetUrl {
  const _MatometeGetUrl({required this.status, @JsonKey(name: 'file_name') this.fileName, this.url, this.delkey, this.jwt});
  factory _MatometeGetUrl.fromJson(Map<String, dynamic> json) => _$MatometeGetUrlFromJson(json);

@override final  int status;
@override@JsonKey(name: 'file_name') final  String? fileName;
@override final  String? url;
@override final  String? delkey;
@override final  String? jwt;

/// Create a copy of MatometeGetUrl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatometeGetUrlCopyWith<_MatometeGetUrl> get copyWith => __$MatometeGetUrlCopyWithImpl<_MatometeGetUrl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatometeGetUrlToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatometeGetUrl&&(identical(other.status, status) || other.status == status)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.url, url) || other.url == url)&&(identical(other.delkey, delkey) || other.delkey == delkey)&&(identical(other.jwt, jwt) || other.jwt == jwt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,fileName,url,delkey,jwt);

@override
String toString() {
  return 'MatometeGetUrl(status: $status, fileName: $fileName, url: $url, delkey: $delkey, jwt: $jwt)';
}


}

/// @nodoc
abstract mixin class _$MatometeGetUrlCopyWith<$Res> implements $MatometeGetUrlCopyWith<$Res> {
  factory _$MatometeGetUrlCopyWith(_MatometeGetUrl value, $Res Function(_MatometeGetUrl) _then) = __$MatometeGetUrlCopyWithImpl;
@override @useResult
$Res call({
 int status,@JsonKey(name: 'file_name') String? fileName, String? url, String? delkey, String? jwt
});




}
/// @nodoc
class __$MatometeGetUrlCopyWithImpl<$Res>
    implements _$MatometeGetUrlCopyWith<$Res> {
  __$MatometeGetUrlCopyWithImpl(this._self, this._then);

  final _MatometeGetUrl _self;
  final $Res Function(_MatometeGetUrl) _then;

/// Create a copy of MatometeGetUrl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? fileName = freezed,Object? url = freezed,Object? delkey = freezed,Object? jwt = freezed,}) {
  return _then(_MatometeGetUrl(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,delkey: freezed == delkey ? _self.delkey : delkey // ignore: cast_nullable_to_non_nullable
as String?,jwt: freezed == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
