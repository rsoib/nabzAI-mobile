import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/storage/local_flags_store.dart';
import '../../../core/theme/app_motion.dart';
import 'consent_screen.dart';
import 'onboarding_carousel_screen.dart';
import 'splash_screen.dart';

enum _OnboardingStep { splash, carousel, consent }

/// Local step machine for the pre-auth flow (splash → carousel → consent).
/// Kept as a single route so the router's redirect logic only needs to know
/// about "/onboarding" as a whole, not each sub-step.
class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  _OnboardingStep _step = _OnboardingStep.splash;

  Future<void> _finish() async {
    await getIt<LocalFlagsStore>().markOnboardingSeen();
    widget.onFinished();
  }

  @override
  Widget build(BuildContext context) {
    final child = switch (_step) {
      _OnboardingStep.splash => SplashScreen(
          key: const ValueKey('splash'),
          onContinue: () => setState(() => _step = _OnboardingStep.carousel),
        ),
      _OnboardingStep.carousel => OnboardingCarouselScreen(
          key: const ValueKey('carousel'),
          onDone: () => setState(() => _step = _OnboardingStep.consent),
        ),
      _OnboardingStep.consent => ConsentScreen(key: const ValueKey('consent'), onAccepted: _finish),
    };

    return AnimatedSwitcher(duration: AppMotion.normal, child: child);
  }
}
