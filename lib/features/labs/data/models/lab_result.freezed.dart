// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabResult {

 String get id; String get rawName; double? get value; String? get valueText; String? get unit; ResultFlag? get flag; LabAnalyte? get analyte; ReferenceRange? get referenceRange; String? get collectedAt; bool get confirmedByUser;
/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabResultCopyWith<LabResult> get copyWith => _$LabResultCopyWithImpl<LabResult>(this as LabResult, _$identity);

  /// Serializes this LabResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabResult&&(identical(other.id, id) || other.id == id)&&(identical(other.rawName, rawName) || other.rawName == rawName)&&(identical(other.value, value) || other.value == value)&&(identical(other.valueText, valueText) || other.valueText == valueText)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.analyte, analyte) || other.analyte == analyte)&&(identical(other.referenceRange, referenceRange) || other.referenceRange == referenceRange)&&(identical(other.collectedAt, collectedAt) || other.collectedAt == collectedAt)&&(identical(other.confirmedByUser, confirmedByUser) || other.confirmedByUser == confirmedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rawName,value,valueText,unit,flag,analyte,referenceRange,collectedAt,confirmedByUser);

@override
String toString() {
  return 'LabResult(id: $id, rawName: $rawName, value: $value, valueText: $valueText, unit: $unit, flag: $flag, analyte: $analyte, referenceRange: $referenceRange, collectedAt: $collectedAt, confirmedByUser: $confirmedByUser)';
}


}

