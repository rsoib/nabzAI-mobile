import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/config/app_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../data/models/share_link.dart';
import 'share_links_list_screen.dart';

/// Large QR + text link, per the design brief. The backend's `/shared/:token`
/// endpoint returns raw JSON, not a rendered page (see README's gap list) —
/// fine for a doctor's own tooling, but a plain browser tab will show JSON.
class ShareResultScreen extends StatelessWidget {
  const ShareResultScreen({super.key, required this.result});

  final CreateShareLinkResult result;

  String get _link => '${AppConfig.instance.shareBaseUrl}/${result.token}';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: const Text('Ссылка готова')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
              child: QrImageView(data: _link, size: 220, backgroundColor: Colors.white),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(_link, style: AppTypography.body.copyWith(color: colors.textSecondary), textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              label: 'Поделиться ссылкой',
              icon: Icons.ios_share_rounded,
              onPressed: () => SharePlus.instance.share(ShareParams(text: _link)),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Мои ссылки',
              variant: AppButtonVariant.secondary,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ShareLinksListScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
