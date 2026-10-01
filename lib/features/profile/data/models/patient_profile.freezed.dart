// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientProfile {

 String get id; String get userId; String? get fullName; Sex? get sex; String? get birthDate; AppLanguage get language; double? get heightCm; double? get weightKg;
/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientProfileCopyWith<PatientProfile> get copyWith => _$PatientProfileCopyWithImpl<PatientProfile>(this as PatientProfile, _$identity);

  /// Serializes this PatientProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.language, language) || other.language == language)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,sex,birthDate,language,heightCm,weightKg);

@override
String toString() {
  return 'PatientProfile(id: $id, userId: $userId, fullName: $fullName, sex: $sex, birthDate: $birthDate, language: $language, heightCm: $heightCm, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class $PatientProfileCopyWith<$Res>  {
  factory $PatientProfileCopyWith(PatientProfile value, $Res Function(PatientProfile) _then) = _$PatientProfileCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? fullName, Sex? sex, String? birthDate, AppLanguage language, double? heightCm, double? weightKg
});




}
/// @nodoc
class _$PatientProfileCopyWithImpl<$Res>
    implements $PatientProfileCopyWith<$Res> {
  _$PatientProfileCopyWithImpl(this._self, this._then);

  final PatientProfile _self;
  final $Res Function(PatientProfile) _then;

/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = freezed,Object? sex = freezed,Object? birthDate = freezed,Object? language = null,Object? heightCm = freezed,Object? weightKg = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientProfile].
extension PatientProfilePatterns on PatientProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientProfile value)  $default,){
final _that = this;
switch (_that) {
case _PatientProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientProfile value)?  $default,){
final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? fullName,  Sex? sex,  String? birthDate,  AppLanguage language,  double? heightCm,  double? weightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.sex,_that.birthDate,_that.language,_that.heightCm,_that.weightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? fullName,  Sex? sex,  String? birthDate,  AppLanguage language,  double? heightCm,  double? weightKg)  $default,) {final _that = this;
switch (_that) {
case _PatientProfile():
return $default(_that.id,_that.userId,_that.fullName,_that.sex,_that.birthDate,_that.language,_that.heightCm,_that.weightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? fullName,  Sex? sex,  String? birthDate,  AppLanguage language,  double? heightCm,  double? weightKg)?  $default,) {final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.sex,_that.birthDate,_that.language,_that.heightCm,_that.weightKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientProfile implements PatientProfile {
  const _PatientProfile({required this.id, required this.userId, this.fullName, this.sex, this.birthDate, this.language = AppLanguage.tg, this.heightCm, this.weightKg});
  factory _PatientProfile.fromJson(Map<String, dynamic> json) => _$PatientProfileFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? fullName;
@override final  Sex? sex;
@override final  String? birthDate;
@override@JsonKey() final  AppLanguage language;
@override final  double? heightCm;
@override final  double? weightKg;

/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientProfileCopyWith<_PatientProfile> get copyWith => __$PatientProfileCopyWithImpl<_PatientProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.language, language) || other.language == language)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,sex,birthDate,language,heightCm,weightKg);

@override
String toString() {
  return 'PatientProfile(id: $id, userId: $userId, fullName: $fullName, sex: $sex, birthDate: $birthDate, language: $language, heightCm: $heightCm, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class _$PatientProfileCopyWith<$Res> implements $PatientProfileCopyWith<$Res> {
  factory _$PatientProfileCopyWith(_PatientProfile value, $Res Function(_PatientProfile) _then) = __$PatientProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? fullName, Sex? sex, String? birthDate, AppLanguage language, double? heightCm, double? weightKg
});




}
/// @nodoc
class __$PatientProfileCopyWithImpl<$Res>
    implements _$PatientProfileCopyWith<$Res> {
  __$PatientProfileCopyWithImpl(this._self, this._then);

  final _PatientProfile _self;
  final $Res Function(_PatientProfile) _then;

/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = freezed,Object? sex = freezed,Object? birthDate = freezed,Object? language = null,Object? heightCm = freezed,Object? weightKg = freezed,}) {
  return _then(_PatientProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
