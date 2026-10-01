import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_response.freezed.dart';
part 'tokens_response.g.dart';

/// Response of `/auth/otp/verify` and `/auth/refresh`. No `expiresIn` field
/// exists on the backend — the app treats access tokens as opaque and only
/// refreshes reactively on a 401 (see AuthInterceptor).
@freezed
abstract class TokensResponse with _$TokensResponse {
  const factory TokensResponse({
    required String accessToken,
    required String refreshToken,
  }) = _TokensResponse;

  factory TokensResponse.fromJson(Map<String, dynamic> json) => _$TokensResponseFromJson(json);
}
