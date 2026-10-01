import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// The branded welcome screen shown once, before the onboarding carousel,
/// to a user who has never finished onboarding. Distinct from the generic
/// spinner shown at the auth-bootstrap `/splash` route.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onContinue,
          child: Column(
            children: [
              const Spacer(flex: 3),
              ShaderMask(
                shaderCallback: (bounds) =>
                    LinearGradient(colors: [colors.brand, colors.brandDeep]).createShader(bounds),
                child: Text(
                  'nabzAI',
                  style: AppTypography.display.copyWith(color: Colors.white, fontSize: 48),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Понятный помощник для здоровья',
                style: AppTypography.body.copyWith(color: colors.textSecondary),
              ),
              const Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  'Нажмите, чтобы продолжить',
                  style: AppTypography.caption.copyWith(color: colors.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
