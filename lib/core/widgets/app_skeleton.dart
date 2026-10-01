import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// A calm, pulsing placeholder block — used instead of spinners while
/// content loads. Respects "reduce motion" by freezing at a static shade.
class AppSkeleton extends StatefulWidget {
  const AppSkeleton({super.key, this.width, this.height = 16, this.borderRadius});

  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (reduceMotion) {
      _controller.value = 0.5;
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = widget.borderRadius ?? BorderRadius.circular(AppSpacing.radiusSm);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color.lerp(colors.surfaceElevated, colors.border, _controller.value),
          borderRadius: radius,
        ),
      ),
    );
  }
}

/// A ready-made skeleton for a list row (e.g. a report/analysis card while
/// its data loads): icon block + two text lines.
class AppSkeletonListTile extends StatelessWidget {
  const AppSkeletonListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppSkeleton(width: 48, height: 48, borderRadius: BorderRadius.all(Radius.circular(16))),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppSkeleton(width: double.infinity, height: 16),
              SizedBox(height: AppSpacing.sm),
              AppSkeleton(width: 120, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}
