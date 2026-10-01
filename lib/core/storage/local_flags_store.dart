import 'package:shared_preferences/shared_preferences.dart';

/// Small, non-secret local flags (onboarding seen, data-processing consent
/// given). Separate from [SecureTokenStorage] — nothing here is sensitive,
/// so plain SharedPreferences is enough; no reason to hit the keychain for
/// this.
class LocalFlagsStore {
  static const _onboardingSeenKey = 'nabz_onboarding_seen';
  static const _consentGivenKey = 'nabz_consent_given';
  static const _healthConnectedKey = 'nabz_health_connected';

  Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingSeenKey) ?? false;
  }

  Future<void> markOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingSeenKey, true);
  }

  Future<bool> hasGivenConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentGivenKey) ?? false;
  }

  Future<void> markConsentGiven() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentGivenKey, true);
  }

  Future<bool> hasHealthConnected() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_healthConnectedKey) ?? false;
  }

  Future<void> markHealthConnected() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_healthConnectedKey, true);
  }
}
