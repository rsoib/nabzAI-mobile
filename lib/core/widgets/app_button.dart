import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

enum AppButtonVariant { primary, secondary, text }

/// The single large action button used at the bottom of every screen, in
/// the thumb-reach zone. The primary variant is a glossy brand gradient
/// with a soft outer glow — the one moment of visual richness per screen.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.expand = true,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool expand;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = onPressed != null && !loading;

    Gradient? gradient;
    Color? flatColor;
    final Color foreground;
    final BoxBorder? border;
    List<BoxShadow> shadows = const [];

    switch (variant) {
      case AppButtonVariant.primary:
        gradient = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.brand, colors.brandDeep],
        );
        foreground = colors.textOnBrand;
        border = null;
        shadows = [
          BoxShadow(color: colors.brand.withValues(alpha: 0.35), blurRadius: 24, offset: const Offset(0, 10)),
        ];
      case AppButtonVariant.secondary:
        flatColor = colors.surfaceElevated;
        foreground = colors.textPrimary;
        border = Border.all(color: colors.border);
      case AppButtonVariant.text:
        flatColor = Colors.transparent;
        foreground = colors.brand;
        border = null;
    }

    final content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading) ...[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.4, color: foreground),
          ),
          const SizedBox(width: AppSpacing.sm),
        ] else if (icon != null) ...[
          Icon(icon, color: foreground, size: 22),
          const SizedBox(width: AppSpacing.sm),
        ],
        Flexible(
          child: Text(
            label,
            style: AppTypography.button.copyWith(
              color: enabled ? foreground : foreground.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

    final BoxDecoration decoration = !enabled
        ? BoxDecoration(
            color: colors.surfaceElevated,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: border,
          )
        : BoxDecoration(
            color: gradient == null ? flatColor : null,
            gradient: gradient,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: border,
            boxShadow: shadows,
          );

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        width: expand ? double.infinity : null,
        height: AppSpacing.minTapTarget + 8,
        decoration: decoration,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            onTap: enabled
                ? () {
                    HapticFeedback.mediumImpact();
                    onPressed!();
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Center(child: content),
            ),
          ),
        ),
      ),
    );
  }
}
