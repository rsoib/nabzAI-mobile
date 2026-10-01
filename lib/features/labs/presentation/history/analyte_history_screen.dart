import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_skeleton.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../data/labs_repository.dart';
import '../../data/models/lab_result.dart';

/// Line chart over `GET /me/labs/analytes/:code/history` — each point now
/// carries `collectedAt` and `referenceRange` thanks to the backend patch
/// (see README), so the normal band can be drawn even though the endpoint
/// wasn't originally built to support this screen.
class AnalyteHistoryScreen extends StatefulWidget {
  const AnalyteHistoryScreen({super.key, required this.code, required this.title});

  final String code;
  final String title;

  @override
  State<AnalyteHistoryScreen> createState() => _AnalyteHistoryScreenState();
}

class _AnalyteHistoryScreenState extends State<AnalyteHistoryScreen> {
  late Future<List<LabResult>> _future;

  @override
  void initState() {
    super.initState();
    _future = getIt<LabsRepository>().getAnalyteHistory(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<List<LabResult>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: AppSkeleton(width: double.infinity, height: 240),
            );
          }
          final points = (snapshot.data ?? []).where((r) => r.value != null && r.collectedAt != null).toList();
          if (points.isEmpty) {
            return const AppEmptyState(
              title: 'Пока нет истории',
              message: 'Как только появится ещё один анализ с этим показателем, здесь будет график.',
              icon: Icons.show_chart_rounded,
            );
          }

          final referenceRange = points.map((p) => p.referenceRange).lastWhere(
                (r) => r != null,
                orElse: () => null,
              );
          final spots = [
            for (var i = 0; i < points.length; i++) FlSpot(i.toDouble(), points[i].value!),
          ];

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (referenceRange != null)
                  Text(
                    'Норма: ${referenceRange.low}–${referenceRange.high} ${referenceRange.unit}',
                    style: AppTypography.caption.copyWith(color: colors.urgencyCalm, fontWeight: FontWeight.w700),
                  ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: 260,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) => Text(
                              value.toStringAsFixed(0),
                              style: AppTypography.caption.copyWith(color: colors.textSecondary),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index < 0 || index >= points.length) return const SizedBox.shrink();
                              final date = DateTime.parse(points[index].collectedAt!);
                              return Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  '${date.day}.${date.month}',
                                  style: AppTypography.caption.copyWith(color: colors.textSecondary),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      extraLinesData: referenceRange == null
                          ? const ExtraLinesData()
                          : ExtraLinesData(
                              horizontalLines: [
                                HorizontalLine(y: referenceRange.low, color: colors.urgencyCalm, dashArray: [6, 4]),
                                HorizontalLine(y: referenceRange.high, color: colors.urgencyCalm, dashArray: [6, 4]),
                              ],
                            ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          color: colors.brand,
                          barWidth: 3,
                          dotData: FlDotData(
                            getDotPainter: (spot, percent, bar, index) =>
                                FlDotCirclePainter(radius: 4, color: colors.brand, strokeColor: colors.surface, strokeWidth: 2),
                          ),
                          belowBarData: BarAreaData(show: true, color: colors.brand.withValues(alpha: 0.12)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
