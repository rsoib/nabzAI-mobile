import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../data/models/patient_profile.dart';
import '../../data/profile_repository.dart';
import 'profile_state.dart';

/// App-wide profile cache. Fetches `/me/profile` once whenever [AuthCubit]
/// becomes authenticated (login or bootstrap-found-session) and caches the
/// result so the router guard can check `isOnboardingComplete` synchronously
/// instead of re-fetching on every navigation.
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required ProfileRepository profileRepository, required AuthCubit authCubit})
      : _profileRepository = profileRepository,
        super(const ProfileState.initial()) {
    if (authCubit.state is AuthAuthenticated) {
      _fetch();
    }
    _authSubscription = authCubit.stream.listen(_onAuthChanged);
  }

  final ProfileRepository _profileRepository;
  late final StreamSubscription<AuthState> _authSubscription;

  void _onAuthChanged(AuthState state) {
    switch (state) {
      case AuthAuthenticated():
        _fetch();
      case AuthUnauthenticated():
        emit(const ProfileState.initial());
      case AuthUnknown():
        break;
    }
  }

  Future<void> _fetch() async {
    emit(const ProfileState.loading());
    try {
      final profile = await _profileRepository.getMyProfile();
      emit(ProfileState.loaded(profile));
    } on ApiException catch (e) {
      emit(ProfileState.error(e.message));
    }
  }

  Future<void> refresh() => _fetch();

  Future<void> updateProfile({
    String? fullName,
    Sex? sex,
    String? birthDate,
    AppLanguage? language,
    double? heightCm,
    double? weightKg,
  }) async {
    final updated = await _profileRepository.updateMyProfile(
      fullName: fullName,
      sex: sex,
      birthDate: birthDate,
      language: language,
      heightCm: heightCm,
      weightKg: weightKg,
    );
    emit(ProfileState.loaded(updated));
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
