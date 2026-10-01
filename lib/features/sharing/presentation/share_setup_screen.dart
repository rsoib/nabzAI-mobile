import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../data/models/share_scope.dart';
import '../data/sharing_repository.dart';
import 'share_result_screen.dart';

/// Choose what to share and for how long. `expiresInHours` is the link's
/// own lifetime — the backend has no separate "how much history to show"
/// window (see README's gap list), so "1 день / 7 дней" here maps directly
/// to how long the link stays valid, not a data cutoff.
class ShareSetupScreen extends StatefulWidget {
  const ShareSetupScreen({super.key});

  @override
  State<ShareSetupScreen> createState() => _ShareSetupScreenState();
}

class _ShareSetupScreenState extends State<ShareSetupScreen> {
  bool _profile = true;
  bool _labs = true;
  bool _complaints = false;
  bool _activity = false;
  int _expiresInHours = 24;
  bool _creating = false;

  Future<void> _create() async {
    setState(() => _creating = true);
    try {
      final result = await getIt<SharingRepository>().create(
        scope: ShareScope(profile: _profile, labs: _labs, complaints: _complaints, activity: _activity),
        expiresInHours: _expiresInHours,
      );
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ShareResultScreen(result: result)),
      );
    } catch (_) {
      if (mounted) {
        setState(() => _creating = false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось создать ссылку')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Поделиться с врачом')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Что показать', style: AppTypography.headline),
            const SizedBox(height: AppSpacing.md),
            _ScopeTile(label: 'Анализы', value: _labs, onChanged: (v) => setState(() => _labs = v)),
            _ScopeTile(label: 'Профиль', value: _profile, onChanged: (v) => setState(() => _profile = v)),
            _ScopeTile(label: 'Жалобы', value: _complaints, onChanged: (v) => setState(() => _complaints = v)),
            _ScopeTile(label: 'Активность', value: _activity, onChanged: (v) => setState(() => _activity = v)),
            const SizedBox(height: AppSpacing.xl),
            Text('На сколько', style: AppTypography.headline),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _DurationOption(label: '1 день', selected: _expiresInHours == 24, onTap: () => setState(() => _expiresInHours = 24)),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _DurationOption(label: '7 дней', selected: _expiresInHours == 168, onTap: () => setState(() => _expiresInHours = 168)),
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              label: 'Создать ссылку',
              onPressed: (_profile || _labs || _complaints || _activity) ? _create : null,
              loading: _creating,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScopeTile extends StatelessWidget {
  const _ScopeTile({required this.label, required this.value, required this.onChanged});

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        child: Row(
          children: [
            Checkbox(value: value, onChanged: (v) => onChanged(v ?? false), activeColor: colors.brand),
            Text(label, style: AppTypography.body),
          ],
        ),
      ),
    );
  }
}

class _DurationOption extends StatelessWidget {
  const _DurationOption({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: selected ? colors.brandMuted : colors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        onTap: onTap,
        child: Container(
          height: AppSpacing.minTapTarget,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(color: selected ? colors.brand : colors.border, width: selected ? 2 : 1),
          ),
          child: Text(label, style: AppTypography.label.copyWith(color: selected ? colors.brand : colors.textPrimary)),
        ),
      ),
    );
  }
}
