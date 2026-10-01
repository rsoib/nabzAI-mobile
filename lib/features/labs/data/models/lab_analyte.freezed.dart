// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_analyte.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabAnalyte {

 String get code; String get nameRu; String get nameTg; String get unit; String get category;
/// Create a copy of LabAnalyte
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabAnalyteCopyWith<LabAnalyte> get copyWith => _$LabAnalyteCopyWithImpl<LabAnalyte>(this as LabAnalyte, _$identity);

  /// Serializes this LabAnalyte to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabAnalyte&&(identical(other.code, code) || other.code == code)&&(identical(other.nameRu, nameRu) || other.nameRu == nameRu)&&(identical(other.nameTg, nameTg) || other.nameTg == nameTg)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,nameRu,nameTg,unit,category);

@override
String toString() {
  return 'LabAnalyte(code: $code, nameRu: $nameRu, nameTg: $nameTg, unit: $unit, category: $category)';
}


}

/// @nodoc
abstract mixin class $LabAnalyteCopyWith<$Res>  {
  factory $LabAnalyteCopyWith(LabAnalyte value, $Res Function(LabAnalyte) _then) = _$LabAnalyteCopyWithImpl;
@useResult
$Res call({
 String code, String nameRu, String nameTg, String unit, String category
});




}
/// @nodoc
class _$LabAnalyteCopyWithImpl<$Res>
    implements $LabAnalyteCopyWith<$Res> {
  _$LabAnalyteCopyWithImpl(this._self, this._then);

  final LabAnalyte _self;
  final $Res Function(LabAnalyte) _then;

/// Create a copy of LabAnalyte
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? nameRu = null,Object? nameTg = null,Object? unit = null,Object? category = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,nameRu: null == nameRu ? _self.nameRu : nameRu // ignore: cast_nullable_to_non_nullable
as String,nameTg: null == nameTg ? _self.nameTg : nameTg // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LabAnalyte].
extension LabAnalytePatterns on LabAnalyte {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabAnalyte value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabAnalyte() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabAnalyte value)  $default,){
final _that = this;
switch (_that) {
case _LabAnalyte():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabAnalyte value)?  $default,){
final _that = this;
switch (_that) {
case _LabAnalyte() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String nameRu,  String nameTg,  String unit,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabAnalyte() when $default != null:
return $default(_that.code,_that.nameRu,_that.nameTg,_that.unit,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String nameRu,  String nameTg,  String unit,  String category)  $default,) {final _that = this;
switch (_that) {
case _LabAnalyte():
return $default(_that.code,_that.nameRu,_that.nameTg,_that.unit,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String nameRu,  String nameTg,  String unit,  String category)?  $default,) {final _that = this;
switch (_that) {
case _LabAnalyte() when $default != null:
return $default(_that.code,_that.nameRu,_that.nameTg,_that.unit,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabAnalyte implements LabAnalyte {
  const _LabAnalyte({required this.code, required this.nameRu, required this.nameTg, required this.unit, required this.category});
  factory _LabAnalyte.fromJson(Map<String, dynamic> json) => _$LabAnalyteFromJson(json);

@override final  String code;
@override final  String nameRu;
@override final  String nameTg;
@override final  String unit;
@override final  String category;

/// Create a copy of LabAnalyte
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabAnalyteCopyWith<_LabAnalyte> get copyWith => __$LabAnalyteCopyWithImpl<_LabAnalyte>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabAnalyteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabAnalyte&&(identical(other.code, code) || other.code == code)&&(identical(other.nameRu, nameRu) || other.nameRu == nameRu)&&(identical(other.nameTg, nameTg) || other.nameTg == nameTg)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,nameRu,nameTg,unit,category);

@override
String toString() {
  return 'LabAnalyte(code: $code, nameRu: $nameRu, nameTg: $nameTg, unit: $unit, category: $category)';
}


}

/// @nodoc
abstract mixin class _$LabAnalyteCopyWith<$Res> implements $LabAnalyteCopyWith<$Res> {
  factory _$LabAnalyteCopyWith(_LabAnalyte value, $Res Function(_LabAnalyte) _then) = __$LabAnalyteCopyWithImpl;
@override @useResult
$Res call({
 String code, String nameRu, String nameTg, String unit, String category
});




}
/// @nodoc
class __$LabAnalyteCopyWithImpl<$Res>
    implements _$LabAnalyteCopyWith<$Res> {
  __$LabAnalyteCopyWithImpl(this._self, this._then);

  final _LabAnalyte _self;
  final $Res Function(_LabAnalyte) _then;

/// Create a copy of LabAnalyte
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? nameRu = null,Object? nameTg = null,Object? unit = null,Object? category = null,}) {
  return _then(_LabAnalyte(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,nameRu: null == nameRu ? _self.nameRu : nameRu // ignore: cast_nullable_to_non_nullable
as String,nameTg: null == nameTg ? _self.nameTg : nameTg // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
