import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../auth_constants.dart';
import '../../data/auth_repository.dart';
import 'otp_verify_state.dart';

class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  OtpVerifyCubit({required AuthRepository authRepository, required this.phone})
      : _authRepository = authRepository,
        super(const OtpVerifyState()) {
    _startCountdown();
  }

  final AuthRepository _authRepository;
  final String phone;
  Timer? _timer;

  void _startCountdown() {
    _timer?.cancel();
    emit(state.copyWith(resendCountdown: otpResendCooldownSeconds));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdown <= 1) {
        timer.cancel();
        emit(state.copyWith(resendCountdown: 0));
      } else {
        emit(state.copyWith(resendCountdown: state.resendCountdown - 1));
      }
    });
  }

  Future<bool> verify(String code) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      await _authRepository.verifyOtp(phone: phone, code: code);
      emit(state.copyWith(isSubmitting: false));
      return true;
    } on ApiException catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.message));
      return false;
    }
  }

  Future<void> resend() async {
    if (state.resendCountdown > 0 || state.isResending) return;
    emit(state.copyWith(isResending: true, errorMessage: null));
    try {
      await _authRepository.requestOtp(phone);
      emit(state.copyWith(isResending: false));
      _startCountdown();
    } on ApiException catch (e) {
      emit(state.copyWith(isResending: false, errorMessage: e.message));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
