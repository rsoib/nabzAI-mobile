import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/models/urgency.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/urgency_card.dart';
import '../data/complaints_repository.dart';
import '../data/models/complaint_message.dart';
import '../data/models/complaint_session.dart';
import 'cubit/complaints_cubit.dart';
import 'cubit/complaints_state.dart';
import 'emergency_screen.dart';

/// The API returns plain-text assistant turns with no structured
/// quick-reply options (see README's gap list) — these generic chips are a
/// client-side approximation of "чипы, где возможно".
const _quickReplies = ['Да', 'Нет', 'Не уверен(а)'];

/// Shown only before the first message, so a patient can tap a common
/// symptom instead of typing it. Once the dialogue starts, the assistant's
/// own clarifying questions take over and [_quickReplies] applies instead.
/// Kept short (6) so the [Wrap] fits two short rows next to the input
/// without pushing it off-screen on smaller devices.
const _symptomChips = [
  (label: 'Болит голова', icon: Icons.psychology_rounded),
  (label: 'Температура', icon: Icons.thermostat_rounded),
  (label: 'Болит живот', icon: Icons.healing_rounded),
  (label: 'Кашель', icon: Icons.coronavirus_rounded),
  (label: 'Болит горло', icon: Icons.record_voice_over_rounded),
  (label: 'Тошнит', icon: Icons.sick_rounded),
];

class ComplaintsChatScreen extends StatefulWidget {
  const ComplaintsChatScreen({super.key});

  @override
  State<ComplaintsChatScreen> createState() => _ComplaintsChatScreenState();
}

class _ComplaintsChatScreenState extends State<ComplaintsChatScreen> {
  late final ComplaintsCubit _cubit;
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final Set<String> _selectedSymptoms = {};
  bool _navigatedToEmergency = false;

  @override
  void initState() {
    super.initState();
    _cubit = ComplaintsCubit(complaintsRepository: getIt<ComplaintsRepository>());
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _send(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    _controller.clear();
    _cubit.sendMessage(trimmed);
  }

  /// Picking a symptom chip stages it as a removable tag in the composer
  /// instead of sending immediately — the patient can pick several and add
  /// free text before committing with one tap on send.
  void _toggleSymptom(String label) {
    setState(() {
      if (!_selectedSymptoms.remove(label)) {
        _selectedSymptoms.add(label);
      }
    });
  }

  void _sendComposer() {
    final symptomsText = _selectedSymptoms.join(', ');
    final freeText = _controller.text.trim();
    final combined = [symptomsText, freeText].where((part) => part.isNotEmpty).join('. ');
    if (combined.isEmpty) return;
    _selectedSymptoms.clear();
    _send(combined);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<ComplaintsCubit, ComplaintsState>(
        listener: (context, state) {
          if (state is ComplaintsActive && state.session.isEmergency && !_navigatedToEmergency) {
            _navigatedToEmergency = true;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => EmergencyScreen(summary: state.session.summary)),
            );
          } else {
            _scrollToBottom();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Что беспокоит?')),
            body: switch (state) {
              ComplaintsLoading() => const Center(child: CircularProgressIndicator()),
              ComplaintsError(:final message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Text(message, style: AppTypography.body, textAlign: TextAlign.center),
                  ),
                ),
              ComplaintsActive(:final session, :final sending) => Column(
                  children: [
                    Expanded(
                      child: ListView(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        children: [
                          if (session.messages.isEmpty) const _SymptomPickerIntro(),
                          for (final message in session.messages) _MessageBubble(message: message),
                          if (sending) const _TypingIndicator(),
                          if (session.isCompleted) ...[
                            const SizedBox(height: AppSpacing.lg),
                            UrgencyCard(
                              level: (session.urgency ?? Urgency.green).toUrgencyLevel(),
                              title: session.summary ?? 'Готово',
                              specialist: session.specialist,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (!session.isCompleted)
                      SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: AppSpacing.sm,
                                runSpacing: AppSpacing.sm,
                                children: session.messages.isEmpty
                                    ? [
                                        for (final symptom in _symptomChips)
                                          AppChip(
                                            label: symptom.label,
                                            icon: symptom.icon,
                                            selected: _selectedSymptoms.contains(symptom.label),
                                            onTap: sending ? null : () => _toggleSymptom(symptom.label),
                                          ),
                                      ]
                                    : [
                                        for (final reply in _quickReplies)
                                          AppChip(label: reply, onTap: sending ? null : () => _send(reply)),
                                      ],
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: _ComposerBox(
                                      selectedSymptoms: _selectedSymptoms,
                                      onRemoveSymptom: _toggleSymptom,
                                      controller: _controller,
                                      enabled: !sending,
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.sm),
                                  IconButton.filled(
                                    onPressed: sending ? null : _sendComposer,
                                    icon: const Icon(Icons.arrow_upward_rounded),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
            },
          );
        },
      ),
    );
  }
}

/// Fills the empty space before the first message, framing the symptom
/// chips below as the main way in — typing is still available, just not
/// the thing pushed at a first-time user.
class _SymptomPickerIntro extends StatelessWidget {
  const _SymptomPickerIntro();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Что из этого про вас?', style: AppTypography.title),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Выберите подходящий вариант одним касанием или опишите своими словами внизу.',
            style: AppTypography.body.copyWith(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

/// Text input that also hosts picked symptoms as removable tags inside the
/// same bordered box, so tapping a chip above stages it here instead of
/// sending right away — the patient can combine several symptoms with free
/// text before sending once.
class _ComposerBox extends StatelessWidget {
  const _ComposerBox({
    required this.selectedSymptoms,
    required this.onRemoveSymptom,
    required this.controller,
    required this.enabled,
  });

  final Set<String> selectedSymptoms;
  final ValueChanged<String> onRemoveSymptom;
  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      constraints: const BoxConstraints(minHeight: AppSpacing.minTapTarget + 8),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: enabled ? colors.surface : colors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedSymptoms.isNotEmpty) ...[
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final symptom in selectedSymptoms)
                  _RemovableTag(
                    label: symptom,
                    onRemove: enabled ? () => onRemoveSymptom(symptom) : null,
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          TextField(
            controller: controller,
            enabled: enabled,
            maxLines: 3,
            minLines: 1,
            style: AppTypography.bodyLarge.copyWith(color: colors.textPrimary),
            cursorColor: colors.brand,
            decoration: InputDecoration(
              isDense: true,
              hintText: selectedSymptoms.isEmpty ? 'Опишите, что беспокоит…' : 'Добавьте детали (необязательно)',
              hintStyle: AppTypography.bodyLarge.copyWith(color: colors.textSecondary),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}

/// A staged symptom inside [_ComposerBox] — tap the close icon to remove it
/// before sending.
class _RemovableTag extends StatelessWidget {
  const _RemovableTag({required this.label, required this.onRemove});

  final String label;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.brand.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
      child: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.sm, right: AppSpacing.xs, top: 6, bottom: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTypography.label.copyWith(color: colors.brand)),
            const SizedBox(width: 2),
            InkWell(
              borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
              onTap: onRemove,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.close_rounded, size: 16, color: colors.brand),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final ComplaintMessage message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isUser = message.role == ComplaintMessageRole.user;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? colors.brand : colors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: isUser ? null : Border.all(color: colors.border),
        ),
        child: Text(
          message.content,
          style: AppTypography.body.copyWith(color: isUser ? colors.textOnBrand : colors.textPrimary),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: colors.border),
        ),
        child: SizedBox(
          width: 20,
          height: 12,
          child: Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: colors.brand))),
        ),
      ),
    );
  }
}
