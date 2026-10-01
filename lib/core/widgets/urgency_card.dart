import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Three urgency levels, matching backend `Urgency` (green/yellow/red).
/// Never rely on color alone: icon + short phrase always accompany it.
/// A deliberately different hue family from the brand accent — this must
/// never read as "brand-colored", it reads as "status".
enum UrgencyLevel { calm, warning, critical }

class UrgencyCard extends StatelessWidget {
  const UrgencyCard({
    super.key,
    required this.level,
    required this.title,
    this.specialist,
  });

  final UrgencyLevel level;

  /// Short, plain-language phrase, e.g. "Всё в порядке".
  final String title;

  /// Which kind of doctor to see, if applicable.
  final String? specialist;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (Color accent, Color surface, IconData icon) = switch (level) {
      UrgencyLevel.calm => (colors.urgencyCalm, colors.urgencyCalmSurface, Icons.check_circle_rounded),
      UrgencyLevel.warning => (colors.urgencyWarm, colors.urgencyWarmSurface, Icons.info_rounded),
      UrgencyLevel.critical => (colors.urgencyCritical, colors.urgencyCriticalSurface, Icons.warning_rounded),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [accent.withValues(alpha: 0.9), accent.withValues(alpha: 0.55)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: accent.withValues(alpha: 0.4), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Icon(icon, color: colors.textOnBrand, size: 28),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.title.copyWith(color: colors.textPrimary)),
                if (specialist != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    specialist!,
                    style: AppTypography.caption.copyWith(color: accent, fontWeight: FontWeight.w700),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
