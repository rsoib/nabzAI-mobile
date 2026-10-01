import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../medcard/presentation/medcard_list_screen.dart';
import '../../../sharing/presentation/share_setup_screen.dart';
import '../../data/models/patient_profile.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import 'profile_edit_screen.dart';

/// Profile summary, medcard entry point, language/theme/notifications,
/// share-with-doctor entry point, logout — everything from the design
/// brief's "Профиль и настройки" screen in one place.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final themeController = getIt<ThemeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: getIt<ProfileCubit>(),
        builder: (context, state) {
          final profile = state is ProfileLoaded ? state.profile : null;
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              AppCard(
                onTap: profile == null
                    ? null
                    : () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ProfileEditScreen(profile: profile)),
                        ),
                child: Row(
                  children: [
                    CircleAvatar(radius: 28, backgroundColor: colors.brandMuted, child: Icon(Icons.person_rounded, color: colors.brand)),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(profile?.fullName ?? '—', style: AppTypography.title),
                          Text('Изменить профиль', style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: colors.textSecondary),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _SettingsTile(
                icon: Icons.folder_shared_rounded,
                label: 'Медкарта',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MedcardListScreen())),
              ),
              const SizedBox(height: AppSpacing.sm),
              _SettingsTile(
                icon: Icons.ios_share_rounded,
                label: 'Поделиться с врачом',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ShareSetupScreen())),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text('Язык', style: AppTypography.label.copyWith(color: colors.textSecondary)),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: _ChoiceButton(
                      label: 'Тоҷикӣ',
                      selected: profile?.language == AppLanguage.tg,
                      onTap: () => getIt<ProfileCubit>().updateProfile(language: AppLanguage.tg),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: _ChoiceButton(
                      label: 'Русский',
                      selected: profile?.language == AppLanguage.ru,
                      onTap: () => getIt<ProfileCubit>().updateProfile(language: AppLanguage.ru),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Text('Тема', style: AppTypography.label.copyWith(color: colors.textSecondary)),
              const SizedBox(height: AppSpacing.sm),
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeController,
                builder: (context, mode, _) => Row(
                  children: [
                    Expanded(child: _ChoiceButton(label: 'Светлая', selected: mode == ThemeMode.light, onTap: () => themeController.set(ThemeMode.light))),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(child: _ChoiceButton(label: 'Тёмная', selected: mode == ThemeMode.dark, onTap: () => themeController.set(ThemeMode.dark))),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(child: _ChoiceButton(label: 'Системная', selected: mode == ThemeMode.system, onTap: () => themeController.set(ThemeMode.system))),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Уведомления', style: AppTypography.body),
                value: _notificationsEnabled,
                activeColor: colors.brand,
                onChanged: (value) => setState(() => _notificationsEnabled = value),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Выйти',
                variant: AppButtonVariant.secondary,
                onPressed: () => getIt<AuthCubit>().logout(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: colors.brand),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(label, style: AppTypography.body)),
          Icon(Icons.chevron_right_rounded, color: colors.textSecondary),
        ],
      ),
    );
  }
}

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({required this.label, required this.selected, required this.onTap});

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
          child: Text(label, style: AppTypography.caption.copyWith(color: selected ? colors.brand : colors.textPrimary, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
