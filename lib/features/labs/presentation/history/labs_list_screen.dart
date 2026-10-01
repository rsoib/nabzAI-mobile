import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/models/urgency.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_skeleton.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/urgency_card.dart';
import '../../data/labs_repository.dart';
import '../../data/models/lab_report.dart';
import '../processing/processing_screen.dart';
import '../result/result_screen.dart';
import '../review/review_screen.dart';
import '../upload/upload_source_screen.dart';

/// All reports by date with status, per the design brief. `GET
/// /me/labs/reports` returns reports without `results` (list is summary
/// only) — tapping a report re-fetches it by id to get the full picture
/// before routing to the right screen for its status.
class LabsListScreen extends StatefulWidget {
  const LabsListScreen({super.key});

  @override
  State<LabsListScreen> createState() => _LabsListScreenState();
}

class _LabsListScreenState extends State<LabsListScreen> {
  late Future<List<LabReport>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = getIt<LabsRepository>().list();
  }

  Future<void> _refresh() async {
    setState(_reload);
    await _future;
  }

  Future<void> _open(LabReport summary) async {
    if (summary.isProcessing) {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ProcessingScreen(reportId: summary.id)),
      );
      _refresh();
      return;
    }
    final full = await getIt<LabsRepository>().getById(summary.id);
    if (!mounted) return;
    if (full.needsReview) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReviewScreen(report: full)));
    } else if (full.isReady) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => ResultScreen(report: full)));
    } else if (full.isFailed) {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ProcessingScreen(reportId: full.id)),
      );
    }
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Анализы'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const UploadSourceScreen()),
            ).then((_) => setState(_reload)),
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<LabReport>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return ListView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: const [
                  AppCard(child: AppSkeletonListTile()),
                  SizedBox(height: AppSpacing.md),
                  AppCard(child: AppSkeletonListTile()),
                ],
              );
            }
            final reports = snapshot.data ?? [];
            if (reports.isEmpty) {
              return ListView(
                children: [
                  AppEmptyState(
                    title: 'Пока нет анализов',
                    message: 'Загрузите бланк — и мы разберём его для вас на понятном языке.',
                    actionLabel: 'Загрузить анализ',
                    onAction: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const UploadSourceScreen()))
                        .then((_) => setState(_reload)),
                  ),
                ],
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: reports.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) => _ReportTile(report: reports[index], onTap: () => _open(reports[index])),
            );
          },
        ),
      ),
    );
  }
}

class _ReportTile extends StatelessWidget {
  const _ReportTile({required this.report, required this.onTap});

  final LabReport report;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final date = DateTime.tryParse(report.displayDate);
    final dateLabel = date == null ? '' : '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';

    final (String statusLabel, Color statusColor) = switch (report) {
      _ when report.isProcessing => ('Обрабатывается', colors.textSecondary),
      _ when report.needsReview => ('Нужна проверка', colors.urgencyWarm),
      _ when report.isFailed => ('Не удалось распознать', colors.urgencyCritical),
      _ => switch (report.urgency?.toUrgencyLevel()) {
          UrgencyLevel.critical => ('Обратитесь к врачу', colors.urgencyCritical),
          UrgencyLevel.warning => ('Стоит показаться врачу', colors.urgencyWarm),
          _ => ('Готово', colors.urgencyCalm),
        },
    };

    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(report.labName ?? 'Анализ', style: AppTypography.title),
                const SizedBox(height: 4),
                Text(dateLabel, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
            ),
            child: Text(statusLabel, style: AppTypography.caption.copyWith(color: statusColor, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
