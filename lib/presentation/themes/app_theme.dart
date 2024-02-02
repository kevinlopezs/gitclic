import 'package:flutter/material.dart';
import 'package:gitclic/presentation/global_widgets/custom_text_form_field.dart';

//Array colors for theme
const colorList = [
  Colors.teal,
  Colors.blue,
  Colors.blueAccent,
  Colors.blueGrey,
  Colors.lightBlue,
  Colors.lightBlueAccent,
  Color(0xFF5572FF) //This is custom color
];

class AppTheme {
  final int selectedColor;
  final int selectedFont;

  //Some assert exceptions to control theme color selected
  AppTheme({this.selectedFont = 1, this.selectedColor = 6})
      : assert(selectedColor >= 0 && selectedFont >= 0,
            'Selected color must be greater than 0'),
        assert(selectedColor >= 0 && selectedFont <= colorList.length - 1,
            'Selected color must be greater than 0');

  ThemeData getTheme() => ThemeData(
      //Whit this we decorate TextFormField
      inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],

      //Theme fonts config
      textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
          labelSmall: TextStyle(
            fontSize: 16,
          ),
          //This is for buttons
          labelLarge: TextStyle(fontSize: 16, color: Colors.white),
          bodySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
}
