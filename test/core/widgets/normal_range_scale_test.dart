import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled2/core/theme/app_theme.dart';
import 'package:untitled2/core/widgets/normal_range_scale.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(theme: AppTheme.dark(), home: Scaffold(body: child));

  testWidgets('quantitative scale shows the low/high bounds', (tester) async {
    await tester.pumpWidget(
      wrap(const NormalRangeScale.quantitative(low: 120, high: 160, value: 140, unit: 'г/л')),
    );

    expect(find.text('120'), findsOneWidget);
    expect(find.text('160'), findsOneWidget);
  });

  testWidgets('qualitative scale falls back to the flag label when no numeric range exists', (tester) async {
    await tester.pumpWidget(wrap(const NormalRangeScale.qualitative(flag: QualitativeFlag.high)));

    expect(find.text('Выше нормы'), findsOneWidget);
  });
}
