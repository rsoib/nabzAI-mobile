import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// App-wide session state. `unknown` is the brief moment during bootstrap
/// while we check secure storage for an existing refresh token.
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.unknown() = AuthUnknown;
  const factory AuthState.authenticated() = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
}
