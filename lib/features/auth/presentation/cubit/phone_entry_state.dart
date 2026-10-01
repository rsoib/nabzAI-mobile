import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_entry_state.freezed.dart';

@freezed
abstract class PhoneEntryState with _$PhoneEntryState {
  const factory PhoneEntryState({
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _PhoneEntryState;
}
