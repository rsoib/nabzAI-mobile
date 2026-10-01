import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../data/auth_repository.dart';
import 'cubit/phone_entry_cubit.dart';
import 'cubit/phone_entry_state.dart';
import 'otp_screen.dart';
import 'widgets/tajik_phone_formatter.dart';

/// One main action per screen, per the design brief: enter the phone
/// number, get a code. Large digits, big thumb-zone button.
class PhoneEntryScreen extends StatefulWidget {
  const PhoneEntryScreen({super.key});

  @override
  State<PhoneEntryScreen> createState() => _PhoneEntryScreenState();
}

class _PhoneEntryScreenState extends State<PhoneEntryScreen> {
  final _controller = TextEditingController();
  late final PhoneEntryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = PhoneEntryCubit(authRepository: getIt<AuthRepository>());
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _cubit.close();
    super.dispose();
  }

  bool get _isValid => digitsOnly(_controller.text).length == 9;

  Future<void> _submit() async {
    if (!_isValid) return;
    final phone = '+992${digitsOnly(_controller.text)}';
    final success = await _cubit.submit(phone);
    if (success && mounted) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => OtpScreen(phone: phone)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PhoneEntryCubit, PhoneEntryState>(
          bloc: _cubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Text('Ваш номер телефона', style: AppTypography.headline),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Отправим код подтверждения по SMS',
                    style: AppTypography.body.copyWith(color: colors.textSecondary),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          '+992',
                          style: AppTypography.display.copyWith(fontSize: 28, color: colors.textSecondary),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: AppTextField(
                          label: 'Номер',
                          hint: '90 000 00 00',
                          controller: _controller,
                          keyboardType: TextInputType.phone,
                          autofocus: true,
                          inputFormatters: [TajikPhoneInputFormatter()],
                          errorText: state.errorMessage,
                          style: AppTypography.display.copyWith(fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                  AppButton(
                    label: 'Получить код',
                    onPressed: _isValid ? _submit : null,
                    loading: state.isSubmitting,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
