// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpVerifyState {

 bool get isSubmitting; bool get isResending; String? get errorMessage; int get resendCountdown;
/// Create a copy of OtpVerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpVerifyStateCopyWith<OtpVerifyState> get copyWith => _$OtpVerifyStateCopyWithImpl<OtpVerifyState>(this as OtpVerifyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpVerifyState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.resendCountdown, resendCountdown) || other.resendCountdown == resendCountdown));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,isResending,errorMessage,resendCountdown);

@override
String toString() {
  return 'OtpVerifyState(isSubmitting: $isSubmitting, isResending: $isResending, errorMessage: $errorMessage, resendCountdown: $resendCountdown)';
}


}

/// @nodoc
abstract mixin class $OtpVerifyStateCopyWith<$Res>  {
  factory $OtpVerifyStateCopyWith(OtpVerifyState value, $Res Function(OtpVerifyState) _then) = _$OtpVerifyStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, bool isResending, String? errorMessage, int resendCountdown
});




}
/// @nodoc
class _$OtpVerifyStateCopyWithImpl<$Res>
    implements $OtpVerifyStateCopyWith<$Res> {
  _$OtpVerifyStateCopyWithImpl(this._self, this._then);

  final OtpVerifyState _self;
  final $Res Function(OtpVerifyState) _then;

/// Create a copy of OtpVerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? isResending = null,Object? errorMessage = freezed,Object? resendCountdown = null,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpVerifyState].
extension OtpVerifyStatePatterns on OtpVerifyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpVerifyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpVerifyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpVerifyState value)  $default,){
final _that = this;
switch (_that) {
case _OtpVerifyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpVerifyState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpVerifyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSubmitting,  bool isResending,  String? errorMessage,  int resendCountdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpVerifyState() when $default != null:
return $default(_that.isSubmitting,_that.isResending,_that.errorMessage,_that.resendCountdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSubmitting,  bool isResending,  String? errorMessage,  int resendCountdown)  $default,) {final _that = this;
switch (_that) {
case _OtpVerifyState():
return $default(_that.isSubmitting,_that.isResending,_that.errorMessage,_that.resendCountdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSubmitting,  bool isResending,  String? errorMessage,  int resendCountdown)?  $default,) {final _that = this;
switch (_that) {
case _OtpVerifyState() when $default != null:
return $default(_that.isSubmitting,_that.isResending,_that.errorMessage,_that.resendCountdown);case _:
  return null;

}
}

}

/// @nodoc


class _OtpVerifyState implements OtpVerifyState {
  const _OtpVerifyState({this.isSubmitting = false, this.isResending = false, this.errorMessage, this.resendCountdown = 0});
  

@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isResending;
@override final  String? errorMessage;
@override@JsonKey() final  int resendCountdown;

/// Create a copy of OtpVerifyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpVerifyStateCopyWith<_OtpVerifyState> get copyWith => __$OtpVerifyStateCopyWithImpl<_OtpVerifyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpVerifyState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.resendCountdown, resendCountdown) || other.resendCountdown == resendCountdown));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,isResending,errorMessage,resendCountdown);

@override
String toString() {
  return 'OtpVerifyState(isSubmitting: $isSubmitting, isResending: $isResending, errorMessage: $errorMessage, resendCountdown: $resendCountdown)';
}


}

/// @nodoc
abstract mixin class _$OtpVerifyStateCopyWith<$Res> implements $OtpVerifyStateCopyWith<$Res> {
  factory _$OtpVerifyStateCopyWith(_OtpVerifyState value, $Res Function(_OtpVerifyState) _then) = __$OtpVerifyStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, bool isResending, String? errorMessage, int resendCountdown
});




}
/// @nodoc
class __$OtpVerifyStateCopyWithImpl<$Res>
    implements _$OtpVerifyStateCopyWith<$Res> {
  __$OtpVerifyStateCopyWithImpl(this._self, this._then);

  final _OtpVerifyState _self;
  final $Res Function(_OtpVerifyState) _then;

/// Create a copy of OtpVerifyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? isResending = null,Object? errorMessage = freezed,Object? resendCountdown = null,}) {
  return _then(_OtpVerifyState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
