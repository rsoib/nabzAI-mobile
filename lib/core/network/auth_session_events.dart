import 'dart:async';

/// Fired by [AuthInterceptor] when a token refresh fails (refresh token
/// expired/revoked). AuthCubit listens and transitions to logged-out —
/// this avoids a circular dependency between the Dio layer and AuthCubit.
class AuthSessionEvents {
  AuthSessionEvents._();

  static final AuthSessionEvents instance = AuthSessionEvents._();

  final _controller = StreamController<void>.broadcast();

  Stream<void> get onForcedLogout => _controller.stream;

  void notifyForcedLogout() => _controller.add(null);

  void dispose() => _controller.close();
}
