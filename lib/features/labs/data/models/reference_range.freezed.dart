// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferenceRange {

 double get low; double get high; double? get criticalLow; double? get criticalHigh; String get unit;
/// Create a copy of ReferenceRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceRangeCopyWith<ReferenceRange> get copyWith => _$ReferenceRangeCopyWithImpl<ReferenceRange>(this as ReferenceRange, _$identity);

  /// Serializes this ReferenceRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceRange&&(identical(other.low, low) || other.low == low)&&(identical(other.high, high) || other.high == high)&&(identical(other.criticalLow, criticalLow) || other.criticalLow == criticalLow)&&(identical(other.criticalHigh, criticalHigh) || other.criticalHigh == criticalHigh)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,low,high,criticalLow,criticalHigh,unit);

@override
String toString() {
  return 'ReferenceRange(low: $low, high: $high, criticalLow: $criticalLow, criticalHigh: $criticalHigh, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $ReferenceRangeCopyWith<$Res>  {
  factory $ReferenceRangeCopyWith(ReferenceRange value, $Res Function(ReferenceRange) _then) = _$ReferenceRangeCopyWithImpl;
@useResult
$Res call({
 double low, double high, double? criticalLow, double? criticalHigh, String unit
});




}
/// @nodoc
class _$ReferenceRangeCopyWithImpl<$Res>
    implements $ReferenceRangeCopyWith<$Res> {
  _$ReferenceRangeCopyWithImpl(this._self, this._then);

  final ReferenceRange _self;
  final $Res Function(ReferenceRange) _then;

/// Create a copy of ReferenceRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? low = null,Object? high = null,Object? criticalLow = freezed,Object? criticalHigh = freezed,Object? unit = null,}) {
  return _then(_self.copyWith(
low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,criticalLow: freezed == criticalLow ? _self.criticalLow : criticalLow // ignore: cast_nullable_to_non_nullable
as double?,criticalHigh: freezed == criticalHigh ? _self.criticalHigh : criticalHigh // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceRange].
extension ReferenceRangePatterns on ReferenceRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceRange value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceRange value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double low,  double high,  double? criticalLow,  double? criticalHigh,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceRange() when $default != null:
return $default(_that.low,_that.high,_that.criticalLow,_that.criticalHigh,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double low,  double high,  double? criticalLow,  double? criticalHigh,  String unit)  $default,) {final _that = this;
switch (_that) {
case _ReferenceRange():
return $default(_that.low,_that.high,_that.criticalLow,_that.criticalHigh,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double low,  double high,  double? criticalLow,  double? criticalHigh,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceRange() when $default != null:
return $default(_that.low,_that.high,_that.criticalLow,_that.criticalHigh,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferenceRange implements ReferenceRange {
  const _ReferenceRange({required this.low, required this.high, this.criticalLow, this.criticalHigh, required this.unit});
  factory _ReferenceRange.fromJson(Map<String, dynamic> json) => _$ReferenceRangeFromJson(json);

@override final  double low;
@override final  double high;
@override final  double? criticalLow;
@override final  double? criticalHigh;
@override final  String unit;

/// Create a copy of ReferenceRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceRangeCopyWith<_ReferenceRange> get copyWith => __$ReferenceRangeCopyWithImpl<_ReferenceRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferenceRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceRange&&(identical(other.low, low) || other.low == low)&&(identical(other.high, high) || other.high == high)&&(identical(other.criticalLow, criticalLow) || other.criticalLow == criticalLow)&&(identical(other.criticalHigh, criticalHigh) || other.criticalHigh == criticalHigh)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,low,high,criticalLow,criticalHigh,unit);

@override
String toString() {
  return 'ReferenceRange(low: $low, high: $high, criticalLow: $criticalLow, criticalHigh: $criticalHigh, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$ReferenceRangeCopyWith<$Res> implements $ReferenceRangeCopyWith<$Res> {
  factory _$ReferenceRangeCopyWith(_ReferenceRange value, $Res Function(_ReferenceRange) _then) = __$ReferenceRangeCopyWithImpl;
@override @useResult
$Res call({
 double low, double high, double? criticalLow, double? criticalHigh, String unit
});




}
/// @nodoc
class __$ReferenceRangeCopyWithImpl<$Res>
    implements _$ReferenceRangeCopyWith<$Res> {
  __$ReferenceRangeCopyWithImpl(this._self, this._then);

  final _ReferenceRange _self;
  final $Res Function(_ReferenceRange) _then;

/// Create a copy of ReferenceRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? low = null,Object? high = null,Object? criticalLow = freezed,Object? criticalHigh = freezed,Object? unit = null,}) {
  return _then(_ReferenceRange(
low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,criticalLow: freezed == criticalLow ? _self.criticalLow : criticalLow // ignore: cast_nullable_to_non_nullable
as double?,criticalHigh: freezed == criticalHigh ? _self.criticalHigh : criticalHigh // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
