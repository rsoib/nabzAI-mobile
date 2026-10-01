// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_entry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneEntryState {

 bool get isSubmitting; String? get errorMessage;
/// Create a copy of PhoneEntryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneEntryStateCopyWith<PhoneEntryState> get copyWith => _$PhoneEntryStateCopyWithImpl<PhoneEntryState>(this as PhoneEntryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneEntryState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,errorMessage);

@override
String toString() {
  return 'PhoneEntryState(isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PhoneEntryStateCopyWith<$Res>  {
  factory $PhoneEntryStateCopyWith(PhoneEntryState value, $Res Function(PhoneEntryState) _then) = _$PhoneEntryStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class _$PhoneEntryStateCopyWithImpl<$Res>
    implements $PhoneEntryStateCopyWith<$Res> {
  _$PhoneEntryStateCopyWithImpl(this._self, this._then);

  final PhoneEntryState _self;
  final $Res Function(PhoneEntryState) _then;

/// Create a copy of PhoneEntryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneEntryState].
extension PhoneEntryStatePatterns on PhoneEntryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneEntryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneEntryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneEntryState value)  $default,){
final _that = this;
switch (_that) {
case _PhoneEntryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneEntryState value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneEntryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSubmitting,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneEntryState() when $default != null:
return $default(_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSubmitting,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PhoneEntryState():
return $default(_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSubmitting,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PhoneEntryState() when $default != null:
return $default(_that.isSubmitting,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PhoneEntryState implements PhoneEntryState {
  const _PhoneEntryState({this.isSubmitting = false, this.errorMessage});
  

@override@JsonKey() final  bool isSubmitting;
@override final  String? errorMessage;

/// Create a copy of PhoneEntryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneEntryStateCopyWith<_PhoneEntryState> get copyWith => __$PhoneEntryStateCopyWithImpl<_PhoneEntryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneEntryState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,errorMessage);

@override
String toString() {
  return 'PhoneEntryState(isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PhoneEntryStateCopyWith<$Res> implements $PhoneEntryStateCopyWith<$Res> {
  factory _$PhoneEntryStateCopyWith(_PhoneEntryState value, $Res Function(_PhoneEntryState) _then) = __$PhoneEntryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class __$PhoneEntryStateCopyWithImpl<$Res>
    implements _$PhoneEntryStateCopyWith<$Res> {
  __$PhoneEntryStateCopyWithImpl(this._self, this._then);

  final _PhoneEntryState _self;
  final $Res Function(_PhoneEntryState) _then;

/// Create a copy of PhoneEntryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_PhoneEntryState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
