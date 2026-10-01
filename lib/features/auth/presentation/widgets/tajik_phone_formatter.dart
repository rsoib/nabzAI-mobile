import 'package:flutter/services.dart';

/// Formats the 9 digits after +992 as "90 000 00 00" while typing.
class TajikPhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digits.length > 9 ? digits.substring(0, 9) : digits;

    final buffer = StringBuffer();
    for (var i = 0; i < limited.length; i++) {
      buffer.write(limited[i]);
      final isGroupBoundary = i == 1 || i == 4 || i == 6;
      if (isGroupBoundary && i != limited.length - 1) buffer.write(' ');
    }

    final formatted = buffer.toString();
    return TextEditingValue(text: formatted, selection: TextSelection.collapsed(offset: formatted.length));
  }
}

String digitsOnly(String value) => value.replaceAll(RegExp(r'\D'), '');
