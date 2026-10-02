import 'package:intl/intl.dart';
import '../../data/models/lab_report.dart';
import '../../data/models/lab_result.dart';

const _flagLabels = {
  ResultFlag.low: '⬇️ ниже нормы',
  ResultFlag.high: '⬆️ выше нормы',
  ResultFlag.criticalLow: '❗ критически низко',
  ResultFlag.criticalHigh: '❗ критически высоко',
};

/// Plain-text summary of a lab report for sending to a doctor through any
/// messenger (WhatsApp, Telegram...). Unlike the share link — whose backend
/// endpoint currently returns raw JSON — this reads well in a chat as is.
/// Contains no patient name: the report doesn't carry one.
String buildLabReportShareText(LabReport report, {String? urgencyTitle}) {
  final lines = <String>['Результаты анализа (nabzAI)'];

  final date = _formatDate(report.displayDate);
  if (date != null) lines.add('Дата: $date');
  final labName = report.labName;
  if (labName != null && labName.isNotEmpty) lines.add('Лаборатория: $labName');
  lines.add('');

  for (final result in report.results) {
    final buffer = StringBuffer('• ${result.displayName(isTajik: false)}: ${result.displayValue}');
    if (result.displayUnit.isNotEmpty) buffer.write(' ${result.displayUnit}');
    final range = result.referenceRange;
    if (range != null) buffer.write(' (норма ${_formatNumber(range.low)}–${_formatNumber(range.high)})');
    final flag = _flagLabels[result.flag];
    if (flag != null) buffer.write(' $flag');
    lines.add(buffer.toString());
  }

  if (urgencyTitle != null || report.specialist != null) lines.add('');
  if (urgencyTitle != null) lines.add('Оценка: $urgencyTitle');
  final specialist = report.specialist;
  if (specialist != null && specialist.isNotEmpty) lines.add('Рекомендуемый специалист: $specialist');

  lines
    ..add('')
    ..add('nabzAI не ставит диагноз — это подсказки. Решение принимает врач.');
  return lines.join('\n');
}

String? _formatDate(String raw) {
  final parsed = DateTime.tryParse(raw);
  return parsed == null ? null : DateFormat('dd.MM.yyyy').format(parsed.toLocal());
}

String _formatNumber(double v) => v == v.roundToDouble() ? v.toStringAsFixed(0) : '$v';
