import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'app_config.dart';

/// Local backend, run via `nest start api` on port 3001 (see
/// /Users/artem/projects/nabzAI/backend). Android emulators can't reach the
/// host machine via "localhost" — they need the special alias 10.0.2.2.
AppConfig buildDevConfig() {
  final host = kIsWeb || !Platform.isAndroid ? 'localhost' : '10.0.2.2';
  final baseUrl = 'http://$host:3001';
  return AppConfig(
    flavor: Flavor.dev,
    apiBaseUrl: baseUrl,
    shareBaseUrl: '$baseUrl/shared',
    emergencyPhoneNumber: '103',
    blockScreenshotsOnResults: false,
    firebaseEnabled: false,
  );
}
