import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/di/service_locator.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/theme_controller.dart';

/// Root widget. The router is built once at bootstrap (see main_dev.dart)
/// and passed in — rebuilding it on every theme toggle would reset the
/// navigation stack.
class NabzApp extends StatelessWidget {
  const NabzApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    final themeController = getIt<ThemeController>();
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, mode, _) => MaterialApp.router(
        title: 'nabzAI',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: mode,
        routerConfig: router,
      ),
    );
  }
}
