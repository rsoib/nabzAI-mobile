import 'app_config.dart';

/// TODO(release): replace with the real production domain before shipping —
/// this is a placeholder since no production backend exists yet.
AppConfig buildProdConfig() {
  const baseUrl = 'https://api.nabzai.tj';
  return const AppConfig(
    flavor: Flavor.prod,
    apiBaseUrl: baseUrl,
    shareBaseUrl: '$baseUrl/shared',
    emergencyPhoneNumber: '103',
    blockScreenshotsOnResults: true,
    firebaseEnabled: true,
  );
}
