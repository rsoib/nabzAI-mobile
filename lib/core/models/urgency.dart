import 'package:json_annotation/json_annotation.dart';
import '../widgets/urgency_card.dart';

/// Mirrors backend `Urgency` (green/yellow/red), shared by lab reports and
/// complaint sessions.
enum Urgency {
  @JsonValue('green')
  green,
  @JsonValue('yellow')
  yellow,
  @JsonValue('red')
  red,
}

extension UrgencyX on Urgency {
  /// Maps the backend enum to the design system's presentation-level enum.
  UrgencyLevel toUrgencyLevel() => switch (this) {
        Urgency.green => UrgencyLevel.calm,
        Urgency.yellow => UrgencyLevel.warning,
        Urgency.red => UrgencyLevel.critical,
      };
}
