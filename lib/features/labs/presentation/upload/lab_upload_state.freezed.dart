// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LabUploadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabUploadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LabUploadState()';
}


}

/// @nodoc
class $LabUploadStateCopyWith<$Res>  {
$LabUploadStateCopyWith(LabUploadState _, $Res Function(LabUploadState) __);
}


/// Adds pattern-matching-related methods to [LabUploadState].
extension LabUploadStatePatterns on LabUploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LabUploadIdle value)?  idle,TResult Function( LabUploadUploading value)?  uploading,TResult Function( LabUploadSuccess value)?  success,TResult Function( LabUploadError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LabUploadIdle() when idle != null:
return idle(_that);case LabUploadUploading() when uploading != null:
return uploading(_that);case LabUploadSuccess() when success != null:
return success(_that);case LabUploadError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LabUploadIdle value)  idle,required TResult Function( LabUploadUploading value)  uploading,required TResult Function( LabUploadSuccess value)  success,required TResult Function( LabUploadError value)  error,}){
final _that = this;
switch (_that) {
case LabUploadIdle():
return idle(_that);case LabUploadUploading():
return uploading(_that);case LabUploadSuccess():
return success(_that);case LabUploadError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LabUploadIdle value)?  idle,TResult? Function( LabUploadUploading value)?  uploading,TResult? Function( LabUploadSuccess value)?  success,TResult? Function( LabUploadError value)?  error,}){
final _that = this;
switch (_that) {
case LabUploadIdle() when idle != null:
return idle(_that);case LabUploadUploading() when uploading != null:
return uploading(_that);case LabUploadSuccess() when success != null:
return success(_that);case LabUploadError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( double? progress)?  uploading,TResult Function( LabReport report)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LabUploadIdle() when idle != null:
return idle();case LabUploadUploading() when uploading != null:
return uploading(_that.progress);case LabUploadSuccess() when success != null:
return success(_that.report);case LabUploadError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( double? progress)  uploading,required TResult Function( LabReport report)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LabUploadIdle():
return idle();case LabUploadUploading():
return uploading(_that.progress);case LabUploadSuccess():
return success(_that.report);case LabUploadError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( double? progress)?  uploading,TResult? Function( LabReport report)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LabUploadIdle() when idle != null:
return idle();case LabUploadUploading() when uploading != null:
return uploading(_that.progress);case LabUploadSuccess() when success != null:
return success(_that.report);case LabUploadError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LabUploadIdle implements LabUploadState {
  const LabUploadIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabUploadIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LabUploadState.idle()';
}


}




/// @nodoc


class LabUploadUploading implements LabUploadState {
  const LabUploadUploading({this.progress});
  

 final  double? progress;

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabUploadUploadingCopyWith<LabUploadUploading> get copyWith => _$LabUploadUploadingCopyWithImpl<LabUploadUploading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabUploadUploading&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'LabUploadState.uploading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $LabUploadUploadingCopyWith<$Res> implements $LabUploadStateCopyWith<$Res> {
  factory $LabUploadUploadingCopyWith(LabUploadUploading value, $Res Function(LabUploadUploading) _then) = _$LabUploadUploadingCopyWithImpl;
@useResult
$Res call({
 double? progress
});




}
/// @nodoc
class _$LabUploadUploadingCopyWithImpl<$Res>
    implements $LabUploadUploadingCopyWith<$Res> {
  _$LabUploadUploadingCopyWithImpl(this._self, this._then);

  final LabUploadUploading _self;
  final $Res Function(LabUploadUploading) _then;

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = freezed,}) {
  return _then(LabUploadUploading(
progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class LabUploadSuccess implements LabUploadState {
  const LabUploadSuccess(this.report);
  

 final  LabReport report;

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabUploadSuccessCopyWith<LabUploadSuccess> get copyWith => _$LabUploadSuccessCopyWithImpl<LabUploadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabUploadSuccess&&(identical(other.report, report) || other.report == report));
}


@override
int get hashCode => Object.hash(runtimeType,report);

@override
String toString() {
  return 'LabUploadState.success(report: $report)';
}


}

/// @nodoc
abstract mixin class $LabUploadSuccessCopyWith<$Res> implements $LabUploadStateCopyWith<$Res> {
  factory $LabUploadSuccessCopyWith(LabUploadSuccess value, $Res Function(LabUploadSuccess) _then) = _$LabUploadSuccessCopyWithImpl;
@useResult
$Res call({
 LabReport report
});


$LabReportCopyWith<$Res> get report;

}
/// @nodoc
class _$LabUploadSuccessCopyWithImpl<$Res>
    implements $LabUploadSuccessCopyWith<$Res> {
  _$LabUploadSuccessCopyWithImpl(this._self, this._then);

  final LabUploadSuccess _self;
  final $Res Function(LabUploadSuccess) _then;

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? report = null,}) {
  return _then(LabUploadSuccess(
null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as LabReport,
  ));
}

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabReportCopyWith<$Res> get report {
  
  return $LabReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}

/// @nodoc


class LabUploadError implements LabUploadState {
  const LabUploadError(this.message);
  

 final  String message;

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabUploadErrorCopyWith<LabUploadError> get copyWith => _$LabUploadErrorCopyWithImpl<LabUploadError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabUploadError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LabUploadState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LabUploadErrorCopyWith<$Res> implements $LabUploadStateCopyWith<$Res> {
  factory $LabUploadErrorCopyWith(LabUploadError value, $Res Function(LabUploadError) _then) = _$LabUploadErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LabUploadErrorCopyWithImpl<$Res>
    implements $LabUploadErrorCopyWith<$Res> {
  _$LabUploadErrorCopyWithImpl(this._self, this._then);

  final LabUploadError _self;
  final $Res Function(LabUploadError) _then;

/// Create a copy of LabUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LabUploadError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
