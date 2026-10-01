import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verify_state.freezed.dart';

@freezed
abstract class OtpVerifyState with _$OtpVerifyState {
  const factory OtpVerifyState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isResending,
    String? errorMessage,
    @Default(0) int resendCountdown,
  }) = _OtpVerifyState;
}
