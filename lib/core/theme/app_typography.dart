import 'package:flutter/widgets.dart';

/// Type scale for nabzAI. Noto Sans, bundled as static weight files
/// (Light/Regular/Medium/SemiBold/Bold/ExtraBold) rather than the variable
/// font — this guarantees each weight renders distinctly, which matters for
/// the editorial, premium hierarchy this app is going for. The family has
/// verified glyph coverage for the Tajik Cyrillic letters (ҳ ҷ қ ғ ӣ ӯ).
///
/// Base reading size is 16dp; only the caption style dips below that,
/// intentionally, for secondary metadata only.
class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'NotoSans';

  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    height: 1.1,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 26,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1.4,
    fontWeight: FontWeight.w500,
  );

  /// A large, light-weight numeral style for hero stats (e.g. "72 уд/мин")
  /// — mixing a light large figure with bold small labels reads as
  /// editorial/premium rather than "app-y".
  static const TextStyle statNumber = TextStyle(
    fontFamily: fontFamily,
    fontSize: 44,
    height: 1.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  /// Reference string for verifying Tajik-specific Cyrillic letters render
  /// correctly (ҳ ҷ қ ғ ӣ ӯ and their capitals). Shown on the design-system
  /// showcase screen in every weight — a native speaker should confirm it.
  static const String tajikGlyphCheck = 'Ҳаёт, ҷон, қалб, ғам, дӯст, шумо ӣ';
}
