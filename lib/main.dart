import 'main_dev.dart' as main_dev;

/// Default entry point — same as the dev flavor for now. main_prod.dart
/// (with its own AppConfig) is added in the polish pass once there's a real
/// production backend to point at.
Future<void> main() => main_dev.main();
