import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Quick-reply chip used in the complaints chat and elsewhere a short tap
/// beats typing. Always at least 48dp tall.
class AppChip extends StatelessWidget {
  const AppChip({super.key, required this.label, this.icon, this.selected = false, this.onTap});

  final String label;

  /// Optional leading icon, drawn from the app's single linear/rounded icon
  /// set (see design system) — keeps symptom chips consistent with the rest
  /// of the UI instead of reaching for emoji.
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final background = selected ? colors.brand : colors.surfaceElevated;
    final foreground = selected ? colors.textOnBrand : colors.textPrimary;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
        onTap: onTap == null
            ? null
            : () {
                HapticFeedback.selectionClick();
                onTap!();
              },
        child: Container(
          constraints: const BoxConstraints(minHeight: AppSpacing.minTapTarget),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
            border: selected ? null : Border.all(color: colors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: foreground),
                const SizedBox(width: AppSpacing.xs),
              ],
              Text(label, style: AppTypography.label.copyWith(color: foreground)),
            ],
          ),
        ),
      ),
    );
  }
}
