import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../complaints/presentation/complaints_chat_screen.dart';
import '../../labs/presentation/upload/upload_source_screen.dart';
import '../../profile/presentation/cubit/profile_cubit.dart';
import '../../profile/presentation/cubit/profile_state.dart';

String _greetingForHour(int hour) {
  if (hour < 5) return 'Доброй ночи';
  if (hour < 12) return 'Доброе утро';
  if (hour < 18) return 'Добрый день';
  return 'Добрый вечер';
}

/// The two primary CTAs ("Загрузить анализ" / "Что беспокоит?") are wired
/// up once the labs-upload flow (task #8) and complaints chat (task #10)
/// exist; today's activity card and last-analysis card are static shells
/// until tasks #11 and #8/#9 wire in real data.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final greeting = _greetingForHour(DateTime.now().hour);

    return Scaffold(
      appBar: AppBar(title: const Text('nabzAI')),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: getIt<ProfileCubit>(),
        builder: (context, state) {
          final name = switch (state) {
            ProfileLoaded(:final profile) => profile.fullName,
            _ => null,
          };

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(name != null ? '$greeting, $name' : greeting, style: AppTypography.headline),
              const SizedBox(height: AppSpacing.xl),
              AppCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Сегодня', style: AppTypography.title),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            'Подключите шаги и пульс, чтобы видеть активность здесь',
                            style: AppTypography.caption.copyWith(color: colors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    AppButton(
                      label: 'Подключить',
                      variant: AppButtonVariant.secondary,
                      expand: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppCard(
                padding: EdgeInsets.zero,
                child: AppEmptyState(
                  title: 'Пока нет анализов',
                  message: 'Загрузите бланк — и мы разберём его для вас на понятном языке.',
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Загрузить анализ',
                icon: Icons.upload_rounded,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const UploadSourceScreen()),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppButton(
                label: 'Что беспокоит?',
                variant: AppButtonVariant.secondary,
                icon: Icons.chat_bubble_rounded,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ComplaintsChatScreen()),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
