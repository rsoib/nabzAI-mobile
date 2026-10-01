/// Digits the OTP screen expects. Backend `.env` sets `OTP_CODE_LENGTH=6`
/// (bumped from the original default of 4 specifically for this app). If the
/// backend value changes again, update it here only.
const int otpCodeLength = 6;

/// Visible resend cooldown shown on the OTP screen. The code itself lives
/// for 300s server-side (`OTP_TTL_SECONDS`) but making the user wait that
/// long to resend would be poor UX — 60s is a judgment call, independent of
/// the code's actual expiry.
const int otpResendCooldownSeconds = 60;
