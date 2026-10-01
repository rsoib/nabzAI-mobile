/// Build flavor. Chosen per entry point (main_dev.dart / main_prod.dart).
enum Flavor { dev, prod }

/// Environment configuration. `AppConfig.instance` is set once during
/// bootstrap (see main_dev.dart / main_prod.dart) before [setupServiceLocator]
/// runs, so any part of the app can read it without DI plumbing.
class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.apiBaseUrl,
    required this.shareBaseUrl,
    required this.emergencyPhoneNumber,
    required this.blockScreenshotsOnResults,
    required this.firebaseEnabled,
  });

  final Flavor flavor;

  /// Backend base URL. On Android emulators "localhost" refers to the
  /// emulator itself, not the host machine — see [devApiBaseUrl].
  final String apiBaseUrl;

  /// Base URL used to build the human-facing link shown as text/QR on the
  /// "share with doctor" screen: `$shareBaseUrl/<token>`. The backend's
  /// `/shared/:token` endpoint returns raw JSON (no doctor-facing web page
  /// exists yet) — this is a known gap, see README.
  final String shareBaseUrl;

  /// Ambulance number for the emergency screen. Not exposed by the API.
  final String emergencyPhoneNumber;

  /// Whether to block screenshots on screens showing lab results (Android
  /// only — `FLAG_SECURE`).
  final bool blockScreenshotsOnResults;

  /// Whether Firebase is configured for this build. When false, push
  /// notifications fall back to a no-op stub instead of crashing on a
  /// missing `google-services.json` / `GoogleService-Info.plist`.
  final bool firebaseEnabled;

  static late AppConfig instance;

  static void init(AppConfig config) => instance = config;
}
