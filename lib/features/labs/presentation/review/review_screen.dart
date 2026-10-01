import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../data/labs_repository.dart';
import '../../data/models/lab_report.dart';
import '../../data/models/lab_result.dart';
import '../../data/models/lab_result_correction.dart';
import '../processing/processing_screen.dart';

/// One editable row per recognized analyte, per the design brief. The API
/// has no per-result confidence score (see README's gap list) — every row
/// is editable, none are specially highlighted as "uncertain".
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.report});

  final LabReport report;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late final Map<String, TextEditingController> _controllers;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _controllers = {
      for (final result in widget.report.results) result.id: TextEditingController(text: result.displayValue),
    };
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _viewSource() async {
    try {
      final url = await getIt<LabsRepository>().getFileSignedUrl(widget.report.fileId);
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть фото')));
      }
    }
  }

  Future<void> _confirm() async {
    setState(() => _submitting = true);
    final corrections = widget.report.results.map((result) {
      final text = _controllers[result.id]!.text.trim();
      final numeric = double.tryParse(text.replaceAll(',', '.'));
      return LabResultCorrection(
        id: result.id,
        value: numeric,
        valueText: numeric == null ? text : null,
      );
    }).toList();

    try {
      await getIt<LabsRepository>().confirmResults(widget.report.id, corrections);
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ProcessingScreen(reportId: widget.report.id)),
      );
    } catch (_) {
      if (mounted) {
        setState(() => _submitting = false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось отправить. Попробуйте ещё раз')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Проверьте показатели'),
        actions: [
          IconButton(
            onPressed: _viewSource,
            icon: Icon(Icons.image_outlined, color: colors.textPrimary),
            tooltip: 'Исходное фото',
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: widget.report.results.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final result = widget.report.results[index];
          return Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              border: Border.all(color: colors.border),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(result.displayName(isTajik: false), style: AppTypography.label),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    label: 'Значение',
                    showLabel: false,
                    controller: _controllers[result.id],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                if (result.displayUnit.isNotEmpty) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Text(result.displayUnit, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                ],
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: AppButton(label: 'Всё верно', onPressed: _confirm, loading: _submitting),
        ),
      ),
    );
  }
}
