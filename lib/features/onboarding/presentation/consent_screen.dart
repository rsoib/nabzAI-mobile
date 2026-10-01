import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';

/// Plain-language data-processing consent. A single checkbox gates the one
/// action on this screen, per the design brief.
class ConsentScreen extends StatefulWidget {
  const ConsentScreen({super.key, required this.onAccepted});

  final VoidCallback onAccepted;

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool _checked = false;

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
              Text('Обработка данных', style: AppTypography.headline),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'Чтобы объяснять анализы и подсказывать срочность, nabzAI обрабатывает ваши медицинские '
                    'данные — фотографии анализов, ответы о самочувствии и показатели активности.\n\n'
                    'Мы не ставим диагноз и не заменяем врача — это подсказки для вас, а решение всегда принимает '
                    'специалист. Данные хранятся защищённо и используются только для работы приложения. Вы можете '
                    'удалить их в любой момент в настройках.',
                    style: AppTypography.body.copyWith(color: colors.textSecondary),
                  ),
                ),
              ),
              InkWell(
                onTap: () => setState(() => _checked = !_checked),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _checked,
                        onChanged: (value) => setState(() => _checked = value ?? false),
                        activeColor: colors.brand,
                      ),
                      Expanded(
                        child: Text(
                          'Я согласен(на) на обработку моих данных на условиях выше',
                          style: AppTypography.body,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(label: 'Продолжить', onPressed: _checked ? widget.onAccepted : null),
            ],
          ),
        ),
      ),
    );
  }
}
