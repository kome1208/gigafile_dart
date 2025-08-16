// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloadResult {

 String get downloadedFile; bool get success; String? get error;
/// Create a copy of DownloadResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadResultCopyWith<DownloadResult> get copyWith => _$DownloadResultCopyWithImpl<DownloadResult>(this as DownloadResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadResult&&(identical(other.downloadedFile, downloadedFile) || other.downloadedFile == downloadedFile)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,downloadedFile,success,error);

@override
String toString() {
  return 'DownloadResult(downloadedFile: $downloadedFile, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class $DownloadResultCopyWith<$Res>  {
  factory $DownloadResultCopyWith(DownloadResult value, $Res Function(DownloadResult) _then) = _$DownloadResultCopyWithImpl;
@useResult
$Res call({
 String downloadedFile, bool success, String? error
});




}
/// @nodoc
class _$DownloadResultCopyWithImpl<$Res>
    implements $DownloadResultCopyWith<$Res> {
  _$DownloadResultCopyWithImpl(this._self, this._then);

  final DownloadResult _self;
  final $Res Function(DownloadResult) _then;

/// Create a copy of DownloadResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downloadedFile = null,Object? success = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
downloadedFile: null == downloadedFile ? _self.downloadedFile : downloadedFile // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadResult].
extension DownloadResultPatterns on DownloadResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadResult value)  $default,){
final _that = this;
switch (_that) {
case _DownloadResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadResult value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String downloadedFile,  bool success,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadResult() when $default != null:
return $default(_that.downloadedFile,_that.success,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String downloadedFile,  bool success,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DownloadResult():
return $default(_that.downloadedFile,_that.success,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String downloadedFile,  bool success,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DownloadResult() when $default != null:
return $default(_that.downloadedFile,_that.success,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DownloadResult implements DownloadResult {
  const _DownloadResult({required this.downloadedFile, required this.success, this.error});
  

@override final  String downloadedFile;
@override final  bool success;
@override final  String? error;

/// Create a copy of DownloadResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadResultCopyWith<_DownloadResult> get copyWith => __$DownloadResultCopyWithImpl<_DownloadResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadResult&&(identical(other.downloadedFile, downloadedFile) || other.downloadedFile == downloadedFile)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,downloadedFile,success,error);

@override
String toString() {
  return 'DownloadResult(downloadedFile: $downloadedFile, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DownloadResultCopyWith<$Res> implements $DownloadResultCopyWith<$Res> {
  factory _$DownloadResultCopyWith(_DownloadResult value, $Res Function(_DownloadResult) _then) = __$DownloadResultCopyWithImpl;
@override @useResult
$Res call({
 String downloadedFile, bool success, String? error
});




}
/// @nodoc
class __$DownloadResultCopyWithImpl<$Res>
    implements _$DownloadResultCopyWith<$Res> {
  __$DownloadResultCopyWithImpl(this._self, this._then);

  final _DownloadResult _self;
  final $Res Function(_DownloadResult) _then;

/// Create a copy of DownloadResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downloadedFile = null,Object? success = null,Object? error = freezed,}) {
  return _then(_DownloadResult(
downloadedFile: null == downloadedFile ? _self.downloadedFile : downloadedFile // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
