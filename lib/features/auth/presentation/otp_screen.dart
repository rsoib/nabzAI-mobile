import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../auth_constants.dart';
import '../data/auth_repository.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/otp_verify_cubit.dart';
import 'cubit/otp_verify_state.dart';

/// 6-cell OTP entry with auto-advance between cells and a resend timer.
/// Submits automatically once all cells are filled.
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phone});

  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final OtpVerifyCubit _cubit;
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _cubit = OtpVerifyCubit(authRepository: getIt<AuthRepository>(), phone: widget.phone);
    _controllers = List.generate(otpCodeLength, (_) => TextEditingController());
    _focusNodes = List.generate(otpCodeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _cubit.close();
    super.dispose();
  }

  String get _code => _controllers.map((c) => c.text).join();

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < otpCodeLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    if (_code.length == otpCodeLength) {
      _submit();
    }
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final success = await _cubit.verify(_code);
    if (success) {
      getIt<AuthCubit>().notifyAuthenticated();
    } else {
      for (final controller in _controllers) {
        controller.clear();
      }
      _focusNodes.first.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<OtpVerifyCubit, OtpVerifyState>(
          bloc: _cubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Введите код из SMS', style: AppTypography.headline),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Отправили на ${widget.phone}',
                    style: AppTypography.body.copyWith(color: colors.textSecondary),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < otpCodeLength; i++)
                        _OtpCell(
                          controller: _controllers[i],
                          focusNode: _focusNodes[i],
                          onChanged: (value) => _onChanged(i, value),
                          hasError: state.errorMessage != null,
                        ),
                    ],
                  ),
                  if (state.errorMessage != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      state.errorMessage!,
                      style: AppTypography.caption.copyWith(color: colors.urgencyCritical),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.xl),
                  Center(
                    child: state.resendCountdown > 0
                        ? Text(
                            'Отправить код ещё раз через ${state.resendCountdown} с',
                            style: AppTypography.caption.copyWith(color: colors.textSecondary),
                          )
                        : AppButton(
                            label: 'Отправить код ещё раз',
                            variant: AppButtonVariant.text,
                            expand: false,
                            loading: state.isResending,
                            onPressed: _cubit.resend,
                          ),
                  ),
                  if (state.isSubmitting) ...[
                    const SizedBox(height: AppSpacing.xl),
                    Center(child: CircularProgressIndicator(color: colors.brand)),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OtpCell extends StatelessWidget {
  const _OtpCell({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.hasError,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: 48,
      height: 56,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppTypography.headline.copyWith(color: colors.textPrimary),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: colors.surface,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide(color: hasError ? colors.urgencyCritical : colors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide(color: hasError ? colors.urgencyCritical : colors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide(color: colors.brand, width: 2),
          ),
        ),
      ),
    );
  }
}
