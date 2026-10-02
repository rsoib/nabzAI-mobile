import 'package:flutter_test/flutter_test.dart';
import 'package:untitled2/features/labs/data/models/lab_report.dart';
import 'package:untitled2/features/labs/data/models/lab_result.dart';
import 'package:untitled2/features/labs/data/models/reference_range.dart';
import 'package:untitled2/features/labs/presentation/result/lab_report_share_text.dart';

void main() {
  test('lists every result with unit, normal range and flag', () {
    const report = LabReport(
      id: '1',
      fileId: 'f1',
      createdAt: '2026-10-02T09:00:00Z',
      labName: 'Шифо',
      status: LabReportStatus.analyzed,
      specialist: 'терапевт',
      results: [
        LabResult(
          id: 'r1',
          rawName: 'Тромбоциты',
          value: 213,
          unit: '10^9/L',
          flag: ResultFlag.normal,
          referenceRange: ReferenceRange(low: 150, high: 400, unit: '10^9/L'),
        ),
        LabResult(
          id: 'r2',
          rawName: 'Гемоглобин',
          value: 98,
          unit: 'г/л',
          flag: ResultFlag.low,
          referenceRange: ReferenceRange(low: 120, high: 160, unit: 'г/л'),
        ),
        LabResult(id: 'r3', rawName: 'PCT', value: 1.54),
      ],
    );

    final text = buildLabReportShareText(report, urgencyTitle: 'Стоит показаться врачу');

    expect(text, contains('Дата: 02.10.2026'));
    expect(text, contains('Лаборатория: Шифо'));
    expect(text, contains('• Тромбоциты: 213 10^9/L (норма 150–400)\n'));
    expect(text, contains('• Гемоглобин: 98 г/л (норма 120–160) ⬇️ ниже нормы'));
    expect(text, contains('• PCT: 1.54\n'));
    expect(text, contains('Оценка: Стоит показаться врачу'));
    expect(text, contains('Рекомендуемый специалист: терапевт'));
  });
}
