import 'package:flutter/material.dart';
import '../../../../core/models/urgency.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/normal_range_scale.dart';
import '../../../../core/widgets/urgency_card.dart';
import '../../data/models/lab_report.dart';
import '../../data/models/lab_result.dart';
import '../history/analyte_history_screen.dart';

const _urgencyTitles = {
  UrgencyLevel.calm: 'Всё в порядке',
  UrgencyLevel.warning: 'Стоит показаться врачу в ближайшее время',
  UrgencyLevel.critical: 'Обратитесь к врачу срочно',
};

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.report});

  final LabReport report;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final level = report.urgency?.toUrgencyLevel() ?? UrgencyLevel.calm;
    final explanation = report.explanation(isTajik: false);
    final paragraphs = explanation.split('\n\n').where((p) => p.trim().isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Результат анализа')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          UrgencyCard(level: level, title: _urgencyTitles[level]!, specialist: report.specialist),
          if (paragraphs.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            for (final p in paragraphs) ...[
              Text(p, style: AppTypography.body.copyWith(color: colors.textSecondary)),
              const SizedBox(height: AppSpacing.sm),
            ],
          ],
          const SizedBox(height: AppSpacing.lg),
          for (final result in report.results) ...[
            _AnalyteCard(result: result),
            const SizedBox(height: AppSpacing.md),
          ],
          const SizedBox(height: AppSpacing.md),
          Text(
            'nabzAI не ставит диагноз — это подсказки для вас. Решение всегда принимает врач.',
            style: AppTypography.caption.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Поделиться с врачом', icon: Icons.ios_share_rounded, onPressed: () {}),
        ],
      ),
    );
  }
}

class _AnalyteCard extends StatelessWidget {
  const _AnalyteCard({required this.result});

  final LabResult result;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final code = result.analyte?.code;
    final referenceRange = result.referenceRange;

    Widget? scale;
    if (referenceRange != null && result.value != null) {
      scale = NormalRangeScale.quantitative(
        low: referenceRange.low,
        high: referenceRange.high,
        value: result.value!,
        criticalLow: referenceRange.criticalLow,
        criticalHigh: referenceRange.criticalHigh,
        unit: result.displayUnit,
      );
    } else if (result.flag != null) {
      scale = NormalRangeScale.qualitative(flag: _toQualitativeFlag(result.flag!));
    }

    return AppCard(
      onTap: code == null ? null : () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => AnalyteHistoryScreen(code: code, title: result.displayName(isTajik: false))),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(result.displayName(isTajik: false), style: AppTypography.title)),
              Text(
                '${result.displayValue} ${result.displayUnit}',
                style: AppTypography.label.copyWith(color: colors.textPrimary),
              ),
            ],
          ),
          if (scale != null) ...[
            const SizedBox(height: AppSpacing.md),
            scale,
          ],
        ],
      ),
    );
  }
}

QualitativeFlag _toQualitativeFlag(ResultFlag flag) => switch (flag) {
      ResultFlag.low => QualitativeFlag.low,
      ResultFlag.normal => QualitativeFlag.normal,
      ResultFlag.high => QualitativeFlag.high,
      ResultFlag.criticalLow => QualitativeFlag.criticalLow,
      ResultFlag.criticalHigh => QualitativeFlag.criticalHigh,
    };
