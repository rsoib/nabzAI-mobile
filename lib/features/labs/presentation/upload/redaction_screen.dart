import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/labs_repository.dart';
import '../../data/models/redaction_region.dart';
import '../processing/processing_screen.dart';
import 'lab_upload_cubit.dart';
import 'lab_upload_state.dart';

/// Before anything is sent for OCR, the user blacks out personal data
/// (name, birth date, etc). A default box covers the top of the form —
/// where that information usually sits — and the user can move/resize it
/// or add more boxes.
///
/// PDFs are uploaded without this visual step: rendering a PDF page to let
/// the user draw over it needs a PDF-rasterizing package that isn't part of
/// this build (see README's "what's missing" list) — a deliberate scope cut
/// for this pass, not an oversight.
class RedactionScreen extends StatefulWidget {
  const RedactionScreen({super.key, required this.file, this.isPdf = false});

  final File file;
  final bool isPdf;

  @override
  State<RedactionScreen> createState() => _RedactionScreenState();
}

class _RedactionScreenState extends State<RedactionScreen> {
  late final LabUploadCubit _cubit;
  final List<_MutableRegion> _regions = [_MutableRegion(x: 0.08, y: 0.04, width: 0.84, height: 0.22)];

  @override
  void initState() {
    super.initState();
    _cubit = LabUploadCubit(labsRepository: getIt<LabsRepository>());
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _addRegion() {
    setState(() {
      _regions.add(_MutableRegion(x: 0.15, y: 0.4, width: 0.7, height: 0.15));
    });
  }

  Future<void> _submit() async {
    final regions = widget.isPdf
        ? const <RedactionRegion>[]
        : _regions
            .map((r) => RedactionRegion(x: r.x, y: r.y, width: r.width, height: r.height))
            .toList();
    await _cubit.upload(file: widget.file, redactionRegions: regions);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<LabUploadCubit, LabUploadState>(
        listener: (context, state) {
          if (state is LabUploadSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => ProcessingScreen(reportId: state.report.id)),
            );
          } else if (state is LabUploadError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final uploading = state is LabUploadUploading;
          return Scaffold(
            appBar: AppBar(title: const Text('Скройте личные данные')),
            body: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isPdf
                        ? 'Проверьте, что PDF не содержит лишних личных данных на других страницах.'
                        : 'Закрасьте прямоугольником ФИО, дату рождения и другие личные данные — так безопаснее. Прямоугольник можно подвинуть и изменить размер.',
                    style: AppTypography.body.copyWith(color: colors.textSecondary),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  if (!widget.isPdf)
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                                  child: Image.file(widget.file, fit: BoxFit.contain, width: double.infinity),
                                ),
                              ),
                              for (final region in _regions)
                                _RedactionBox(
                                  region: region,
                                  bounds: constraints.biggest,
                                  onChanged: () => setState(() {}),
                                  onRemove: _regions.length > 1 ? () => setState(() => _regions.remove(region)) : null,
                                ),
                            ],
                          );
                        },
                      ),
                    )
                  else
                    Expanded(
                      child: Center(
                        child: Icon(Icons.picture_as_pdf_rounded, size: 96, color: colors.textSecondary),
                      ),
                    ),
                  const SizedBox(height: AppSpacing.md),
                  if (!widget.isPdf)
                    AppButton(
                      label: 'Добавить область',
                      variant: AppButtonVariant.secondary,
                      icon: Icons.add_rounded,
                      onPressed: _addRegion,
                    ),
                  const SizedBox(height: AppSpacing.sm),
                  AppButton(
                    label: 'Загрузить анализ',
                    onPressed: uploading ? null : _submit,
                    loading: uploading,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MutableRegion {
  _MutableRegion({required this.x, required this.y, required this.width, required this.height});
  double x, y, width, height;
}

/// A movable, resizable rectangle drawn in relative (0..1) coordinates over
/// whatever [bounds] the image currently occupies.
class _RedactionBox extends StatelessWidget {
  const _RedactionBox({required this.region, required this.bounds, required this.onChanged, this.onRemove});

  final _MutableRegion region;
  final Size bounds;
  final VoidCallback onChanged;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final left = region.x * bounds.width;
    final top = region.y * bounds.height;
    final width = region.width * bounds.width;
    final height = region.height * bounds.height;

    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: GestureDetector(
        onPanUpdate: (details) {
          region.x = ((left + details.delta.dx) / bounds.width).clamp(0.0, 1.0 - region.width);
          region.y = ((top + details.delta.dy) / bounds.height).clamp(0.0, 1.0 - region.height);
          onChanged();
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.85),
                border: Border.all(color: colors.brand, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            if (onRemove != null)
              Positioned(
                top: -12,
                right: -12,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(color: colors.urgencyCritical, shape: BoxShape.circle),
                    child: const Icon(Icons.close_rounded, size: 16, color: Colors.white),
                  ),
                ),
              ),
            Positioned(
              right: -10,
              bottom: -10,
              child: GestureDetector(
                onPanUpdate: (details) {
                  region.width = ((width + details.delta.dx) / bounds.width).clamp(0.08, 1.0 - region.x);
                  region.height = ((height + details.delta.dy) / bounds.height).clamp(0.05, 1.0 - region.y);
                  onChanged();
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: colors.brand,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
