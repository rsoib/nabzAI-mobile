// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_health_metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyHealthMetric {

 String get date; MetricSource get source; int? get steps; int? get restingHr; int? get avgHr; int? get minHr; int? get maxHr;
/// Create a copy of DailyHealthMetric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyHealthMetricCopyWith<DailyHealthMetric> get copyWith => _$DailyHealthMetricCopyWithImpl<DailyHealthMetric>(this as DailyHealthMetric, _$identity);

  /// Serializes this DailyHealthMetric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyHealthMetric&&(identical(other.date, date) || other.date == date)&&(identical(other.source, source) || other.source == source)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.restingHr, restingHr) || other.restingHr == restingHr)&&(identical(other.avgHr, avgHr) || other.avgHr == avgHr)&&(identical(other.minHr, minHr) || other.minHr == minHr)&&(identical(other.maxHr, maxHr) || other.maxHr == maxHr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,source,steps,restingHr,avgHr,minHr,maxHr);

@override
String toString() {
  return 'DailyHealthMetric(date: $date, source: $source, steps: $steps, restingHr: $restingHr, avgHr: $avgHr, minHr: $minHr, maxHr: $maxHr)';
}


}

/// @nodoc
abstract mixin class $DailyHealthMetricCopyWith<$Res>  {
  factory $DailyHealthMetricCopyWith(DailyHealthMetric value, $Res Function(DailyHealthMetric) _then) = _$DailyHealthMetricCopyWithImpl;
@useResult
$Res call({
 String date, MetricSource source, int? steps, int? restingHr, int? avgHr, int? minHr, int? maxHr
});




}
/// @nodoc
class _$DailyHealthMetricCopyWithImpl<$Res>
    implements $DailyHealthMetricCopyWith<$Res> {
  _$DailyHealthMetricCopyWithImpl(this._self, this._then);

  final DailyHealthMetric _self;
  final $Res Function(DailyHealthMetric) _then;

/// Create a copy of DailyHealthMetric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? source = null,Object? steps = freezed,Object? restingHr = freezed,Object? avgHr = freezed,Object? minHr = freezed,Object? maxHr = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MetricSource,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int?,restingHr: freezed == restingHr ? _self.restingHr : restingHr // ignore: cast_nullable_to_non_nullable
as int?,avgHr: freezed == avgHr ? _self.avgHr : avgHr // ignore: cast_nullable_to_non_nullable
as int?,minHr: freezed == minHr ? _self.minHr : minHr // ignore: cast_nullable_to_non_nullable
as int?,maxHr: freezed == maxHr ? _self.maxHr : maxHr // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyHealthMetric].
extension DailyHealthMetricPatterns on DailyHealthMetric {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyHealthMetric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyHealthMetric() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyHealthMetric value)  $default,){
final _that = this;
switch (_that) {
case _DailyHealthMetric():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyHealthMetric value)?  $default,){
final _that = this;
switch (_that) {
case _DailyHealthMetric() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  MetricSource source,  int? steps,  int? restingHr,  int? avgHr,  int? minHr,  int? maxHr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyHealthMetric() when $default != null:
return $default(_that.date,_that.source,_that.steps,_that.restingHr,_that.avgHr,_that.minHr,_that.maxHr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  MetricSource source,  int? steps,  int? restingHr,  int? avgHr,  int? minHr,  int? maxHr)  $default,) {final _that = this;
switch (_that) {
case _DailyHealthMetric():
return $default(_that.date,_that.source,_that.steps,_that.restingHr,_that.avgHr,_that.minHr,_that.maxHr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  MetricSource source,  int? steps,  int? restingHr,  int? avgHr,  int? minHr,  int? maxHr)?  $default,) {final _that = this;
switch (_that) {
case _DailyHealthMetric() when $default != null:
return $default(_that.date,_that.source,_that.steps,_that.restingHr,_that.avgHr,_that.minHr,_that.maxHr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyHealthMetric implements DailyHealthMetric {
  const _DailyHealthMetric({required this.date, required this.source, this.steps, this.restingHr, this.avgHr, this.minHr, this.maxHr});
  factory _DailyHealthMetric.fromJson(Map<String, dynamic> json) => _$DailyHealthMetricFromJson(json);

@override final  String date;
@override final  MetricSource source;
@override final  int? steps;
@override final  int? restingHr;
@override final  int? avgHr;
@override final  int? minHr;
@override final  int? maxHr;

/// Create a copy of DailyHealthMetric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyHealthMetricCopyWith<_DailyHealthMetric> get copyWith => __$DailyHealthMetricCopyWithImpl<_DailyHealthMetric>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyHealthMetricToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyHealthMetric&&(identical(other.date, date) || other.date == date)&&(identical(other.source, source) || other.source == source)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.restingHr, restingHr) || other.restingHr == restingHr)&&(identical(other.avgHr, avgHr) || other.avgHr == avgHr)&&(identical(other.minHr, minHr) || other.minHr == minHr)&&(identical(other.maxHr, maxHr) || other.maxHr == maxHr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,source,steps,restingHr,avgHr,minHr,maxHr);

@override
String toString() {
  return 'DailyHealthMetric(date: $date, source: $source, steps: $steps, restingHr: $restingHr, avgHr: $avgHr, minHr: $minHr, maxHr: $maxHr)';
}


}

/// @nodoc
abstract mixin class _$DailyHealthMetricCopyWith<$Res> implements $DailyHealthMetricCopyWith<$Res> {
  factory _$DailyHealthMetricCopyWith(_DailyHealthMetric value, $Res Function(_DailyHealthMetric) _then) = __$DailyHealthMetricCopyWithImpl;
@override @useResult
$Res call({
 String date, MetricSource source, int? steps, int? restingHr, int? avgHr, int? minHr, int? maxHr
});




}
/// @nodoc
class __$DailyHealthMetricCopyWithImpl<$Res>
    implements _$DailyHealthMetricCopyWith<$Res> {
  __$DailyHealthMetricCopyWithImpl(this._self, this._then);

  final _DailyHealthMetric _self;
  final $Res Function(_DailyHealthMetric) _then;

/// Create a copy of DailyHealthMetric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? source = null,Object? steps = freezed,Object? restingHr = freezed,Object? avgHr = freezed,Object? minHr = freezed,Object? maxHr = freezed,}) {
  return _then(_DailyHealthMetric(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MetricSource,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int?,restingHr: freezed == restingHr ? _self.restingHr : restingHr // ignore: cast_nullable_to_non_nullable
as int?,avgHr: freezed == avgHr ? _self.avgHr : avgHr // ignore: cast_nullable_to_non_nullable
as int?,minHr: freezed == minHr ? _self.minHr : minHr // ignore: cast_nullable_to_non_nullable
as int?,maxHr: freezed == maxHr ? _self.maxHr : maxHr // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
