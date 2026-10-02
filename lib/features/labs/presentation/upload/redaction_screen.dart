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
import 'lab_page.dart';
import 'lab_photo_picker.dart';
import 'lab_upload_cubit.dart';
import 'lab_upload_state.dart';

/// Personal data (name, birth date, address, phone) is blacked out
/// automatically on the server before OCR — the worker finds those lines
/// with local Tesseract. Here the user can additionally cover anything else
/// with boxes that move and resize from any corner.
///
/// A report can be several photos (a strip of page thumbnails lets the user
/// switch pages and add/remove them); they are uploaded together as one
/// multi-page PDF — see [writeLabPagesFile].
///
/// PDFs are uploaded without this visual step: rendering a PDF page to let
/// the user draw over it needs a PDF-rasterizing package that isn't part of
/// this build (see README's "what's missing" list) — a deliberate scope cut
/// for this pass, not an oversight.
class RedactionScreen extends StatefulWidget {
  const RedactionScreen.photos({super.key, required List<String> this.photoPaths}) : pdfFile = null;

  const RedactionScreen.pdf({super.key, required File file}) : pdfFile = file, photoPaths = null;

  final List<String>? photoPaths;
  final File? pdfFile;

  @override
  State<RedactionScreen> createState() => _RedactionScreenState();
}

class _RedactionScreenState extends State<RedactionScreen> {
  late final LabUploadCubit _cubit;
  final List<_PageDraft> _pages = [];
  int _current = 0;
  bool _addingPages = false;

  bool get _isPdf => widget.pdfFile != null;

