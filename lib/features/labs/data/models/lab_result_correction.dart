/// Request-only shape for `PUT /me/labs/reports/:id/results` — one entry of
/// `ConfirmLabResultsDto.results`. Not a freezed model: it's a one-off
/// request payload, not something the app ever reads back.
class LabResultCorrection {
  const LabResultCorrection({required this.id, this.value, this.valueText, this.unit});

  final String id;
  final double? value;
  final String? valueText;
  final String? unit;

  Map<String, dynamic> toJson() => {
        'id': id,
        if (value != null) 'value': value,
        if (valueText != null) 'valueText': valueText,
        if (unit != null) 'unit': unit,
      };
}
