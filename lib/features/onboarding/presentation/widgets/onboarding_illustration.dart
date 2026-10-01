import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Simple geometric illustration for onboarding pages — layered translucent
/// circles behind a gradient badge with an icon. Deliberately not a stock
/// photo, per the design brief; reuses the same premium gradient+glow
/// language as the rest of the design system.
class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({super.key, required this.icon, required this.accent});

  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: 220,
      width: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(shape: BoxShape.circle, color: accent.withValues(alpha: 0.08)),
          ),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(shape: BoxShape.circle, color: accent.withValues(alpha: 0.14)),
          ),
          Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [accent, colors.brandDeep],
              ),
              boxShadow: [
                BoxShadow(color: accent.withValues(alpha: 0.4), blurRadius: 30, offset: const Offset(0, 12)),
              ],
            ),
            child: Icon(icon, size: 48, color: colors.textOnBrand),
          ),
        ],
      ),
    );
  }
}
