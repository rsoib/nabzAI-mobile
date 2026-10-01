import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/complaint_session.dart';

part 'complaints_state.freezed.dart';

@freezed
sealed class ComplaintsState with _$ComplaintsState {
  const factory ComplaintsState.loading() = ComplaintsLoading;
  const factory ComplaintsState.active(ComplaintSession session, {@Default(false) bool sending, String? errorMessage}) =
      ComplaintsActive;
  const factory ComplaintsState.error(String message) = ComplaintsError;
}
