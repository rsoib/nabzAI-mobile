import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../data/models/patient_profile.dart';
import '../cubit/profile_cubit.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key, required this.profile});

  final PatientProfile profile;

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.fullName ?? '');
    _heightController = TextEditingController(text: widget.profile.heightCm?.toString() ?? '');
    _weightController = TextEditingController(text: widget.profile.weightKg?.toString() ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    await getIt<ProfileCubit>().updateProfile(
      fullName: _nameController.text.trim(),
      heightCm: double.tryParse(_heightController.text.replaceAll(',', '.')),
      weightKg: double.tryParse(_weightController.text.replaceAll(',', '.')),
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(label: 'Имя', controller: _nameController),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(child: AppTextField(label: 'Рост, см', controller: _heightController, keyboardType: const TextInputType.numberWithOptions(decimal: true))),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: AppTextField(label: 'Вес, кг', controller: _weightController, keyboardType: const TextInputType.numberWithOptions(decimal: true))),
              ],
            ),
            const Spacer(),
            AppButton(label: 'Сохранить', onPressed: _save, loading: _saving),
          ],
        ),
      ),
    );
  }
}
