import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../data/models/patient_profile.dart';
import '../cubit/profile_cubit.dart';
import 'medcard_step_screen.dart';

enum _Step { name, sex, birthDate, measurements, language }

/// One question per screen, progress bar on top, per the design brief.
/// Collects everything locally and submits a single `PUT /me/profile` at
/// the end, then hands off to the optional (skippable) medcard step.
class ProfileWizardScreen extends StatefulWidget {
  const ProfileWizardScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<ProfileWizardScreen> createState() => _ProfileWizardScreenState();
}

class _ProfileWizardScreenState extends State<ProfileWizardScreen> {
  int _stepIndex = 0;
  bool _submitting = false;
  bool _showMedcardStep = false;

  final _nameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  Sex? _sex;
  DateTime? _birthDate;
  AppLanguage _language = AppLanguage.tg;

  static const _steps = _Step.values;

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool get _canGoNext => switch (_steps[_stepIndex]) {
        _Step.name => _nameController.text.trim().isNotEmpty,
        _Step.sex => _sex != null,
        _Step.birthDate => _birthDate != null,
        _Step.measurements => true,
        _Step.language => true,
      };

  Future<void> _next() async {
    if (!_canGoNext) return;
    if (_stepIndex < _steps.length - 1) {
      setState(() => _stepIndex++);
      return;
    }
    await _submit();
  }

  void _back() {
    if (_stepIndex > 0) {
      setState(() => _stepIndex--);
    }
  }

  Future<void> _submit() async {
    setState(() => _submitting = true);
    final height = double.tryParse(_heightController.text.replaceAll(',', '.'));
    final weight = double.tryParse(_weightController.text.replaceAll(',', '.'));
    await getIt<ProfileCubit>().updateProfile(
      fullName: _nameController.text.trim(),
      sex: _sex,
      birthDate:
          '${_birthDate!.year.toString().padLeft(4, '0')}-${_birthDate!.month.toString().padLeft(2, '0')}-${_birthDate!.day.toString().padLeft(2, '0')}',
      language: _language,
      heightCm: height,
      weightKg: weight,
    );
    if (!mounted) return;
    setState(() {
      _submitting = false;
      _showMedcardStep = true;
    });
  }

  Future<void> _pickBirthDate() async {
    final colors = context.colors;
    DateTime tempDate = _birthDate ?? DateTime(2000, 1, 1);
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: colors.surface,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: 320,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() => _birthDate = tempDate);
                      Navigator.of(context).pop();
                    },
                    child: Text('Готово', style: AppTypography.label.copyWith(color: colors.brand)),
                  ),
                ),
                Expanded(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      brightness: Brightness.dark,
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: AppTypography.body.copyWith(color: colors.textPrimary),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: tempDate,
                      maximumDate: DateTime.now(),
                      minimumDate: DateTime(1900),
                      onDateTimeChanged: (value) => tempDate = value,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showMedcardStep) {
      return MedcardStepScreen(onFinished: widget.onFinished);
    }

    final colors = context.colors;
    final progress = (_stepIndex + 1) / _steps.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (_stepIndex > 0)
                    IconButton(
                      onPressed: _back,
                      icon: Icon(Icons.arrow_back_rounded, color: colors.textPrimary),
                    ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: progress),
                        duration: AppMotion.normal,
                        builder: (context, value, _) => LinearProgressIndicator(
                          value: value,
                          minHeight: 6,
                          backgroundColor: colors.surfaceElevated,
                          valueColor: AlwaysStoppedAnimation(colors.brand),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Expanded(
                child: AnimatedSwitcher(
                  duration: AppMotion.fast,
                  child: KeyedSubtree(
                    key: ValueKey(_stepIndex),
                    child: _buildStep(context),
                  ),
                ),
              ),
              AppButton(
                label: _stepIndex == _steps.length - 1 ? 'Готово' : 'Далее',
                onPressed: _canGoNext ? _next : null,
                loading: _submitting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context) {
    final colors = context.colors;
    switch (_steps[_stepIndex]) {
      case _Step.name:
        return _QuestionLayout(
          title: 'Как вас зовут?',
          child: AppTextField(
            label: 'Имя',
            hint: 'Например, Фарход',
            controller: _nameController,
            autofocus: true,
            onChanged: (_) => setState(() {}),
          ),
        );
      case _Step.sex:
        return _QuestionLayout(
          title: 'Ваш пол',
          child: Row(
            children: [
              Expanded(
                child: _SelectableCard(
                  label: 'Мужской',
                  selected: _sex == Sex.male,
                  onTap: () => setState(() => _sex = Sex.male),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _SelectableCard(
                  label: 'Женский',
                  selected: _sex == Sex.female,
                  onTap: () => setState(() => _sex = Sex.female),
                ),
              ),
            ],
          ),
        );
      case _Step.birthDate:
        return _QuestionLayout(
          title: 'Дата рождения',
          child: GestureDetector(
            onTap: _pickBirthDate,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: Border.all(color: colors.border),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_rounded, color: colors.brand),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    _birthDate == null
                        ? 'Выбрать дату'
                        : '${_birthDate!.day.toString().padLeft(2, '0')}.${_birthDate!.month.toString().padLeft(2, '0')}.${_birthDate!.year}',
                    style: AppTypography.bodyLarge.copyWith(color: colors.textPrimary),
                  ),
                ],
              ),
            ),
          ),
        );
      case _Step.measurements:
        return _QuestionLayout(
          title: 'Рост и вес',
          subtitle: 'Необязательно — можно пропустить',
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Рост, см',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: _heightController,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextField(
                  label: 'Вес, кг',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: _weightController,
                ),
              ),
            ],
          ),
        );
      case _Step.language:
        return _QuestionLayout(
          title: 'Язык приложения',
          child: Row(
            children: [
              Expanded(
                child: _SelectableCard(
                  label: 'Тоҷикӣ',
                  selected: _language == AppLanguage.tg,
                  onTap: () => setState(() => _language = AppLanguage.tg),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _SelectableCard(
                  label: 'Русский',
                  selected: _language == AppLanguage.ru,
                  onTap: () => setState(() => _language = AppLanguage.ru),
                ),
              ),
            ],
          ),
        );
    }
  }
}

class _QuestionLayout extends StatelessWidget {
  const _QuestionLayout({required this.title, required this.child, this.subtitle});

  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.headline),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(subtitle!, style: AppTypography.body.copyWith(color: colors.textSecondary)),
        ],
        const SizedBox(height: AppSpacing.xl),
        child,
      ],
    );
  }
}

class _SelectableCard extends StatelessWidget {
  const _SelectableCard({required this.label, required this.selected, required this.onTap});

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
          height: AppSpacing.minTapTarget + 16,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(color: selected ? colors.brand : colors.border, width: selected ? 2 : 1),
          ),
          child: Text(
            label,
            style: AppTypography.label.copyWith(color: selected ? colors.brand : colors.textPrimary),
          ),
        ),
      ),
    );
  }
}
