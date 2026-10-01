import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint_message.freezed.dart';
part 'complaint_message.g.dart';

enum ComplaintMessageRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
  @JsonValue('system')
  system,
}

@freezed
abstract class ComplaintMessage with _$ComplaintMessage {
  const factory ComplaintMessage({
    required String id,
    required ComplaintMessageRole role,
    required String content,
  }) = _ComplaintMessage;

  factory ComplaintMessage.fromJson(Map<String, dynamic> json) => _$ComplaintMessageFromJson(json);
}
