// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaints_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComplaintsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintsState()';
}


}

/// @nodoc
class $ComplaintsStateCopyWith<$Res>  {
$ComplaintsStateCopyWith(ComplaintsState _, $Res Function(ComplaintsState) __);
}


/// Adds pattern-matching-related methods to [ComplaintsState].
extension ComplaintsStatePatterns on ComplaintsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ComplaintsLoading value)?  loading,TResult Function( ComplaintsActive value)?  active,TResult Function( ComplaintsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ComplaintsLoading() when loading != null:
return loading(_that);case ComplaintsActive() when active != null:
return active(_that);case ComplaintsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ComplaintsLoading value)  loading,required TResult Function( ComplaintsActive value)  active,required TResult Function( ComplaintsError value)  error,}){
final _that = this;
switch (_that) {
case ComplaintsLoading():
return loading(_that);case ComplaintsActive():
return active(_that);case ComplaintsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ComplaintsLoading value)?  loading,TResult? Function( ComplaintsActive value)?  active,TResult? Function( ComplaintsError value)?  error,}){
final _that = this;
switch (_that) {
case ComplaintsLoading() when loading != null:
return loading(_that);case ComplaintsActive() when active != null:
return active(_that);case ComplaintsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( ComplaintSession session,  bool sending,  String? errorMessage)?  active,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ComplaintsLoading() when loading != null:
return loading();case ComplaintsActive() when active != null:
return active(_that.session,_that.sending,_that.errorMessage);case ComplaintsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( ComplaintSession session,  bool sending,  String? errorMessage)  active,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ComplaintsLoading():
return loading();case ComplaintsActive():
return active(_that.session,_that.sending,_that.errorMessage);case ComplaintsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( ComplaintSession session,  bool sending,  String? errorMessage)?  active,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ComplaintsLoading() when loading != null:
return loading();case ComplaintsActive() when active != null:
return active(_that.session,_that.sending,_that.errorMessage);case ComplaintsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ComplaintsLoading implements ComplaintsState {
  const ComplaintsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintsState.loading()';
}


}




/// @nodoc


class ComplaintsActive implements ComplaintsState {
  const ComplaintsActive(this.session, {this.sending = false, this.errorMessage});
  

 final  ComplaintSession session;
@JsonKey() final  bool sending;
 final  String? errorMessage;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintsActiveCopyWith<ComplaintsActive> get copyWith => _$ComplaintsActiveCopyWithImpl<ComplaintsActive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsActive&&(identical(other.session, session) || other.session == session)&&(identical(other.sending, sending) || other.sending == sending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,session,sending,errorMessage);

@override
String toString() {
  return 'ComplaintsState.active(session: $session, sending: $sending, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ComplaintsActiveCopyWith<$Res> implements $ComplaintsStateCopyWith<$Res> {
  factory $ComplaintsActiveCopyWith(ComplaintsActive value, $Res Function(ComplaintsActive) _then) = _$ComplaintsActiveCopyWithImpl;
@useResult
$Res call({
 ComplaintSession session, bool sending, String? errorMessage
});


$ComplaintSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$ComplaintsActiveCopyWithImpl<$Res>
    implements $ComplaintsActiveCopyWith<$Res> {
  _$ComplaintsActiveCopyWithImpl(this._self, this._then);

  final ComplaintsActive _self;
  final $Res Function(ComplaintsActive) _then;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? sending = null,Object? errorMessage = freezed,}) {
  return _then(ComplaintsActive(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as ComplaintSession,sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComplaintSessionCopyWith<$Res> get session {
  
  return $ComplaintSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class ComplaintsError implements ComplaintsState {
  const ComplaintsError(this.message);
  

 final  String message;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintsErrorCopyWith<ComplaintsError> get copyWith => _$ComplaintsErrorCopyWithImpl<ComplaintsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ComplaintsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ComplaintsErrorCopyWith<$Res> implements $ComplaintsStateCopyWith<$Res> {
  factory $ComplaintsErrorCopyWith(ComplaintsError value, $Res Function(ComplaintsError) _then) = _$ComplaintsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ComplaintsErrorCopyWithImpl<$Res>
    implements $ComplaintsErrorCopyWith<$Res> {
  _$ComplaintsErrorCopyWithImpl(this._self, this._then);

  final ComplaintsError _self;
  final $Res Function(ComplaintsError) _then;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ComplaintsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
