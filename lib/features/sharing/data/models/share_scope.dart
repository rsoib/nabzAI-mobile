import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_scope.freezed.dart';
part 'share_scope.g.dart';

/// What a share link exposes. `complaints`/`activity` were added to the
/// backend's `ShareScopeDto` and `/shared/:token` assembly specifically for
/// this screen — the API originally only supported profile/labs.
@freezed
abstract class ShareScope with _$ShareScope {
  const factory ShareScope({
    @Default(true) bool profile,
    @Default(true) bool labs,
    @Default(false) bool complaints,
    @Default(false) bool activity,
  }) = _ShareScope;

  factory ShareScope.fromJson(Map<String, dynamic> json) => _$ShareScopeFromJson(json);
}
