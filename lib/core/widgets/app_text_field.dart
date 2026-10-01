import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Labeled text field with a large, calm surface and no Material underline
/// look. Label sits above the field (not floating) so it never gets cramped
/// under large system font scaling.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.errorText,
    this.helperText,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChanged,
    this.enabled = true,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.inputFormatters,
    this.showLabel = true,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? errorText;
  final String? helperText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool autofocus;
  final TextAlign textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(label, style: AppTypography.label.copyWith(color: colors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
        ],
        Container(
          constraints: const BoxConstraints(minHeight: AppSpacing.minTapTarget + 8),
          decoration: BoxDecoration(
            color: enabled ? colors.surface : colors.surfaceElevated,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: hasError ? colors.urgencyCritical : colors.border,
              width: hasError ? 1.5 : 1,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            onChanged: onChanged,
            enabled: enabled,
            autofocus: autofocus,
            textAlign: textAlign,
            inputFormatters: inputFormatters,
            style: (style ?? AppTypography.bodyLarge).copyWith(color: colors.textPrimary),
            cursorColor: colors.brand,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTypography.bodyLarge.copyWith(color: colors.textSecondary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
            ),
          ),
        ),
        if (hasError || helperText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            hasError ? errorText! : helperText!,
            style: AppTypography.caption.copyWith(
              color: hasError ? colors.urgencyCritical : colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
