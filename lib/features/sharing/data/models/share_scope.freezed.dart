// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_scope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShareScope {

 bool get profile; bool get labs; bool get complaints; bool get activity;
/// Create a copy of ShareScope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareScopeCopyWith<ShareScope> get copyWith => _$ShareScopeCopyWithImpl<ShareScope>(this as ShareScope, _$identity);

  /// Serializes this ShareScope to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareScope&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.labs, labs) || other.labs == labs)&&(identical(other.complaints, complaints) || other.complaints == complaints)&&(identical(other.activity, activity) || other.activity == activity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,labs,complaints,activity);

@override
String toString() {
  return 'ShareScope(profile: $profile, labs: $labs, complaints: $complaints, activity: $activity)';
}


}

/// @nodoc
abstract mixin class $ShareScopeCopyWith<$Res>  {
  factory $ShareScopeCopyWith(ShareScope value, $Res Function(ShareScope) _then) = _$ShareScopeCopyWithImpl;
@useResult
$Res call({
 bool profile, bool labs, bool complaints, bool activity
});




}
/// @nodoc
class _$ShareScopeCopyWithImpl<$Res>
    implements $ShareScopeCopyWith<$Res> {
  _$ShareScopeCopyWithImpl(this._self, this._then);

  final ShareScope _self;
  final $Res Function(ShareScope) _then;

/// Create a copy of ShareScope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? labs = null,Object? complaints = null,Object? activity = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as bool,labs: null == labs ? _self.labs : labs // ignore: cast_nullable_to_non_nullable
as bool,complaints: null == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as bool,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareScope].
extension ShareScopePatterns on ShareScope {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareScope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareScope() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareScope value)  $default,){
final _that = this;
switch (_that) {
case _ShareScope():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareScope value)?  $default,){
final _that = this;
switch (_that) {
case _ShareScope() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool profile,  bool labs,  bool complaints,  bool activity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareScope() when $default != null:
return $default(_that.profile,_that.labs,_that.complaints,_that.activity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool profile,  bool labs,  bool complaints,  bool activity)  $default,) {final _that = this;
switch (_that) {
case _ShareScope():
return $default(_that.profile,_that.labs,_that.complaints,_that.activity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool profile,  bool labs,  bool complaints,  bool activity)?  $default,) {final _that = this;
switch (_that) {
case _ShareScope() when $default != null:
return $default(_that.profile,_that.labs,_that.complaints,_that.activity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareScope implements ShareScope {
  const _ShareScope({this.profile = true, this.labs = true, this.complaints = false, this.activity = false});
  factory _ShareScope.fromJson(Map<String, dynamic> json) => _$ShareScopeFromJson(json);

@override@JsonKey() final  bool profile;
@override@JsonKey() final  bool labs;
@override@JsonKey() final  bool complaints;
@override@JsonKey() final  bool activity;

/// Create a copy of ShareScope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareScopeCopyWith<_ShareScope> get copyWith => __$ShareScopeCopyWithImpl<_ShareScope>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareScopeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareScope&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.labs, labs) || other.labs == labs)&&(identical(other.complaints, complaints) || other.complaints == complaints)&&(identical(other.activity, activity) || other.activity == activity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,labs,complaints,activity);

@override
String toString() {
  return 'ShareScope(profile: $profile, labs: $labs, complaints: $complaints, activity: $activity)';
}


}

/// @nodoc
abstract mixin class _$ShareScopeCopyWith<$Res> implements $ShareScopeCopyWith<$Res> {
  factory _$ShareScopeCopyWith(_ShareScope value, $Res Function(_ShareScope) _then) = __$ShareScopeCopyWithImpl;
@override @useResult
$Res call({
 bool profile, bool labs, bool complaints, bool activity
});




}
/// @nodoc
class __$ShareScopeCopyWithImpl<$Res>
    implements _$ShareScopeCopyWith<$Res> {
  __$ShareScopeCopyWithImpl(this._self, this._then);

  final _ShareScope _self;
  final $Res Function(_ShareScope) _then;

/// Create a copy of ShareScope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? labs = null,Object? complaints = null,Object? activity = null,}) {
  return _then(_ShareScope(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as bool,labs: null == labs ? _self.labs : labs // ignore: cast_nullable_to_non_nullable
as bool,complaints: null == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as bool,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
