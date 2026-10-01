// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redaction_region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RedactionRegion {

 double get x; double get y; double get width; double get height; int? get page;
/// Create a copy of RedactionRegion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RedactionRegionCopyWith<RedactionRegion> get copyWith => _$RedactionRegionCopyWithImpl<RedactionRegion>(this as RedactionRegion, _$identity);

  /// Serializes this RedactionRegion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RedactionRegion&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,width,height,page);

@override
String toString() {
  return 'RedactionRegion(x: $x, y: $y, width: $width, height: $height, page: $page)';
}


}

/// @nodoc
abstract mixin class $RedactionRegionCopyWith<$Res>  {
  factory $RedactionRegionCopyWith(RedactionRegion value, $Res Function(RedactionRegion) _then) = _$RedactionRegionCopyWithImpl;
@useResult
$Res call({
 double x, double y, double width, double height, int? page
});




}
/// @nodoc
class _$RedactionRegionCopyWithImpl<$Res>
    implements $RedactionRegionCopyWith<$Res> {
  _$RedactionRegionCopyWithImpl(this._self, this._then);

  final RedactionRegion _self;
  final $Res Function(RedactionRegion) _then;

/// Create a copy of RedactionRegion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? width = null,Object? height = null,Object? page = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RedactionRegion].
extension RedactionRegionPatterns on RedactionRegion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RedactionRegion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RedactionRegion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RedactionRegion value)  $default,){
final _that = this;
switch (_that) {
case _RedactionRegion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RedactionRegion value)?  $default,){
final _that = this;
switch (_that) {
case _RedactionRegion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  double width,  double height,  int? page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RedactionRegion() when $default != null:
return $default(_that.x,_that.y,_that.width,_that.height,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  double width,  double height,  int? page)  $default,) {final _that = this;
switch (_that) {
case _RedactionRegion():
return $default(_that.x,_that.y,_that.width,_that.height,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  double width,  double height,  int? page)?  $default,) {final _that = this;
switch (_that) {
case _RedactionRegion() when $default != null:
return $default(_that.x,_that.y,_that.width,_that.height,_that.page);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RedactionRegion implements RedactionRegion {
  const _RedactionRegion({required this.x, required this.y, required this.width, required this.height, this.page});
  factory _RedactionRegion.fromJson(Map<String, dynamic> json) => _$RedactionRegionFromJson(json);

@override final  double x;
@override final  double y;
@override final  double width;
@override final  double height;
@override final  int? page;

/// Create a copy of RedactionRegion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedactionRegionCopyWith<_RedactionRegion> get copyWith => __$RedactionRegionCopyWithImpl<_RedactionRegion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RedactionRegionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedactionRegion&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,width,height,page);

@override
String toString() {
  return 'RedactionRegion(x: $x, y: $y, width: $width, height: $height, page: $page)';
}


}

/// @nodoc
abstract mixin class _$RedactionRegionCopyWith<$Res> implements $RedactionRegionCopyWith<$Res> {
  factory _$RedactionRegionCopyWith(_RedactionRegion value, $Res Function(_RedactionRegion) _then) = __$RedactionRegionCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double width, double height, int? page
});




}
/// @nodoc
class __$RedactionRegionCopyWithImpl<$Res>
    implements _$RedactionRegionCopyWith<$Res> {
  __$RedactionRegionCopyWithImpl(this._self, this._then);

  final _RedactionRegion _self;
  final $Res Function(_RedactionRegion) _then;

/// Create a copy of RedactionRegion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? width = null,Object? height = null,Object? page = freezed,}) {
  return _then(_RedactionRegion(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
