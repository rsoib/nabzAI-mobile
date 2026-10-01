import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../data/activity_repository.dart';
import '../data/models/daily_health_metric.dart';
import '../../../core/storage/local_flags_store.dart';
import 'cubit/activity_cubit.dart';
import 'cubit/activity_state.dart';

/// Weekly/monthly steps + pulse, synced in the background via
/// `POST /me/metrics/daily`. Shows a plain-language explanation before
/// requesting the system Health permission, per the design brief.
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late final ActivityCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ActivityCubit(activityRepository: getIt<ActivityRepository>(), flagsStore: getIt<LocalFlagsStore>());
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Активность')),
        body: BlocBuilder<ActivityCubit, ActivityState>(
          builder: (context, state) {
            return switch (state) {
              ActivityNotConnected() => _ConnectPrompt(onConnect: _cubit.connect),
              ActivityLoading() => const Center(child: CircularProgressIndicator()),
              ActivityError(:final message) => _ConnectPrompt(onConnect: _cubit.connect, error: message),
              ActivityConnected(:final metrics) =>
                metrics.isEmpty ? const _NoDataYet() : _ActivityCharts(metrics: metrics),
            };
          },
        ),
      ),
    );
  }
}

class _ConnectPrompt extends StatelessWidget {
  const _ConnectPrompt({required this.onConnect, this.error});

  final Future<bool> Function() onConnect;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_rounded, size: 56, color: colors.brand),
          const SizedBox(height: AppSpacing.lg),
          Text('Подключите шаги и пульс', style: AppTypography.title, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'nabzAI покажет шаги и пульс за неделю и месяц из Apple Health или Health Connect. Мы читаем только эти данные и не передаём их никуда, кроме анализа вашего здоровья.',
            style: AppTypography.body.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          if (error != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(error!, style: AppTypography.caption.copyWith(color: colors.urgencyCritical)),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppButton(label: 'Подключить', onPressed: onConnect, expand: false),
        ],
      ),
    );
  }
}

class _NoDataYet extends StatelessWidget {
  const _NoDataYet();

  @override
  Widget build(BuildContext context) {
    return const AppEmptyState(
      title: 'Пока нет данных',
      message: 'Как только часы или браслет запишут шаги или пульс, они появятся здесь.',
      icon: Icons.favorite_border_rounded,
    );
  }
}

class _ActivityCharts extends StatelessWidget {
  const _ActivityCharts({required this.metrics});

  final List<DailyHealthMetric> metrics;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sorted = [...metrics]..sort((a, b) => a.date.compareTo(b.date));
    final last7 = sorted.length > 7 ? sorted.sublist(sorted.length - 7) : sorted;

    final totalSteps = sorted.fold<int>(0, (sum, m) => sum + (m.steps ?? 0));
    final avgHrValues = sorted.map((m) => m.avgHr).whereType<int>().toList();
    final avgHr = avgHrValues.isEmpty ? null : (avgHrValues.reduce((a, b) => a + b) / avgHrValues.length).round();

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Row(
          children: [
            Expanded(child: _StatCard(label: 'Шаги за месяц', value: '$totalSteps')),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: _StatCard(label: 'Средний пульс', value: avgHr == null ? '—' : '$avgHr уд/мин')),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Шаги за неделю', style: AppTypography.title),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: SizedBox(
            height: 180,
            child: BarChart(
              BarChartData(
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= last7.length) return const SizedBox.shrink();
                        final date = DateTime.parse(last7[index].date);
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text('${date.day}.${date.month}', style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: [
                  for (var i = 0; i < last7.length; i++)
                    BarChartGroupData(x: i, barRods: [
                      BarChartRodData(
                        toY: (last7[i].steps ?? 0).toDouble(),
                        color: colors.brand,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
          const SizedBox(height: AppSpacing.xs),
          Text(value, style: AppTypography.statNumber.copyWith(fontSize: 28)),
        ],
      ),
    );
  }
}
