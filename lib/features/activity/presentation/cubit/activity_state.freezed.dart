// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityState()';
}


}

/// @nodoc
class $ActivityStateCopyWith<$Res>  {
$ActivityStateCopyWith(ActivityState _, $Res Function(ActivityState) __);
}


/// Adds pattern-matching-related methods to [ActivityState].
extension ActivityStatePatterns on ActivityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActivityNotConnected value)?  notConnected,TResult Function( ActivityLoading value)?  loading,TResult Function( ActivityConnected value)?  connected,TResult Function( ActivityError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActivityNotConnected() when notConnected != null:
return notConnected(_that);case ActivityLoading() when loading != null:
return loading(_that);case ActivityConnected() when connected != null:
return connected(_that);case ActivityError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActivityNotConnected value)  notConnected,required TResult Function( ActivityLoading value)  loading,required TResult Function( ActivityConnected value)  connected,required TResult Function( ActivityError value)  error,}){
final _that = this;
switch (_that) {
case ActivityNotConnected():
return notConnected(_that);case ActivityLoading():
return loading(_that);case ActivityConnected():
return connected(_that);case ActivityError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActivityNotConnected value)?  notConnected,TResult? Function( ActivityLoading value)?  loading,TResult? Function( ActivityConnected value)?  connected,TResult? Function( ActivityError value)?  error,}){
final _that = this;
switch (_that) {
case ActivityNotConnected() when notConnected != null:
return notConnected(_that);case ActivityLoading() when loading != null:
return loading(_that);case ActivityConnected() when connected != null:
return connected(_that);case ActivityError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notConnected,TResult Function()?  loading,TResult Function( List<DailyHealthMetric> metrics)?  connected,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActivityNotConnected() when notConnected != null:
return notConnected();case ActivityLoading() when loading != null:
return loading();case ActivityConnected() when connected != null:
return connected(_that.metrics);case ActivityError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notConnected,required TResult Function()  loading,required TResult Function( List<DailyHealthMetric> metrics)  connected,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ActivityNotConnected():
return notConnected();case ActivityLoading():
return loading();case ActivityConnected():
return connected(_that.metrics);case ActivityError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notConnected,TResult? Function()?  loading,TResult? Function( List<DailyHealthMetric> metrics)?  connected,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ActivityNotConnected() when notConnected != null:
return notConnected();case ActivityLoading() when loading != null:
return loading();case ActivityConnected() when connected != null:
return connected(_that.metrics);case ActivityError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ActivityNotConnected implements ActivityState {
  const ActivityNotConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityNotConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityState.notConnected()';
}


}




/// @nodoc


class ActivityLoading implements ActivityState {
  const ActivityLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityState.loading()';
}


}




/// @nodoc


class ActivityConnected implements ActivityState {
  const ActivityConnected(final  List<DailyHealthMetric> metrics): _metrics = metrics;
  

 final  List<DailyHealthMetric> _metrics;
 List<DailyHealthMetric> get metrics {
  if (_metrics is EqualUnmodifiableListView) return _metrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_metrics);
}


/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityConnectedCopyWith<ActivityConnected> get copyWith => _$ActivityConnectedCopyWithImpl<ActivityConnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityConnected&&const DeepCollectionEquality().equals(other._metrics, _metrics));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_metrics));

@override
String toString() {
  return 'ActivityState.connected(metrics: $metrics)';
}


}

/// @nodoc
abstract mixin class $ActivityConnectedCopyWith<$Res> implements $ActivityStateCopyWith<$Res> {
  factory $ActivityConnectedCopyWith(ActivityConnected value, $Res Function(ActivityConnected) _then) = _$ActivityConnectedCopyWithImpl;
@useResult
$Res call({
 List<DailyHealthMetric> metrics
});




}
/// @nodoc
class _$ActivityConnectedCopyWithImpl<$Res>
    implements $ActivityConnectedCopyWith<$Res> {
  _$ActivityConnectedCopyWithImpl(this._self, this._then);

  final ActivityConnected _self;
  final $Res Function(ActivityConnected) _then;

/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? metrics = null,}) {
  return _then(ActivityConnected(
null == metrics ? _self._metrics : metrics // ignore: cast_nullable_to_non_nullable
as List<DailyHealthMetric>,
  ));
}


}

/// @nodoc


class ActivityError implements ActivityState {
  const ActivityError(this.message);
  

 final  String message;

/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityErrorCopyWith<ActivityError> get copyWith => _$ActivityErrorCopyWithImpl<ActivityError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ActivityState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ActivityErrorCopyWith<$Res> implements $ActivityStateCopyWith<$Res> {
  factory $ActivityErrorCopyWith(ActivityError value, $Res Function(ActivityError) _then) = _$ActivityErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ActivityErrorCopyWithImpl<$Res>
    implements $ActivityErrorCopyWith<$Res> {
  _$ActivityErrorCopyWithImpl(this._self, this._then);

  final ActivityError _self;
  final $Res Function(ActivityError) _then;

/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ActivityError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
