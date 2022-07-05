import 'package:flutter/services.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  final RegExp regEx;

  CustomTextInputFormatter(this.regEx);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}
