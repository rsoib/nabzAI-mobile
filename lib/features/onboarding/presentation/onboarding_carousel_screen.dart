import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import 'widgets/onboarding_illustration.dart';

class _Page {
  const _Page({required this.icon, required this.title, required this.description, required this.accentFrom});
  final IconData icon;
  final String title;
  final String description;

  /// Picks the accent color from the current theme; a plain function avoids
  /// needing BuildContext in the const page list.
  final Color Function(AppColors colors) accentFrom;
}

final List<_Page> _pages = [
  _Page(
    icon: Icons.document_scanner_rounded,
    title: 'Сфотографируйте анализ',
    description: 'nabzAI объяснит результаты простыми словами — без сложных медицинских терминов.',
    accentFrom: (colors) => colors.brand,
  ),
  _Page(
    icon: Icons.chat_bubble_rounded,
    title: 'Расскажите, что беспокоит',
    description: 'Ответьте на несколько вопросов — узнаете, насколько это срочно и к какому врачу обратиться.',
    accentFrom: (colors) => colors.urgencyCalm,
  ),
  _Page(
    icon: Icons.shield_rounded,
    title: 'Это не диагноз',
    description: 'nabzAI помогает разобраться и не паниковать. Решение всегда принимает врач.',
    accentFrom: (colors) => colors.urgencyWarm,
  ),
];

/// 3-page introduction, per the design brief: what the app does, how it
/// works, and the "not a diagnosis" disclaimer.
class OnboardingCarouselScreen extends StatefulWidget {
  const OnboardingCarouselScreen({super.key, required this.onDone});

  final VoidCallback onDone;

  @override
  State<OnboardingCarouselScreen> createState() => _OnboardingCarouselScreenState();
}

class _OnboardingCarouselScreenState extends State<OnboardingCarouselScreen> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_page < _pages.length - 1) {
      _controller.nextPage(duration: AppMotion.normal, curve: AppMotion.curve);
    } else {
      widget.onDone();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isLast = _page == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: TextButton(
                  onPressed: widget.onDone,
                  child: Text('Пропустить', style: AppTypography.label.copyWith(color: colors.textSecondary)),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboardingIllustration(icon: page.icon, accent: page.accentFrom(colors)),
                        const SizedBox(height: AppSpacing.xl),
                        Text(page.title, style: AppTypography.headline, textAlign: TextAlign.center),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          page.description,
                          style: AppTypography.body.copyWith(color: colors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _pages.length; i++)
                  AnimatedContainer(
                    duration: AppMotion.fast,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _page ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _page ? colors.brand : colors.border,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: AppButton(label: isLast ? 'Начать' : 'Далее', onPressed: _next),
            ),
          ],
        ),
      ),
    );
  }
}
