import 'package:flutter/material.dart';
import 'package:gitclic/presentation/themes/app_theme.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();
  static const int focusBorderColor = 2;
  static const int notfocusBorderColor = 3;

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide(width: 2, color: colorList[focusBorderColor])),
      prefixIconColor: colorList[notfocusBorderColor],
      floatingLabelStyle: TextStyle(color: colorList[focusBorderColor]),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide:
              BorderSide(width: 2, color: colorList[focusBorderColor])));
}
