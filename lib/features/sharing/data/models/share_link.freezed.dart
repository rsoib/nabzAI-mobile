// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShareLink {

 String get id; ShareScope get scope; String get expiresAt; String? get revokedAt; String get createdAt;
/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareLinkCopyWith<ShareLink> get copyWith => _$ShareLinkCopyWithImpl<ShareLink>(this as ShareLink, _$identity);

  /// Serializes this ShareLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareLink&&(identical(other.id, id) || other.id == id)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scope,expiresAt,revokedAt,createdAt);

@override
String toString() {
  return 'ShareLink(id: $id, scope: $scope, expiresAt: $expiresAt, revokedAt: $revokedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShareLinkCopyWith<$Res>  {
  factory $ShareLinkCopyWith(ShareLink value, $Res Function(ShareLink) _then) = _$ShareLinkCopyWithImpl;
@useResult
$Res call({
 String id, ShareScope scope, String expiresAt, String? revokedAt, String createdAt
});


$ShareScopeCopyWith<$Res> get scope;

}
/// @nodoc
class _$ShareLinkCopyWithImpl<$Res>
    implements $ShareLinkCopyWith<$Res> {
  _$ShareLinkCopyWithImpl(this._self, this._then);

  final ShareLink _self;
  final $Res Function(ShareLink) _then;

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scope = null,Object? expiresAt = null,Object? revokedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShareScope,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareScopeCopyWith<$Res> get scope {
  
  return $ShareScopeCopyWith<$Res>(_self.scope, (value) {
    return _then(_self.copyWith(scope: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShareLink].
extension ShareLinkPatterns on ShareLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareLink value)  $default,){
final _that = this;
switch (_that) {
case _ShareLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareLink value)?  $default,){
final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ShareScope scope,  String expiresAt,  String? revokedAt,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
return $default(_that.id,_that.scope,_that.expiresAt,_that.revokedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ShareScope scope,  String expiresAt,  String? revokedAt,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ShareLink():
return $default(_that.id,_that.scope,_that.expiresAt,_that.revokedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ShareScope scope,  String expiresAt,  String? revokedAt,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
return $default(_that.id,_that.scope,_that.expiresAt,_that.revokedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareLink implements ShareLink {
  const _ShareLink({required this.id, required this.scope, required this.expiresAt, this.revokedAt, required this.createdAt});
  factory _ShareLink.fromJson(Map<String, dynamic> json) => _$ShareLinkFromJson(json);

@override final  String id;
@override final  ShareScope scope;
@override final  String expiresAt;
@override final  String? revokedAt;
@override final  String createdAt;

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareLinkCopyWith<_ShareLink> get copyWith => __$ShareLinkCopyWithImpl<_ShareLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareLink&&(identical(other.id, id) || other.id == id)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scope,expiresAt,revokedAt,createdAt);

@override
String toString() {
  return 'ShareLink(id: $id, scope: $scope, expiresAt: $expiresAt, revokedAt: $revokedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShareLinkCopyWith<$Res> implements $ShareLinkCopyWith<$Res> {
  factory _$ShareLinkCopyWith(_ShareLink value, $Res Function(_ShareLink) _then) = __$ShareLinkCopyWithImpl;
@override @useResult
$Res call({
 String id, ShareScope scope, String expiresAt, String? revokedAt, String createdAt
});


@override $ShareScopeCopyWith<$Res> get scope;

}
/// @nodoc
class __$ShareLinkCopyWithImpl<$Res>
    implements _$ShareLinkCopyWith<$Res> {
  __$ShareLinkCopyWithImpl(this._self, this._then);

  final _ShareLink _self;
  final $Res Function(_ShareLink) _then;

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scope = null,Object? expiresAt = null,Object? revokedAt = freezed,Object? createdAt = null,}) {
  return _then(_ShareLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShareScope,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareScopeCopyWith<$Res> get scope {
  
  return $ShareScopeCopyWith<$Res>(_self.scope, (value) {
    return _then(_self.copyWith(scope: value));
  });
}
}


/// @nodoc
mixin _$CreateShareLinkResult {

 String get token; ShareLink get shareLink;
/// Create a copy of CreateShareLinkResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateShareLinkResultCopyWith<CreateShareLinkResult> get copyWith => _$CreateShareLinkResultCopyWithImpl<CreateShareLinkResult>(this as CreateShareLinkResult, _$identity);

  /// Serializes this CreateShareLinkResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateShareLinkResult&&(identical(other.token, token) || other.token == token)&&(identical(other.shareLink, shareLink) || other.shareLink == shareLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,shareLink);

@override
String toString() {
  return 'CreateShareLinkResult(token: $token, shareLink: $shareLink)';
}


}

/// @nodoc
abstract mixin class $CreateShareLinkResultCopyWith<$Res>  {
  factory $CreateShareLinkResultCopyWith(CreateShareLinkResult value, $Res Function(CreateShareLinkResult) _then) = _$CreateShareLinkResultCopyWithImpl;
@useResult
$Res call({
 String token, ShareLink shareLink
});


$ShareLinkCopyWith<$Res> get shareLink;

}
/// @nodoc
class _$CreateShareLinkResultCopyWithImpl<$Res>
    implements $CreateShareLinkResultCopyWith<$Res> {
  _$CreateShareLinkResultCopyWithImpl(this._self, this._then);

  final CreateShareLinkResult _self;
  final $Res Function(CreateShareLinkResult) _then;

/// Create a copy of CreateShareLinkResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? shareLink = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,shareLink: null == shareLink ? _self.shareLink : shareLink // ignore: cast_nullable_to_non_nullable
as ShareLink,
  ));
}
/// Create a copy of CreateShareLinkResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareLinkCopyWith<$Res> get shareLink {
  
  return $ShareLinkCopyWith<$Res>(_self.shareLink, (value) {
    return _then(_self.copyWith(shareLink: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateShareLinkResult].
extension CreateShareLinkResultPatterns on CreateShareLinkResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateShareLinkResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateShareLinkResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateShareLinkResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateShareLinkResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateShareLinkResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateShareLinkResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  ShareLink shareLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateShareLinkResult() when $default != null:
return $default(_that.token,_that.shareLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  ShareLink shareLink)  $default,) {final _that = this;
switch (_that) {
case _CreateShareLinkResult():
return $default(_that.token,_that.shareLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  ShareLink shareLink)?  $default,) {final _that = this;
switch (_that) {
case _CreateShareLinkResult() when $default != null:
return $default(_that.token,_that.shareLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateShareLinkResult implements CreateShareLinkResult {
  const _CreateShareLinkResult({required this.token, required this.shareLink});
  factory _CreateShareLinkResult.fromJson(Map<String, dynamic> json) => _$CreateShareLinkResultFromJson(json);

@override final  String token;
@override final  ShareLink shareLink;

/// Create a copy of CreateShareLinkResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateShareLinkResultCopyWith<_CreateShareLinkResult> get copyWith => __$CreateShareLinkResultCopyWithImpl<_CreateShareLinkResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateShareLinkResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateShareLinkResult&&(identical(other.token, token) || other.token == token)&&(identical(other.shareLink, shareLink) || other.shareLink == shareLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,shareLink);

@override
String toString() {
  return 'CreateShareLinkResult(token: $token, shareLink: $shareLink)';
}


}

/// @nodoc
abstract mixin class _$CreateShareLinkResultCopyWith<$Res> implements $CreateShareLinkResultCopyWith<$Res> {
  factory _$CreateShareLinkResultCopyWith(_CreateShareLinkResult value, $Res Function(_CreateShareLinkResult) _then) = __$CreateShareLinkResultCopyWithImpl;
@override @useResult
$Res call({
 String token, ShareLink shareLink
});


@override $ShareLinkCopyWith<$Res> get shareLink;

}
/// @nodoc
class __$CreateShareLinkResultCopyWithImpl<$Res>
    implements _$CreateShareLinkResultCopyWith<$Res> {
  __$CreateShareLinkResultCopyWithImpl(this._self, this._then);

  final _CreateShareLinkResult _self;
  final $Res Function(_CreateShareLinkResult) _then;

/// Create a copy of CreateShareLinkResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? shareLink = null,}) {
  return _then(_CreateShareLinkResult(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,shareLink: null == shareLink ? _self.shareLink : shareLink // ignore: cast_nullable_to_non_nullable
as ShareLink,
  ));
}

/// Create a copy of CreateShareLinkResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareLinkCopyWith<$Res> get shareLink {
  
  return $ShareLinkCopyWith<$Res>(_self.shareLink, (value) {
    return _then(_self.copyWith(shareLink: value));
  });
}
}

// dart format on
