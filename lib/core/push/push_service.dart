import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../config/app_config.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/auth_state.dart';
import '../../features/push/data/push_tokens_repository.dart';

/// Registers the device's push token after login, unregisters at logout —
/// mirrors backend `/me/push-tokens` semantics. When
/// [AppConfig.firebaseEnabled] is false (no `google-services.json` /
/// `GoogleService-Info.plist` configured — the case for local dev), every
/// method here is a no-op stub instead of crashing on missing Firebase
/// config.
///
/// Tapping a notification to open the relevant report (per the design
/// brief) isn't wired up yet — there's no real Firebase project to test
/// against in this build; see README's gap list.
class PushService {
  PushService({required PushTokensRepository repository, required AuthCubit authCubit}) : _repository = repository {
    _subscription = authCubit.stream.listen(_onAuthChanged);
  }

  final PushTokensRepository _repository;
  late final StreamSubscription<AuthState> _subscription;
  String? _currentToken;

  void _onAuthChanged(AuthState state) {
    switch (state) {
      case AuthAuthenticated():
        registerAfterLogin();
      case AuthUnauthenticated():
        unregisterOnLogout();
      case AuthUnknown():
        break;
    }
  }

  Future<void> registerAfterLogin() async {
    if (!AppConfig.instance.firebaseEnabled) return;
    try {
      final messaging = FirebaseMessaging.instance;
      await messaging.requestPermission();
      final token = await messaging.getToken();
      if (token == null) return;
      _currentToken = token;
      await _repository.register(platform: Platform.isIOS ? 'ios' : 'android', token: token);
    } catch (_) {
      // Best-effort — push registration should never block login.
    }
  }

  Future<void> unregisterOnLogout() async {
    final token = _currentToken;
    if (!AppConfig.instance.firebaseEnabled || token == null) return;
    try {
      await _repository.unregister(token);
    } catch (_) {
      // Ignore — the token will simply age out server-side if this fails.
    }
    _currentToken = null;
  }

  void dispose() => _subscription.cancel();
}
