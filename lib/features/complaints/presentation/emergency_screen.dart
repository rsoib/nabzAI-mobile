import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/config/app_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

/// Full-screen takeover when a complaints session's urgency turns red — no
/// path back into the chat (reached via `pushReplacement`, not `push`), per
/// the design brief: calm but unambiguous, one huge call button, no other
/// distractions.
class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key, this.summary});

  final String? summary;

  Future<void> _call() => launchUrl(Uri(scheme: 'tel', path: AppConfig.instance.emergencyPhoneNumber));

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final number = AppConfig.instance.emergencyPhoneNumber;
    return Scaffold(
      backgroundColor: colors.urgencyCriticalSurface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: [
              const Spacer(),
              Icon(Icons.emergency_rounded, color: colors.urgencyCritical, size: 72),
              const SizedBox(height: AppSpacing.lg),
              Text('Обратитесь за помощью срочно', style: AppTypography.headline, textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.sm),
              Text(
                summary ?? 'По вашим ответам это может быть опасно для здоровья. Не ждите — позвоните в скорую помощь.',
                style: AppTypography.body.copyWith(color: colors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 96,
                child: Material(
                  color: colors.urgencyCritical,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                    onTap: _call,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.call_rounded, color: Colors.white, size: 32),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Позвонить $number',
                            style: AppTypography.button.copyWith(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Оставайтесь на месте и не оставайтесь в одиночестве, если это возможно',
                style: AppTypography.caption.copyWith(color: colors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
