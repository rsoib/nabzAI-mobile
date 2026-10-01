import 'package:flutter/material.dart';

/// Drives light/dark/system selection app-wide. A single ValueNotifier is
/// enough here — this is UI-only state, not worth a full Cubit.
class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.dark);

  void toggle() => value = value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

  void set(ThemeMode mode) => value = mode;
}
