import 'app_config.dart';

/// Local backend, run via `nest start api` on port 3000 (see
/// /Users/artem/projects/nabzAI/backend). On Android (USB phone or emulator)
/// "localhost" is the device itself — forward the port to the host first:
/// `adb reverse tcp:3000 tcp:3000`.
AppConfig buildDevConfig() {
  const host = 'localhost';
  final baseUrl = 'http://$host:3000';
  return AppConfig(
    flavor: Flavor.dev,
    apiBaseUrl: baseUrl,
    shareBaseUrl: '$baseUrl/shared',
    emergencyPhoneNumber: '103',
    blockScreenshotsOnResults: false,
    firebaseEnabled: false,
  );
}
