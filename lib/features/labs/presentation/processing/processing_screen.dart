import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/labs_repository.dart';
import '../../data/models/lab_report.dart';
import '../result/result_screen.dart';
import '../review/review_screen.dart';

const _statusMessages = [
  'Читаем бланк…',
  'Распознаём показатели…',
  'Сверяем с нормами…',
];

/// Polls `GET /me/labs/reports/:id` as the fallback path (push notifications
/// are the primary one, once wired up — task #14/README gap list). The user
/// can back out at any time; status is picked back up from the home screen's
/// last-analysis card once that's wired to real data (task #8 follow-up).
class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key, required this.reportId});

  final String reportId;

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> with SingleTickerProviderStateMixin {
  Timer? _pollTimer;
  Timer? _messageTimer;
  int _messageIndex = 0;
  String? _error;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))
      ..repeat(reverse: true);
    _messageTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() => _messageIndex = (_messageIndex + 1) % _statusMessages.length);
    });
    _poll();
    _pollTimer = Timer.periodic(const Duration(seconds: 4), (_) => _poll());
  }

  Future<void> _poll() async {
    try {
      final report = await getIt<LabsRepository>().getById(widget.reportId);
      if (!mounted) return;
      _handleReport(report);
    } catch (_) {
      // Transient network hiccup — the next tick will retry.
    }
  }

  void _handleReport(LabReport report) {
    if (report.needsReview) {
      _stopTimers();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ReviewScreen(report: report)),
      );
    } else if (report.isReady) {
      _stopTimers();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ResultScreen(report: report)),
      );
    } else if (report.isFailed) {
      _stopTimers();
      setState(() => _error = report.errorMessage ?? 'Не получилось распознать бланк. Попробуйте другое фото.');
    }
  }

  void _stopTimers() {
    _pollTimer?.cancel();
    _messageTimer?.cancel();
  }

  @override
  void dispose() {
    _stopTimers();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_error == null) ...[
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, _) {
                    final scale = 1 + _pulseController.value * 0.12;
                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [colors.brand, colors.brandDeep]),
                          boxShadow: [
                            BoxShadow(
                              color: colors.brand.withValues(alpha: 0.4 * _pulseController.value + 0.15),
                              blurRadius: 40,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(Icons.science_rounded, color: colors.textOnBrand, size: 48),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  _statusMessages[_messageIndex],
                  style: AppTypography.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Обычно это занимает меньше минуты',
                  style: AppTypography.body.copyWith(color: colors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                Icon(Icons.error_outline_rounded, color: colors.urgencyCritical, size: 56),
                const SizedBox(height: AppSpacing.lg),
                Text(_error!, style: AppTypography.title, textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.xl),
                AppButton(label: 'Назад', onPressed: () => Navigator.of(context).pop()),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
