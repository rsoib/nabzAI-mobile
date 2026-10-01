import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled2/core/theme/app_theme.dart';
import 'package:untitled2/core/widgets/urgency_card.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(theme: AppTheme.dark(), home: Scaffold(body: child));

  testWidgets('calm level shows its title and a check icon', (tester) async {
    await tester.pumpWidget(wrap(const UrgencyCard(level: UrgencyLevel.calm, title: 'Всё в порядке')));

    expect(find.text('Всё в порядке'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
  });

  testWidgets('critical level shows title, specialist and a warning icon', (tester) async {
    await tester.pumpWidget(
      wrap(
        const UrgencyCard(
          level: UrgencyLevel.critical,
          title: 'Обратитесь к врачу срочно',
          specialist: 'Скорая помощь',
        ),
      ),
    );

    expect(find.text('Обратитесь к врачу срочно'), findsOneWidget);
    expect(find.text('Скорая помощь'), findsOneWidget);
    expect(find.byIcon(Icons.warning_rounded), findsOneWidget);
  });
}
