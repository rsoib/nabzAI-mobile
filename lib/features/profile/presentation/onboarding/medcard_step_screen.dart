import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_chip.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../medcard/data/medcard_repository.dart';
import '../../../medcard/data/models/medical_record.dart';

/// Optional, skippable step at the end of the profile wizard: chronic
/// conditions, medications, allergies. Each section is just a text field +
/// add button building a chip list — full medcard CRUD lives in Settings
/// (task #13); this is a fast first pass, not a replacement for it.
class MedcardStepScreen extends StatefulWidget {
  const MedcardStepScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<MedcardStepScreen> createState() => _MedcardStepScreenState();
}

class _MedcardStepScreenState extends State<MedcardStepScreen> {
  final _conditions = <String>[];
  final _medications = <String>[];
  final _allergies = <String>[];
  bool _saving = false;

  Future<void> _finish() async {
    setState(() => _saving = true);
    final repo = getIt<MedcardRepository>();
    final entries = <(MedicalRecordType, String)>[
      for (final c in _conditions) (MedicalRecordType.condition, c),
      for (final m in _medications) (MedicalRecordType.medication, m),
      for (final a in _allergies) (MedicalRecordType.allergy, a),
    ];
    for (final (type, name) in entries) {
      await repo.create(type: type, name: name);
    }
    widget.onFinished();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Немного о вашем здоровье', style: AppTypography.headline),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Поможет точнее объяснять анализы. Можно пропустить и заполнить позже.',
                style: AppTypography.body.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xl),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MedcardSection(title: 'Хронические заболевания', items: _conditions),
                      const SizedBox(height: AppSpacing.lg),
                      _MedcardSection(title: 'Лекарства', items: _medications),
                      const SizedBox(height: AppSpacing.lg),
                      _MedcardSection(title: 'Аллергии', items: _allergies),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(label: 'Готово', onPressed: _finish, loading: _saving),
              const SizedBox(height: AppSpacing.sm),
              AppButton(
                label: 'Пропустить',
                variant: AppButtonVariant.text,
                onPressed: _saving ? null : widget.onFinished,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedcardSection extends StatefulWidget {
  const _MedcardSection({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  State<_MedcardSection> createState() => _MedcardSectionState();
}

class _MedcardSectionState extends State<_MedcardSection> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _add() {
    final value = _controller.text.trim();
    if (value.isEmpty) return;
    setState(() {
      widget.items.add(value);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTypography.label),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                label: 'Название',
                hint: 'Добавить...',
                controller: _controller,
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            IconButton.filled(onPressed: _add, icon: const Icon(Icons.add_rounded)),
          ],
        ),
        if (widget.items.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final item in widget.items)
                AppChip(
                  label: item,
                  selected: true,
                  onTap: () => setState(() => widget.items.remove(item)),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
