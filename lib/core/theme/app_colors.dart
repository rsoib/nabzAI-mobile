import 'package:flutter/material.dart';

/// Design tokens for nabzAI. Dark is the flagship theme: deep graphite,
/// a single vivid jewel-tone accent (teal-emerald) used sparingly, and a
/// distinct urgency palette (grass-green / amber-gold / coral-red) that is
/// deliberately a different hue family from the brand accent so the two
/// are never visually confused.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textOnBrand,
    required this.brand,
    required this.brandDeep,
    required this.brandMuted,
    required this.urgencyCalm,
    required this.urgencyCalmSurface,
    required this.urgencyWarm,
    required this.urgencyWarmSurface,
    required this.urgencyCritical,
    required this.urgencyCriticalSurface,
  });

  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textOnBrand;

  /// The single brand accent (vivid teal-emerald). Use sparingly.
  final Color brand;

  /// Darker end of the brand gradient — pairs with [brand] for glossy,
  /// jewel-like fills on hero surfaces (primary button, hero card).
  final Color brandDeep;
  final Color brandMuted;

  /// Urgency semantics — a different hue family from the brand, never
  /// reused for branding, so "calm/warning/critical" never reads as "brand".
  final Color urgencyCalm;
  final Color urgencyCalmSurface;
  final Color urgencyWarm;
  final Color urgencyWarmSurface;
  final Color urgencyCritical;
  final Color urgencyCriticalSurface;

  static const AppColors dark = AppColors(
    background: Color(0xFF0B0D0F),
    surface: Color(0xFF15181B),
    surfaceElevated: Color(0xFF1D2125),
    border: Color(0xFF2A2F34),
    textPrimary: Color(0xFFF3F1EA),
    textSecondary: Color(0xFF9AA0A6),
    textOnBrand: Color(0xFF06211C),
    brand: Color(0xFF22E6C0),
    brandDeep: Color(0xFF0E7A67),
    brandMuted: Color(0xFF12312B),
    urgencyCalm: Color(0xFF4ADE80),
    urgencyCalmSurface: Color(0xFF16281C),
    urgencyWarm: Color(0xFFF5A623),
    urgencyWarmSurface: Color(0xFF2E2213),
    urgencyCritical: Color(0xFFF2545B),
    urgencyCriticalSurface: Color(0xFF301619),
  );

  static const AppColors light = AppColors(
    background: Color(0xFFF7F3EC),
    surface: Color(0xFFFFFFFF),
    surfaceElevated: Color(0xFFEFE9DC),
    border: Color(0xFFE3DAC7),
    textPrimary: Color(0xFF1E1B17),
    textSecondary: Color(0xFF6B6459),
    textOnBrand: Color(0xFFFFFFFF),
    brand: Color(0xFF0E8C77),
    brandDeep: Color(0xFF0B6E5C),
    brandMuted: Color(0xFFDCF1EC),
    urgencyCalm: Color(0xFF2F9E5B),
    urgencyCalmSurface: Color(0xFFE3F5EA),
    urgencyWarm: Color(0xFFB4740E),
    urgencyWarmSurface: Color(0xFFFBEFDA),
    urgencyCritical: Color(0xFFC24A44),
    urgencyCriticalSurface: Color(0xFFFBE6E4),
  );

  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? textOnBrand,
    Color? brand,
    Color? brandDeep,
    Color? brandMuted,
    Color? urgencyCalm,
    Color? urgencyCalmSurface,
    Color? urgencyWarm,
    Color? urgencyWarmSurface,
    Color? urgencyCritical,
    Color? urgencyCriticalSurface,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textOnBrand: textOnBrand ?? this.textOnBrand,
      brand: brand ?? this.brand,
      brandDeep: brandDeep ?? this.brandDeep,
      brandMuted: brandMuted ?? this.brandMuted,
      urgencyCalm: urgencyCalm ?? this.urgencyCalm,
      urgencyCalmSurface: urgencyCalmSurface ?? this.urgencyCalmSurface,
      urgencyWarm: urgencyWarm ?? this.urgencyWarm,
      urgencyWarmSurface: urgencyWarmSurface ?? this.urgencyWarmSurface,
      urgencyCritical: urgencyCritical ?? this.urgencyCritical,
      urgencyCriticalSurface: urgencyCriticalSurface ?? this.urgencyCriticalSurface,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textOnBrand: Color.lerp(textOnBrand, other.textOnBrand, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandDeep: Color.lerp(brandDeep, other.brandDeep, t)!,
      brandMuted: Color.lerp(brandMuted, other.brandMuted, t)!,
      urgencyCalm: Color.lerp(urgencyCalm, other.urgencyCalm, t)!,
      urgencyCalmSurface: Color.lerp(urgencyCalmSurface, other.urgencyCalmSurface, t)!,
      urgencyWarm: Color.lerp(urgencyWarm, other.urgencyWarm, t)!,
      urgencyWarmSurface: Color.lerp(urgencyWarmSurface, other.urgencyWarmSurface, t)!,
      urgencyCritical: Color.lerp(urgencyCritical, other.urgencyCritical, t)!,
      urgencyCriticalSurface: Color.lerp(urgencyCriticalSurface, other.urgencyCriticalSurface, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>() ?? AppColors.dark;
}
