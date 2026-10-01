import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../data/auth_repository.dart';
import 'phone_entry_state.dart';

class PhoneEntryCubit extends Cubit<PhoneEntryState> {
  PhoneEntryCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const PhoneEntryState());

  final AuthRepository _authRepository;

  Future<bool> submit(String phoneE164) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      await _authRepository.requestOtp(phoneE164);
      emit(state.copyWith(isSubmitting: false));
      return true;
    } on ApiException catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.message));
      return false;
    }
  }
}
