import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Builds the two [ThemeData] instances. Dark is the flagship look — deep
/// graphite with a single glowing accent — light is the same system tuned
/// for bright environments. No default Material elevation; depth comes from
/// deliberate shadows/gradients in the widgets themselves, not theme-wide
/// elevation defaults.
class AppTheme {
  const AppTheme._();

  static ThemeData light() => _build(AppColors.light, Brightness.light);
  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);
    final textTheme = base.textTheme.apply(
      bodyColor: colors.textPrimary,
      displayColor: colors.textPrimary,
      fontFamily: AppTypography.fontFamily,
    );

    return base.copyWith(
      scaffoldBackgroundColor: colors.background,
      canvasColor: colors.background,
      colorScheme: base.colorScheme.copyWith(
        brightness: brightness,
        primary: colors.brand,
        onPrimary: colors.textOnBrand,
        secondary: colors.brand,
        surface: colors.surface,
        onSurface: colors.textPrimary,
        error: colors.urgencyCritical,
        onError: colors.textOnBrand,
      ),
      extensions: [colors],
      textTheme: textTheme,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      dividerColor: colors.border,
      dividerTheme: DividerThemeData(color: colors.border, space: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.title.copyWith(color: colors.textPrimary),
        iconTheme: IconThemeData(color: colors.textPrimary),
      ),
      iconTheme: IconThemeData(color: colors.textPrimary),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
