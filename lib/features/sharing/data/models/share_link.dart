import 'package:freezed_annotation/freezed_annotation.dart';
import 'share_scope.dart';

part 'share_link.freezed.dart';
part 'share_link.g.dart';

/// Raw shape of a `ShareLink` entity as returned by `GET /me/share-links`
/// and inside the `POST /me/share-links` response. Note: the backend does
/// not strip `tokenHash` from the response (no serializer interceptor is
/// wired up there) — the app simply never reads that field.
@freezed
abstract class ShareLink with _$ShareLink {
  const factory ShareLink({
    required String id,
    required ShareScope scope,
    required String expiresAt,
    String? revokedAt,
    required String createdAt,
  }) = _ShareLink;

  factory ShareLink.fromJson(Map<String, dynamic> json) => _$ShareLinkFromJson(json);
}

extension ShareLinkX on ShareLink {
  bool get isActive => revokedAt == null && DateTime.parse(expiresAt).isAfter(DateTime.now());
}

/// `POST /me/share-links` response: the plaintext token is only ever
/// returned here — it can't be recovered later, only revoked.
@freezed
abstract class CreateShareLinkResult with _$CreateShareLinkResult {
  const factory CreateShareLinkResult({
    required String token,
    required ShareLink shareLink,
  }) = _CreateShareLinkResult;

  factory CreateShareLinkResult.fromJson(Map<String, dynamic> json) => _$CreateShareLinkResultFromJson(json);
}
