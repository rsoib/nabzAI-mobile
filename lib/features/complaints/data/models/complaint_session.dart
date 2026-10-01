import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/urgency.dart';
import 'complaint_message.dart';

part 'complaint_session.freezed.dart';
part 'complaint_session.g.dart';

enum ComplaintSessionStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
}

/// Raw shape returned by all `/me/complaints/sessions...` endpoints. There
/// is no explicit "emergency" boolean on the backend — a red flag is
/// signalled by `urgency == red` (see `RedFlagService` in the backend),
/// which the UI must check after every message to decide whether to show
/// the full-screen emergency takeover.
@freezed
abstract class ComplaintSession with _$ComplaintSession {
  const factory ComplaintSession({
    required String id,
    required ComplaintSessionStatus status,
    Urgency? urgency,
    String? specialist,
    String? summary,
    @Default([]) List<String> redFlags,
    @Default([]) List<ComplaintMessage> messages,
  }) = _ComplaintSession;

  factory ComplaintSession.fromJson(Map<String, dynamic> json) => _$ComplaintSessionFromJson(json);
}

extension ComplaintSessionX on ComplaintSession {
  bool get isEmergency => urgency == Urgency.red;
  bool get isCompleted => status == ComplaintSessionStatus.completed;
}