/// @nodoc
abstract mixin class $LabResultCopyWith<$Res>  {
  factory $LabResultCopyWith(LabResult value, $Res Function(LabResult) _then) = _$LabResultCopyWithImpl;
@useResult
$Res call({
 String id, String rawName, double? value, String? valueText, String? unit, ResultFlag? flag, LabAnalyte? analyte, ReferenceRange? referenceRange, String? collectedAt, bool confirmedByUser
});


$LabAnalyteCopyWith<$Res>? get analyte;$ReferenceRangeCopyWith<$Res>? get referenceRange;

}
/// @nodoc
class _$LabResultCopyWithImpl<$Res>
    implements $LabResultCopyWith<$Res> {
  _$LabResultCopyWithImpl(this._self, this._then);

  final LabResult _self;
  final $Res Function(LabResult) _then;

/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rawName = null,Object? value = freezed,Object? valueText = freezed,Object? unit = freezed,Object? flag = freezed,Object? analyte = freezed,Object? referenceRange = freezed,Object? collectedAt = freezed,Object? confirmedByUser = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rawName: null == rawName ? _self.rawName : rawName // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,valueText: freezed == valueText ? _self.valueText : valueText // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as ResultFlag?,analyte: freezed == analyte ? _self.analyte : analyte // ignore: cast_nullable_to_non_nullable
as LabAnalyte?,referenceRange: freezed == referenceRange ? _self.referenceRange : referenceRange // ignore: cast_nullable_to_non_nullable
as ReferenceRange?,collectedAt: freezed == collectedAt ? _self.collectedAt : collectedAt // ignore: cast_nullable_to_non_nullable
as String?,confirmedByUser: null == confirmedByUser ? _self.confirmedByUser : confirmedByUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabAnalyteCopyWith<$Res>? get analyte {
    if (_self.analyte == null) {
    return null;
  }

  return $LabAnalyteCopyWith<$Res>(_self.analyte!, (value) {
    return _then(_self.copyWith(analyte: value));
  });
}/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceRangeCopyWith<$Res>? get referenceRange {
    if (_self.referenceRange == null) {
    return null;
  }

  return $ReferenceRangeCopyWith<$Res>(_self.referenceRange!, (value) {
    return _then(_self.copyWith(referenceRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [LabResult].
extension LabResultPatterns on LabResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabResult value)  $default,){
final _that = this;
switch (_that) {
case _LabResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabResult value)?  $default,){
final _that = this;
switch (_that) {
case _LabResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String rawName,  double? value,  String? valueText,  String? unit,  ResultFlag? flag,  LabAnalyte? analyte,  ReferenceRange? referenceRange,  String? collectedAt,  bool confirmedByUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabResult() when $default != null:
return $default(_that.id,_that.rawName,_that.value,_that.valueText,_that.unit,_that.flag,_that.analyte,_that.referenceRange,_that.collectedAt,_that.confirmedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String rawName,  double? value,  String? valueText,  String? unit,  ResultFlag? flag,  LabAnalyte? analyte,  ReferenceRange? referenceRange,  String? collectedAt,  bool confirmedByUser)  $default,) {final _that = this;
switch (_that) {
case _LabResult():
return $default(_that.id,_that.rawName,_that.value,_that.valueText,_that.unit,_that.flag,_that.analyte,_that.referenceRange,_that.collectedAt,_that.confirmedByUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String rawName,  double? value,  String? valueText,  String? unit,  ResultFlag? flag,  LabAnalyte? analyte,  ReferenceRange? referenceRange,  String? collectedAt,  bool confirmedByUser)?  $default,) {final _that = this;
switch (_that) {
case _LabResult() when $default != null:
return $default(_that.id,_that.rawName,_that.value,_that.valueText,_that.unit,_that.flag,_that.analyte,_that.referenceRange,_that.collectedAt,_that.confirmedByUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabResult implements LabResult {
  const _LabResult({required this.id, required this.rawName, this.value, this.valueText, this.unit, this.flag, this.analyte, this.referenceRange, this.collectedAt, this.confirmedByUser = false});
  factory _LabResult.fromJson(Map<String, dynamic> json) => _$LabResultFromJson(json);

@override final  String id;
@override final  String rawName;
@override final  double? value;
@override final  String? valueText;
@override final  String? unit;
@override final  ResultFlag? flag;
@override final  LabAnalyte? analyte;
@override final  ReferenceRange? referenceRange;
@override final  String? collectedAt;
@override@JsonKey() final  bool confirmedByUser;

/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabResultCopyWith<_LabResult> get copyWith => __$LabResultCopyWithImpl<_LabResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabResult&&(identical(other.id, id) || other.id == id)&&(identical(other.rawName, rawName) || other.rawName == rawName)&&(identical(other.value, value) || other.value == value)&&(identical(other.valueText, valueText) || other.valueText == valueText)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.analyte, analyte) || other.analyte == analyte)&&(identical(other.referenceRange, referenceRange) || other.referenceRange == referenceRange)&&(identical(other.collectedAt, collectedAt) || other.collectedAt == collectedAt)&&(identical(other.confirmedByUser, confirmedByUser) || other.confirmedByUser == confirmedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rawName,value,valueText,unit,flag,analyte,referenceRange,collectedAt,confirmedByUser);

@override
String toString() {
  return 'LabResult(id: $id, rawName: $rawName, value: $value, valueText: $valueText, unit: $unit, flag: $flag, analyte: $analyte, referenceRange: $referenceRange, collectedAt: $collectedAt, confirmedByUser: $confirmedByUser)';
}


}

/// @nodoc
abstract mixin class _$LabResultCopyWith<$Res> implements $LabResultCopyWith<$Res> {
  factory _$LabResultCopyWith(_LabResult value, $Res Function(_LabResult) _then) = __$LabResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String rawName, double? value, String? valueText, String? unit, ResultFlag? flag, LabAnalyte? analyte, ReferenceRange? referenceRange, String? collectedAt, bool confirmedByUser
});


@override $LabAnalyteCopyWith<$Res>? get analyte;@override $ReferenceRangeCopyWith<$Res>? get referenceRange;

}
/// @nodoc
class __$LabResultCopyWithImpl<$Res>
    implements _$LabResultCopyWith<$Res> {
  __$LabResultCopyWithImpl(this._self, this._then);

  final _LabResult _self;
  final $Res Function(_LabResult) _then;

/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rawName = null,Object? value = freezed,Object? valueText = freezed,Object? unit = freezed,Object? flag = freezed,Object? analyte = freezed,Object? referenceRange = freezed,Object? collectedAt = freezed,Object? confirmedByUser = null,}) {
  return _then(_LabResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rawName: null == rawName ? _self.rawName : rawName // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,valueText: freezed == valueText ? _self.valueText : valueText // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as ResultFlag?,analyte: freezed == analyte ? _self.analyte : analyte // ignore: cast_nullable_to_non_nullable
as LabAnalyte?,referenceRange: freezed == referenceRange ? _self.referenceRange : referenceRange // ignore: cast_nullable_to_non_nullable
as ReferenceRange?,collectedAt: freezed == collectedAt ? _self.collectedAt : collectedAt // ignore: cast_nullable_to_non_nullable
as String?,confirmedByUser: null == confirmedByUser ? _self.confirmedByUser : confirmedByUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabAnalyteCopyWith<$Res>? get analyte {
    if (_self.analyte == null) {
    return null;
  }

  return $LabAnalyteCopyWith<$Res>(_self.analyte!, (value) {
    return _then(_self.copyWith(analyte: value));
  });
}/// Create a copy of LabResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceRangeCopyWith<$Res>? get referenceRange {
    if (_self.referenceRange == null) {
    return null;
  }

  return $ReferenceRangeCopyWith<$Res>(_self.referenceRange!, (value) {
    return _then(_self.copyWith(referenceRange: value));
  });
}
}

// dart format on
