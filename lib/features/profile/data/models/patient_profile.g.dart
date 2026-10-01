// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientProfile _$PatientProfileFromJson(Map<String, dynamic> json) =>
    _PatientProfile(
      id: json['id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String?,
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      birthDate: json['birthDate'] as String?,
      language:
          $enumDecodeNullable(_$AppLanguageEnumMap, json['language']) ??
          AppLanguage.tg,
      heightCm: (json['heightCm'] as num?)?.toDouble(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PatientProfileToJson(_PatientProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'sex': _$SexEnumMap[instance.sex],
      'birthDate': instance.birthDate,
      'language': _$AppLanguageEnumMap[instance.language]!,
      'heightCm': instance.heightCm,
      'weightKg': instance.weightKg,
    };

const _$SexEnumMap = {Sex.male: 'male', Sex.female: 'female'};

const _$AppLanguageEnumMap = {AppLanguage.tg: 'tg', AppLanguage.ru: 'ru'};
