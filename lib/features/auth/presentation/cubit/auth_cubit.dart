import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/auth_session_events.dart';
import '../../../../core/storage/secure_token_storage.dart';
import '../../data/auth_repository.dart';
import 'auth_state.dart';

/// App-wide auth state, registered as a singleton in the service locator so
/// the router guard (task #5) and the logout button read the same instance.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthRepository authRepository, required SecureTokenStorage tokenStorage})
      : _authRepository = authRepository,
        _tokenStorage = tokenStorage,
        super(const AuthState.unknown()) {
    _forcedLogoutSubscription = AuthSessionEvents.instance.onForcedLogout.listen((_) => _emitUnauthenticated());
    _bootstrap();
  }

  final AuthRepository _authRepository;
  final SecureTokenStorage _tokenStorage;
  late final StreamSubscription<void> _forcedLogoutSubscription;

  Future<void> _bootstrap() async {
    final hasSession = await _tokenStorage.hasSession();
    emit(hasSession ? const AuthState.authenticated() : const AuthState.unauthenticated());
  }

  /// Called by the OTP screen right after a successful verify.
  void notifyAuthenticated() => emit(const AuthState.authenticated());

  Future<void> logout() async {
    await _authRepository.logout();
    _emitUnauthenticated();
  }

  void _emitUnauthenticated() => emit(const AuthState.unauthenticated());

  @override
  Future<void> close() {
    _forcedLogoutSubscription.cancel();
    return super.close();
  }
}
