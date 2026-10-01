import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../data/complaints_repository.dart';
import 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit({required ComplaintsRepository complaintsRepository})
      : _repository = complaintsRepository,
        super(const ComplaintsState.loading()) {
    _start();
  }

  final ComplaintsRepository _repository;

  Future<void> _start() async {
    try {
      final session = await _repository.createSession();
      emit(ComplaintsState.active(session));
    } on ApiException catch (e) {
      emit(ComplaintsState.error(e.message));
    }
  }

  Future<void> sendMessage(String content) async {
    final current = state;
    if (current is! ComplaintsActive || current.sending) return;
    emit(ComplaintsState.active(current.session, sending: true));
    try {
      final updated = await _repository.postMessage(current.session.id, content);
      emit(ComplaintsState.active(updated));
    } on ApiException catch (e) {
      emit(ComplaintsState.active(current.session, errorMessage: e.message));
    }
  }
}
