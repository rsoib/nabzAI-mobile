import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../data/models/share_link.dart';
import '../data/sharing_repository.dart';

/// Active share links with one-tap revoke, per the design brief.
class ShareLinksListScreen extends StatefulWidget {
  const ShareLinksListScreen({super.key});

  @override
  State<ShareLinksListScreen> createState() => _ShareLinksListScreenState();
}

class _ShareLinksListScreenState extends State<ShareLinksListScreen> {
  late Future<List<ShareLink>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() => _future = getIt<SharingRepository>().list();

  Future<void> _revoke(String id) async {
    await getIt<SharingRepository>().revoke(id);
    setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои ссылки')),
      body: FutureBuilder<List<ShareLink>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final links = (snapshot.data ?? []).where((l) => l.isActive).toList();
          if (links.isEmpty) {
            return const AppEmptyState(title: 'Нет активных ссылок', message: 'Созданные ссылки для врача появятся здесь.');
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: links.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final link = links[index];
              final colors = context.colors;
              final expires = DateTime.tryParse(link.expiresAt);
              return AppCard(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ссылка для врача', style: AppTypography.label),
                          if (expires != null)
                            Text(
                              'Действует до ${expires.day}.${expires.month}.${expires.year}',
                              style: AppTypography.caption.copyWith(color: colors.textSecondary),
                            ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => _revoke(link.id),
                      child: Text('Отозвать', style: AppTypography.label.copyWith(color: colors.urgencyCritical)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