  @override
  void initState() {
    super.initState();
    _cubit = LabUploadCubit(labsRepository: getIt<LabsRepository>());
    final paths = widget.photoPaths;
    if (paths != null) _addPages(paths);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  Future<void> _addPages(List<String> paths) async {
    setState(() => _addingPages = true);
    var failed = 0;
    for (final path in paths.take(maxLabPages - _pages.length)) {
      try {
        final page = await prepareLabPage(path);
        if (!mounted) return;
        setState(() {
          _pages.add(_PageDraft(page));
          _current = _pages.length - 1;
        });
      } catch (_) {
        failed++;
      }
    }
    if (!mounted) return;
    setState(() => _addingPages = false);
    if (failed > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failed == 1 ? 'Не удалось открыть одно фото' : 'Не удалось открыть фото: $failed')),
      );
    }
  }

  Future<void> _pickMorePages() async {
    final source = await showModalBottomSheet<_PhotoSource>(
      context: context,
      showDragHandle: true,
      builder:
          (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt_rounded),
                  title: const Text('Сфотографировать'),
                  onTap: () => Navigator.of(context).pop(_PhotoSource.camera),
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library_rounded),
                  title: const Text('Из галереи'),
                  onTap: () => Navigator.of(context).pop(_PhotoSource.gallery),
                ),
              ],
            ),
          ),
    );
    if (source == null || !mounted) return;

    final List<String> paths;
    if (source == _PhotoSource.camera) {
      final path = await captureLabPhoto(context);
      paths = [if (path != null) path];
    } else {
      paths = await pickLabPhotosFromGallery(limit: maxLabPages - _pages.length);
    }
    if (paths.isNotEmpty && mounted) await _addPages(paths);
  }

  void _removePage(int index) {
    setState(() {
      _pages.removeAt(index);
      if (_current >= _pages.length) _current = _pages.length - 1;
    });
  }

  void _addRegion() {
    setState(() {
      _pages[_current].regions.add(_MutableRegion(x: 0.1, y: 0.45, width: 0.8, height: 0.07));
    });
  }

  Future<void> _submit() async {
    final pdf = widget.pdfFile;
    if (pdf != null) {
      await _cubit.upload(file: pdf, redactionRegions: const []);
      return;
    }
    final multiPage = _pages.length > 1;
    final regions = [
      for (final (index, page) in _pages.indexed)
        for (final r in page.regions)
          RedactionRegion(x: r.x, y: r.y, width: r.width, height: r.height, page: multiPage ? index : null),
    ];
    await _cubit.uploadPages(pages: _pages.map((p) => p.page).toList(), redactionRegions: regions);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<LabUploadCubit, LabUploadState>(
        listener: (context, state) {
          if (state is LabUploadSuccess) {
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => ProcessingScreen(reportId: state.report.id)));
          } else if (state is LabUploadError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final uploading = state is LabUploadUploading;
          final canSubmit = !uploading && !_addingPages && (_isPdf || _pages.isNotEmpty);
          return Scaffold(
            appBar: AppBar(title: const Text('Скройте личные данные')),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isPdf
                          ? 'Проверьте, что PDF не содержит лишних личных данных на других страницах.'
                          : 'ФИО, дата рождения, адрес и телефон закроются автоматически. Если на фото осталось что-то личное — нажмите «Закрыть вручную».',
                      style: AppTypography.body.copyWith(color: colors.textSecondary),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Expanded(
                      child:
                          _isPdf
                              ? Center(child: Icon(Icons.picture_as_pdf_rounded, size: 96, color: colors.textSecondary))
                              : _pages.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : _PageEditor(
                                key: ObjectKey(_pages[_current]),
                                draft: _pages[_current],
                                onChanged: () => setState(() {}),
                              ),
                    ),
                    if (!_isPdf) ...[
                      const SizedBox(height: AppSpacing.md),
                      _PageStrip(
                        pages: _pages,
                        current: _current,
                        adding: _addingPages,
                        enabled: !uploading,
                        onSelect: (index) => setState(() => _current = index),
                        onRemove: _pages.length > 1 ? _removePage : null,
                        onAdd: _pages.length < maxLabPages ? _pickMorePages : null,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      AppButton(
                        label: 'Закрыть вручную',
                        variant: AppButtonVariant.secondary,
                        icon: Icons.add_rounded,
                        onPressed: _pages.isEmpty || uploading ? null : _addRegion,
                      ),
                    ],
                    const SizedBox(height: AppSpacing.sm),
                    AppButton(
                      label: _pages.length > 1 ? 'Загрузить анализ (${_pages.length} стр.)' : 'Загрузить анализ',
                      onPressed: canSubmit ? _submit : null,
                      loading: uploading,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

enum _PhotoSource { camera, gallery }

class _PageDraft {
  _PageDraft(this.page);

  final LabPage page;
  final List<_MutableRegion> regions = [];
}

/// Half the size of a box's corner touch target. The page is inset by this
/// much so corner handles on the image edge stay fully touchable.
const double _handleReach = 22;

/// The current page at its real aspect ratio, so box coordinates relative
/// to the image area are exactly relative to the image.
class _PageEditor extends StatelessWidget {
  const _PageEditor({super.key, required this.draft, required this.onChanged});

  final _PageDraft draft;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth - _handleReach * 2;
        final maxHeight = constraints.maxHeight - _handleReach * 2;
        var width = maxWidth;
        var height = width / draft.page.aspectRatio;
        if (height > maxHeight) {
          height = maxHeight;
          width = height * draft.page.aspectRatio;
        }
        final image = Size(width, height);

        return Center(
          child: SizedBox(
            width: width + _handleReach * 2,
            height: height + _handleReach * 2,
            child: Stack(
              children: [
                Positioned(
                  left: _handleReach,
                  top: _handleReach,
                  width: width,
                  height: height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    child: Image.memory(draft.page.bytes, fit: BoxFit.fill, gaplessPlayback: true),
                  ),
                ),
                for (final region in draft.regions)
                  _RedactionBox(
                    key: ObjectKey(region),
                    region: region,
                    image: image,
                    onChanged: onChanged,
                    onRemove: () {
                      draft.regions.remove(region);
                      onChanged();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Horizontal strip of page thumbnails: tap to switch page, × to remove,
/// + to add more photos.
class _PageStrip extends StatelessWidget {
  const _PageStrip({
    required this.pages,
    required this.current,
    required this.adding,
    required this.enabled,
    required this.onSelect,
    required this.onRemove,
    required this.onAdd,
  });

  final List<_PageDraft> pages;
  final int current;
  final bool adding;
  final bool enabled;
  final ValueChanged<int> onSelect;
  final ValueChanged<int>? onRemove;
  final VoidCallback? onAdd;

  static const double _thumbHeight = 76;
  static const double _thumbWidth = 58;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: _thumbHeight + 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 8, right: 8),
        clipBehavior: Clip.none,
        children: [
          for (final (index, draft) in pages.indexed)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: enabled ? () => onSelect(index) : null,
                    child: Container(
                      width: _thumbWidth,
                      height: _thumbHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                        border: Border.all(
                          color: index == current ? colors.brand : colors.border,
                          width: index == current ? 2.5 : 1,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.memory(draft.page.bytes, fit: BoxFit.cover, cacheWidth: 160, gaplessPlayback: true),
                          Positioned(
                            left: 4,
                            bottom: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                              ),
                              child: Text('${index + 1}', style: AppTypography.caption.copyWith(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (onRemove != null && enabled)
                    Positioned(
                      top: -8,
                      right: -8,
                      child: GestureDetector(
                        onTap: () => onRemove!(index),
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(color: colors.urgencyCritical, shape: BoxShape.circle),
                          child: const Icon(Icons.close_rounded, size: 14, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          if (adding)
            SizedBox(
              width: _thumbWidth,
              height: _thumbHeight,
              child: const Center(
                child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5)),
              ),
            )
          else if (onAdd != null)
            InkWell(
              onTap: enabled ? onAdd : null,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              child: Container(
                width: _thumbWidth,
                height: _thumbHeight,
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  border: Border.all(color: colors.border),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo_rounded, color: colors.brand),
                    const SizedBox(height: 2),
                    Text('Ещё', style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MutableRegion {
  _MutableRegion({required this.x, required this.y, required this.width, required this.height});

  double x, y, width, height;
}

const double _minRegionWidth = 0.06;
const double _minRegionHeight = 0.025;

/// A black box in relative (0..1) image coordinates: drag the body to move
/// it, drag any corner to resize, tap × to remove. Its widget extends
/// [_handleReach] beyond the box on every side so corner handles get a
/// full-size touch target.
class _RedactionBox extends StatelessWidget {
  const _RedactionBox({
    super.key,
    required this.region,
    required this.image,
    required this.onChanged,
    required this.onRemove,
  });

  final _MutableRegion region;
  final Size image;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  void _move(DragUpdateDetails details) {
    region.x = (region.x + details.delta.dx / image.width).clamp(0.0, 1.0 - region.width);
    region.y = (region.y + details.delta.dy / image.height).clamp(0.0, 1.0 - region.height);
    onChanged();
  }

  void _resize(DragUpdateDetails details, {required bool left, required bool top}) {
    final dx = details.delta.dx / image.width;
    final dy = details.delta.dy / image.height;
    if (left) {
      final right = region.x + region.width;
      region.x = (region.x + dx).clamp(0.0, right - _minRegionWidth);
      region.width = right - region.x;
    } else {
      region.width = (region.width + dx).clamp(_minRegionWidth, 1.0 - region.x);
    }
    if (top) {
      final bottom = region.y + region.height;
      region.y = (region.y + dy).clamp(0.0, bottom - _minRegionHeight);
      region.height = bottom - region.y;
    } else {
      region.height = (region.height + dy).clamp(_minRegionHeight, 1.0 - region.y);
    }
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget corner({required bool left, required bool top}) {
      return Positioned(
        left: left ? 0 : null,
        right: left ? null : 0,
        top: top ? 0 : null,
        bottom: top ? null : 0,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanUpdate: (details) => _resize(details, left: left, top: top),
          child: SizedBox(
            width: _handleReach * 2,
            height: _handleReach * 2,
            child: Center(
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: colors.brand,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Positioned(
      left: region.x * image.width,
      top: region.y * image.height,
      width: region.width * image.width + _handleReach * 2,
      height: region.height * image.height + _handleReach * 2,
      child: Stack(
        children: [
          Positioned.fill(
            left: _handleReach,
            top: _handleReach,
            right: _handleReach,
            bottom: _handleReach,
            child: GestureDetector(
              onPanUpdate: _move,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.85),
                  border: Border.all(color: colors.brand, width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
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
            ),
          ),
          corner(left: true, top: true),
          corner(left: false, top: true),
          corner(left: true, top: false),
          corner(left: false, top: false),
        ],
      ),
    );
  }
}
