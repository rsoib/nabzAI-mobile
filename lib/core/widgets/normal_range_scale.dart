import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Mirrors the backend `ResultFlag` enum. Used as the fallback visual when a
/// numeric reference range isn't available for an analyte.
enum QualitativeFlag { criticalLow, low, normal, high, criticalHigh }

/// "Where is normal, where is the patient's value" — readable in one
/// glance, per the design brief. Two constructors:
///  - [NormalRangeScale.quantitative] draws a real number line when a
///    reference range (low/high, optionally critical bounds) is known.
///  - [NormalRangeScale.qualitative] falls back to a 5-segment bar driven
///    only by the flag enum, for analytes without a numeric range on record.
class NormalRangeScale extends StatelessWidget {
  const NormalRangeScale.quantitative({
    super.key,
    required double low,
    required double high,
    required double value,
    double? criticalLow,
    double? criticalHigh,
    this.unit,
  })  : _low = low,
        _high = high,
        _value = value,
        _criticalLow = criticalLow,
        _criticalHigh = criticalHigh,
        _flag = null;

  const NormalRangeScale.qualitative({super.key, required QualitativeFlag flag, this.unit})
      : _flag = flag,
        _low = null,
        _high = null,
        _value = null,
        _criticalLow = null,
        _criticalHigh = null;

  final double? _low;
  final double? _high;
  final double? _value;
  final double? _criticalLow;
  final double? _criticalHigh;
  final QualitativeFlag? _flag;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (_flag != null) {
      return _QualitativeBar(flag: _flag, colors: colors);
    }
    return _QuantitativeBar(
      low: _low!,
      high: _high!,
      value: _value!,
      criticalLow: _criticalLow,
      criticalHigh: _criticalHigh,
      unit: unit,
      colors: colors,
    );
  }
}

String _formatNumber(double v) => v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

class _QuantitativeBar extends StatelessWidget {
  const _QuantitativeBar({
    required this.low,
    required this.high,
    required this.value,
    required this.criticalLow,
    required this.criticalHigh,
    required this.unit,
    required this.colors,
  });

  final double low;
  final double high;
  final double value;
  final double? criticalLow;
  final double? criticalHigh;
  final String? unit;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    final margin = (high - low).abs() * 0.4 + 0.0001;
    final rangeLow = criticalLow ?? (low - margin);
    final rangeHigh = criticalHigh ?? (high + margin);
    final span = (rangeHigh - rangeLow).abs().clamp(0.0001, double.infinity);
    double posFor(double v) => ((v - rangeLow) / span).clamp(0.0, 1.0);

    final lowPos = posFor(low);
    final highPos = posFor(high);
    final valuePos = posFor(value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return SizedBox(
              height: 28,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 6,
                    margin: const EdgeInsets.only(top: 11),
                    decoration: BoxDecoration(
                      color: colors.surfaceElevated,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Positioned(
                    left: width * lowPos,
                    top: 11,
                    width: (width * (highPos - lowPos)).clamp(0.0, width),
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: colors.urgencyCalm,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (width * valuePos - 8).clamp(0.0, width - 16),
                    top: 6,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: colors.brand,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.surface, width: 3),
                        boxShadow: [
                          BoxShadow(color: colors.brand.withValues(alpha: 0.5), blurRadius: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatNumber(low), style: AppTypography.caption.copyWith(color: colors.textSecondary)),
            Text(
              unit == null ? 'Норма' : 'Норма, $unit',
              style: AppTypography.caption.copyWith(color: colors.urgencyCalm, fontWeight: FontWeight.w700),
            ),
            Text(_formatNumber(high), style: AppTypography.caption.copyWith(color: colors.textSecondary)),
          ],
        ),
      ],
    );
  }
}

class _QualitativeBar extends StatelessWidget {
  const _QualitativeBar({required this.flag, required this.colors});

  final QualitativeFlag flag;
  final AppColors colors;

  static const Map<QualitativeFlag, String> _labels = {
    QualitativeFlag.criticalLow: 'Критически низко',
    QualitativeFlag.low: 'Ниже нормы',
    QualitativeFlag.normal: 'Норма',
    QualitativeFlag.high: 'Выше нормы',
    QualitativeFlag.criticalHigh: 'Критически высоко',
  };

  Color _colorFor(QualitativeFlag f) => switch (f) {
        QualitativeFlag.normal => colors.urgencyCalm,
        QualitativeFlag.low || QualitativeFlag.high => colors.urgencyWarm,
        QualitativeFlag.criticalLow || QualitativeFlag.criticalHigh => colors.urgencyCritical,
      };

  @override
  Widget build(BuildContext context) {
    const segments = QualitativeFlag.values;
    final activeIndex = segments.indexOf(flag);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final segWidth = width / segments.length;
            return SizedBox(
              height: 28,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                    children: [
                      for (final s in segments)
                        Expanded(
                          child: Container(
                            height: 6,
                            margin: const EdgeInsets.only(top: 11, right: 2),
                            decoration: BoxDecoration(
                              color: _colorFor(s).withValues(alpha: s == flag ? 1 : 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Positioned(
                    left: (segWidth * activeIndex + segWidth / 2 - 8).clamp(0.0, width - 16),
                    top: 6,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: _colorFor(flag),
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.surface, width: 3),
                        boxShadow: [
                          BoxShadow(color: _colorFor(flag).withValues(alpha: 0.5), blurRadius: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          _labels[flag]!,
          style: AppTypography.caption.copyWith(color: _colorFor(flag), fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
