import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/app_skeleton.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/normal_range_scale.dart';
import '../../../core/widgets/urgency_card.dart';

/// Living showcase of every design-system primitive, in both themes. Not
/// part of the shipped navigation graph — a review screen only, per the
/// project brief's step 2 ("покажи мне скриншоты").
class DesignSystemScreen extends StatefulWidget {
  const DesignSystemScreen({super.key, required this.onToggleTheme, required this.isDark});

  final VoidCallback onToggleTheme;
  final bool isDark;

  @override
  State<DesignSystemScreen> createState() => _DesignSystemScreenState();
}

class _DesignSystemScreenState extends State<DesignSystemScreen> {
  bool _selectedChip = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дизайн-система nabzAI'),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            tooltip: 'Светлая/тёмная тема',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.xxl),
        children: [
          _HeroBanner(colors: colors),
          const SizedBox(height: AppSpacing.xl),
          _SectionTitle('Цвета'),
          const SizedBox(height: AppSpacing.md),
          _ColorSwatches(colors: colors),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Типографика'),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Проверка таджикской кириллицы во всех начертаниях:',
            style: AppTypography.body.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.md),
          _TypeSample('Display / w800', AppTypography.display),
          _TypeSample('Headline / w700', AppTypography.headline),
          _TypeSample('Title / w600', AppTypography.title),
          _TypeSample('Body large / w400', AppTypography.bodyLarge),
          _TypeSample('Body / w400', AppTypography.body),
          _TypeSample('Label / w600', AppTypography.label),
          _TypeSample('Caption / w500', AppTypography.caption),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Кнопки'),
          const SizedBox(height: AppSpacing.md),
          AppButton(label: 'Основное действие', onPressed: () {}),
          const SizedBox(height: AppSpacing.sm),
          AppButton(label: 'Второстепенное', variant: AppButtonVariant.secondary, onPressed: () {}),
          const SizedBox(height: AppSpacing.sm),
          AppButton(label: 'Текстовая кнопка', variant: AppButtonVariant.text, onPressed: () {}),
          const SizedBox(height: AppSpacing.sm),
          const AppButton(label: 'Недоступна', onPressed: null),
          const SizedBox(height: AppSpacing.sm),
          AppButton(label: 'Идёт загрузка', onPressed: () {}, loading: true),
          const SizedBox(height: AppSpacing.sm),
          AppButton(label: 'С иконкой', icon: Icons.upload_rounded, onPressed: () {}),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Поля ввода'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(label: 'Имя', hint: 'Как вас зовут?'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'Телефон',
            hint: '+992 90 000 00 00',
            helperText: 'Мы отправим код подтверждения по SMS',
          ),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'Рост, см',
            errorText: 'Проверьте значение — похоже на опечатку',
          ),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Чипы быстрых ответов'),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              AppChip(label: 'Да', selected: _selectedChip, onTap: () => setState(() => _selectedChip = !_selectedChip)),
              const AppChip(label: 'Нет'),
              const AppChip(label: 'Не уверен(а)'),
              const AppChip(label: 'Пропустить вопрос'),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Карточка'),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Общий анализ крови', style: AppTypography.title),
                const SizedBox(height: AppSpacing.xs),
                Text('12 сентября 2026', style: AppTypography.caption.copyWith(color: colors.textSecondary)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Карточка срочности'),
          const SizedBox(height: AppSpacing.md),
          const UrgencyCard(level: UrgencyLevel.calm, title: 'Всё в порядке'),
          const SizedBox(height: AppSpacing.sm),
          const UrgencyCard(
            level: UrgencyLevel.warning,
            title: 'Стоит показаться врачу в ближайшее время',
            specialist: 'Терапевт',
          ),
          const SizedBox(height: AppSpacing.sm),
          const UrgencyCard(
            level: UrgencyLevel.critical,
            title: 'Обратитесь к врачу срочно',
            specialist: 'Скорая помощь',
          ),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Шкала нормы — количественная'),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Гемоглобин', style: AppTypography.title),
                const SizedBox(height: AppSpacing.md),
                const NormalRangeScale.quantitative(low: 120, high: 160, value: 152, unit: 'г/л'),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Шкала нормы — качественная (без чисел от API)'),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Глюкоза', style: AppTypography.title),
                const SizedBox(height: AppSpacing.md),
                const NormalRangeScale.qualitative(flag: QualitativeFlag.high),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Скелетоны'),
          const SizedBox(height: AppSpacing.md),
          const AppCard(child: AppSkeletonListTile()),
          const SizedBox(height: AppSpacing.xl),

          _SectionTitle('Пустое состояние'),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: AppEmptyState(
              title: 'Пока нет анализов',
              message: 'Загрузите бланк — и мы разберём его для вас на понятном языке.',
              actionLabel: 'Загрузить анализ',
              onAction: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({required this.colors});
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.surfaceElevated, colors.surface],
        ),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(color: colors.brand.withValues(alpha: 0.18), blurRadius: 40, offset: const Offset(0, 16)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Пульс сегодня', style: AppTypography.caption.copyWith(color: colors.textSecondary)),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [colors.brand, colors.brandDeep],
                      ).createShader(bounds),
                      child: Text('72', style: AppTypography.statNumber.copyWith(color: Colors.white)),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('уд/мин', style: AppTypography.body.copyWith(color: colors.textSecondary)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [colors.brand, colors.brandDeep]),
              boxShadow: [
                BoxShadow(color: colors.brand.withValues(alpha: 0.45), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Icon(Icons.favorite_rounded, color: colors.textOnBrand, size: 28),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTypography.headline.copyWith(color: context.colors.textPrimary));
  }
}

class _TypeSample extends StatelessWidget {
  const _TypeSample(this.label, this.style);
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
          const SizedBox(height: AppSpacing.xs),
          Text(AppTypography.tajikGlyphCheck, style: style),
        ],
      ),
    );
  }
}

class _ColorSwatches extends StatelessWidget {
  const _ColorSwatches({required this.colors});
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    final entries = <(String, Color)>[
      ('Фон', colors.background),
      ('Поверхность', colors.surface),
      ('Поверхность (приподнятая)', colors.surfaceElevated),
      ('Бренд', colors.brand),
      ('Бренд (приглушённый)', colors.brandMuted),
      ('Срочность: спокойно', colors.urgencyCalm),
      ('Срочность: внимание', colors.urgencyWarm),
      ('Срочность: критично', colors.urgencyCritical),
    ];

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final (label, color) in entries)
          SizedBox(
            width: 132,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    border: Border.all(color: colors.border),
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(label, style: AppTypography.caption.copyWith(color: colors.textSecondary)),
              ],
            ),
          ),
      ],
    );
  }
}
