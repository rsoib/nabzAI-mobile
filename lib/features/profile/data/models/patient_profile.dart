import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_profile.freezed.dart';
part 'patient_profile.g.dart';

enum Sex {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
}

enum AppLanguage {
  @JsonValue('tg')
  tg,
  @JsonValue('ru')
  ru,
}

/// Raw shape of `GET/PUT /me/profile` — the backend returns the
/// `PatientProfile` entity directly, no response DTO/mapper layer exists.
@freezed
abstract class PatientProfile with _$PatientProfile {
  const factory PatientProfile({
    required String id,
    required String userId,
    String? fullName,
    Sex? sex,
    String? birthDate,
    @Default(AppLanguage.tg) AppLanguage language,
    double? heightCm,
    double? weightKg,
  }) = _PatientProfile;

  factory PatientProfile.fromJson(Map<String, dynamic> json) => _$PatientProfileFromJson(json);
}

extension PatientProfileX on PatientProfile {
  /// The backend has no "onboarding completed" flag — `GET /me/profile`
  /// lazily creates an empty profile on first call. An empty name is our
  /// signal that the setup wizard still needs to run.
  bool get isOnboardingComplete => fullName != null && fullName!.trim().isNotEmpty;
}
