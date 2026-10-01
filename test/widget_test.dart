import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled2/core/config/app_config.dart';
import 'package:untitled2/core/config/app_config_dev.dart';
import 'package:untitled2/core/di/service_locator.dart';
import 'package:untitled2/core/theme/app_theme.dart';
import 'package:untitled2/features/auth/presentation/phone_entry_screen.dart';

void main() {
  testWidgets('Phone entry screen renders its main heading', (WidgetTester tester) async {
    AppConfig.init(buildDevConfig());
    // AuthCubit is a lazy singleton and is never touched by this screen, so
    // its bootstrap (which reads flutter_secure_storage — unavailable under
    // `flutter test`'s VM platform and would hang rather than throw) never
    // runs. A full auth-flow integration test belongs in the testing pass
    // (mocktail-backed AuthRepository/SecureTokenStorage), not here.
    await setupServiceLocator();

    await tester.pumpWidget(MaterialApp(theme: AppTheme.dark(), home: const PhoneEntryScreen()));
    // Not pumpAndSettle: the phone field autofocuses and its blinking
    // cursor schedules frames forever.
    await tester.pump();

    expect(find.text('Ваш номер телефона'), findsOneWidget);
  });
}
