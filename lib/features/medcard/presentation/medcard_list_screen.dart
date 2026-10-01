import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/empty_state.dart';
import '../data/medcard_repository.dart';
import '../data/models/medical_record.dart';

const _typeLabels = {
  MedicalRecordType.condition: 'Хроническое заболевание',
  MedicalRecordType.medication: 'Лекарство',
  MedicalRecordType.allergy: 'Аллергия',
  MedicalRecordType.surgery: 'Операция',
  MedicalRecordType.vaccination: 'Прививка',
};

/// Simple CRUD (create/read/delete — editing in place isn't essential for
/// free-text entries like these) over `/me/medical-records`.
class MedcardListScreen extends StatefulWidget {
  const MedcardListScreen({super.key});

  @override
  State<MedcardListScreen> createState() => _MedcardListScreenState();
}

class _MedcardListScreenState extends State<MedcardListScreen> {
  late Future<List<MedicalRecord>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() => _future = getIt<MedcardRepository>().list();

  Future<void> _addRecord() async {
    final result = await showModalBottomSheet<(MedicalRecordType, String)>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const _AddRecordSheet(),
    );
    if (result == null) return;
    await getIt<MedcardRepository>().create(type: result.$1, name: result.$2);
    setState(_reload);
  }

  Future<void> _delete(String id) async {
    await getIt<MedcardRepository>().delete(id);
    setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Медкарта'),
        actions: [IconButton(onPressed: _addRecord, icon: const Icon(Icons.add_rounded))],
      ),
      body: FutureBuilder<List<MedicalRecord>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final records = snapshot.data ?? [];
          if (records.isEmpty) {
            return AppEmptyState(
              title: 'Медкарта пуста',
              message: 'Добавьте хронические заболевания, лекарства и аллергии — это поможет точнее объяснять анализы.',
              actionLabel: 'Добавить',
              onAction: _addRecord,
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: records.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final record = records[index];
              final colors = context.colors;
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(record.name, style: AppTypography.label),
                          Text(_typeLabels[record.type]!, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _delete(record.id),
                      icon: Icon(Icons.delete_outline_rounded, color: colors.textSecondary),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _AddRecordSheet extends StatefulWidget {
  const _AddRecordSheet();

  @override
  State<_AddRecordSheet> createState() => _AddRecordSheetState();
}

class _AddRecordSheetState extends State<_AddRecordSheet> {
  MedicalRecordType _type = MedicalRecordType.condition;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Добавить запись', style: AppTypography.title),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              for (final entry in _typeLabels.entries)
                ChoiceChip(
                  label: Text(entry.value),
                  selected: _type == entry.key,
                  onSelected: (_) => setState(() => _type = entry.key),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(label: 'Название', controller: _controller, autofocus: true),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Добавить',
            onPressed: () {
              final text = _controller.text.trim();
              if (text.isEmpty) return;
              Navigator.of(context).pop((_type, text));
            },
          ),
        ],
      ),
    );
  }
}
