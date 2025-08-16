// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadResult {

 UploadResultData? get data; bool get success; String? get error;
/// Create a copy of UploadResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResultCopyWith<UploadResult> get copyWith => _$UploadResultCopyWithImpl<UploadResult>(this as UploadResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResult&&(identical(other.data, data) || other.data == data)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,data,success,error);

@override
String toString() {
  return 'UploadResult(data: $data, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class $UploadResultCopyWith<$Res>  {
  factory $UploadResultCopyWith(UploadResult value, $Res Function(UploadResult) _then) = _$UploadResultCopyWithImpl;
@useResult
$Res call({
 UploadResultData? data, bool success, String? error
});


$UploadResultDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$UploadResultCopyWithImpl<$Res>
    implements $UploadResultCopyWith<$Res> {
  _$UploadResultCopyWithImpl(this._self, this._then);

  final UploadResult _self;
  final $Res Function(UploadResult) _then;

/// Create a copy of UploadResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? success = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UploadResultData?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UploadResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UploadResultDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UploadResultDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UploadResult].
extension UploadResultPatterns on UploadResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadResult value)  $default,){
final _that = this;
switch (_that) {
case _UploadResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadResult value)?  $default,){
final _that = this;
switch (_that) {
case _UploadResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UploadResultData? data,  bool success,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResult() when $default != null:
return $default(_that.data,_that.success,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UploadResultData? data,  bool success,  String? error)  $default,) {final _that = this;
switch (_that) {
case _UploadResult():
return $default(_that.data,_that.success,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UploadResultData? data,  bool success,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _UploadResult() when $default != null:
return $default(_that.data,_that.success,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _UploadResult implements UploadResult {
  const _UploadResult({this.data, required this.success, this.error});
  

@override final  UploadResultData? data;
@override final  bool success;
@override final  String? error;

/// Create a copy of UploadResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResultCopyWith<_UploadResult> get copyWith => __$UploadResultCopyWithImpl<_UploadResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResult&&(identical(other.data, data) || other.data == data)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,data,success,error);

@override
String toString() {
  return 'UploadResult(data: $data, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class _$UploadResultCopyWith<$Res> implements $UploadResultCopyWith<$Res> {
  factory _$UploadResultCopyWith(_UploadResult value, $Res Function(_UploadResult) _then) = __$UploadResultCopyWithImpl;
@override @useResult
$Res call({
 UploadResultData? data, bool success, String? error
});


@override $UploadResultDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$UploadResultCopyWithImpl<$Res>
    implements _$UploadResultCopyWith<$Res> {
  __$UploadResultCopyWithImpl(this._self, this._then);

  final _UploadResult _self;
  final $Res Function(_UploadResult) _then;

/// Create a copy of UploadResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? success = null,Object? error = freezed,}) {
  return _then(_UploadResult(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UploadResultData?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UploadResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UploadResultDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UploadResultDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UploadResultData {

 int get status; String? get url; String? get delkey; String? get filename; String? get jwt;
/// Create a copy of UploadResultData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResultDataCopyWith<UploadResultData> get copyWith => _$UploadResultDataCopyWithImpl<UploadResultData>(this as UploadResultData, _$identity);

  /// Serializes this UploadResultData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResultData&&(identical(other.status, status) || other.status == status)&&(identical(other.url, url) || other.url == url)&&(identical(other.delkey, delkey) || other.delkey == delkey)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.jwt, jwt) || other.jwt == jwt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,url,delkey,filename,jwt);

@override
String toString() {
  return 'UploadResultData(status: $status, url: $url, delkey: $delkey, filename: $filename, jwt: $jwt)';
}


}

/// @nodoc
abstract mixin class $UploadResultDataCopyWith<$Res>  {
  factory $UploadResultDataCopyWith(UploadResultData value, $Res Function(UploadResultData) _then) = _$UploadResultDataCopyWithImpl;
@useResult
$Res call({
 int status, String? url, String? delkey, String? filename, String? jwt
});




}
/// @nodoc
class _$UploadResultDataCopyWithImpl<$Res>
    implements $UploadResultDataCopyWith<$Res> {
  _$UploadResultDataCopyWithImpl(this._self, this._then);

  final UploadResultData _self;
  final $Res Function(UploadResultData) _then;

/// Create a copy of UploadResultData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? url = freezed,Object? delkey = freezed,Object? filename = freezed,Object? jwt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,delkey: freezed == delkey ? _self.delkey : delkey // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,jwt: freezed == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadResultData].
extension UploadResultDataPatterns on UploadResultData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadResultData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResultData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadResultData value)  $default,){
final _that = this;
switch (_that) {
case _UploadResultData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadResultData value)?  $default,){
final _that = this;
switch (_that) {
case _UploadResultData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int status,  String? url,  String? delkey,  String? filename,  String? jwt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResultData() when $default != null:
return $default(_that.status,_that.url,_that.delkey,_that.filename,_that.jwt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int status,  String? url,  String? delkey,  String? filename,  String? jwt)  $default,) {final _that = this;
switch (_that) {
case _UploadResultData():
return $default(_that.status,_that.url,_that.delkey,_that.filename,_that.jwt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int status,  String? url,  String? delkey,  String? filename,  String? jwt)?  $default,) {final _that = this;
switch (_that) {
case _UploadResultData() when $default != null:
return $default(_that.status,_that.url,_that.delkey,_that.filename,_that.jwt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadResultData implements UploadResultData {
  const _UploadResultData({required this.status, this.url, this.delkey, this.filename, this.jwt});
  factory _UploadResultData.fromJson(Map<String, dynamic> json) => _$UploadResultDataFromJson(json);

@override final  int status;
@override final  String? url;
@override final  String? delkey;
@override final  String? filename;
@override final  String? jwt;

/// Create a copy of UploadResultData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResultDataCopyWith<_UploadResultData> get copyWith => __$UploadResultDataCopyWithImpl<_UploadResultData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadResultDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResultData&&(identical(other.status, status) || other.status == status)&&(identical(other.url, url) || other.url == url)&&(identical(other.delkey, delkey) || other.delkey == delkey)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.jwt, jwt) || other.jwt == jwt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,url,delkey,filename,jwt);

@override
String toString() {
  return 'UploadResultData(status: $status, url: $url, delkey: $delkey, filename: $filename, jwt: $jwt)';
}


}

/// @nodoc
abstract mixin class _$UploadResultDataCopyWith<$Res> implements $UploadResultDataCopyWith<$Res> {
  factory _$UploadResultDataCopyWith(_UploadResultData value, $Res Function(_UploadResultData) _then) = __$UploadResultDataCopyWithImpl;
@override @useResult
$Res call({
 int status, String? url, String? delkey, String? filename, String? jwt
});




}
/// @nodoc
class __$UploadResultDataCopyWithImpl<$Res>
    implements _$UploadResultDataCopyWith<$Res> {
  __$UploadResultDataCopyWithImpl(this._self, this._then);

  final _UploadResultData _self;
  final $Res Function(_UploadResultData) _then;

/// Create a copy of UploadResultData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? url = freezed,Object? delkey = freezed,Object? filename = freezed,Object? jwt = freezed,}) {
  return _then(_UploadResultData(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,delkey: freezed == delkey ? _self.delkey : delkey // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,jwt: freezed == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
