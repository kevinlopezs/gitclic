import 'package:flutter/material.dart';
import 'package:gitclic/presentation/themes/app_theme.dart';

class CustomTextFormFieldTheme {
  static const int notfocusBorderColor = 3;

  static InputDecorationTheme lightInputDecorationTheme({
    required Color borderColor,
    required Color focusedBorderColor,
  }) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(width: 2, color: borderColor),
      ),
      prefixIconColor: colorList[notfocusBorderColor],
      floatingLabelStyle: TextStyle(color: focusedBorderColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(width: 2, color: focusedBorderColor),
      ),
    );
  }
}
