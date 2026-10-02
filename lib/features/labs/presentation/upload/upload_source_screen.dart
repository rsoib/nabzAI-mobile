import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import 'lab_page.dart';
import 'lab_photo_picker.dart';
import 'redaction_screen.dart';

/// Choose how to bring in the lab report: camera (custom capture screen with
/// a framing guide), gallery (several photos at once), or a PDF file. Every
/// path leads to the redaction screen before anything is uploaded; more
/// photo pages can be added there.
class UploadSourceScreen extends StatelessWidget {
  const UploadSourceScreen({super.key});

  Future<void> _fromCamera(BuildContext context) async {
    final path = await captureLabPhoto(context);
    if (path != null && context.mounted) {
      _openRedaction(context, RedactionScreen.photos(photoPaths: [path]));
    }
  }

  Future<void> _fromGallery(BuildContext context) async {
    final paths = await pickLabPhotosFromGallery(limit: maxLabPages);
    if (paths.isNotEmpty && context.mounted) {
      _openRedaction(context, RedactionScreen.photos(photoPaths: paths));
    }
  }

  Future<void> _fromPdf(BuildContext context) async {
    final result = await FilePicker.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    final path = result?.files.single.path;
    if (path != null && context.mounted) {
      _openRedaction(context, RedactionScreen.pdf(file: File(path)));
    }
  }

  void _openRedaction(BuildContext context, RedactionScreen screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Загрузить анализ')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Как добавить бланк?', style: AppTypography.headline),
            const SizedBox(height: AppSpacing.xl),
            _SourceOption(
              icon: Icons.camera_alt_rounded,
              title: 'Сфотографировать',
              subtitle: 'Если страниц несколько — добавите их следующим шагом',
              onTap: () => _fromCamera(context),
            ),
            const SizedBox(height: AppSpacing.md),
            _SourceOption(
              icon: Icons.photo_library_rounded,
              title: 'Из галереи',
              subtitle: 'Можно выбрать сразу несколько фото — до $maxLabPages',
              onTap: () => _fromGallery(context),
            ),
            const SizedBox(height: AppSpacing.md),
            _SourceOption(
              icon: Icons.picture_as_pdf_rounded,
              title: 'PDF-файл',
              subtitle: 'Если анализ прислали в электронном виде',
              onTap: () => _fromPdf(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _SourceOption extends StatelessWidget {
  const _SourceOption({required this.icon, required this.title, required this.subtitle, required this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: colors.brandMuted, shape: BoxShape.circle),
                child: Icon(icon, color: colors.brand),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.label),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
