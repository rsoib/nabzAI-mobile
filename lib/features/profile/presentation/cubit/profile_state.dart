import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/patient_profile.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded(PatientProfile profile) = ProfileLoaded;
  const factory ProfileState.error(String message) = ProfileError;
}
