import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// The only place access/refresh tokens are persisted. Never log these
/// values or pass them through analytics.
class SecureTokenStorage {
  SecureTokenStorage({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'nabz_access_token';
  static const _refreshTokenKey = 'nabz_refresh_token';

  Future<String?> readAccessToken() => _storage.read(key: _accessTokenKey);

  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> clear() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<bool> hasSession() async {
    try {
      return (await readRefreshToken()) != null;
    } catch (_) {
      // Secure storage can throw on a corrupted keystore/keychain entry —
      // treat that as "no session" rather than crashing bootstrap.
      return false;
    }
  }
}
