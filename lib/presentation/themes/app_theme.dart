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
  //Global AppTheme colors and font
  final int selectedColor;
  final int selectedFont;

  //Variables to change buttons colors
  final Color buttonColor;
  final Color buttonTextcolor;

  //Some assert exceptions to control theme color selected
  AppTheme(
      {this.buttonColor = const Color(0xFF5572FF),
      this.buttonTextcolor = Colors.white,
      this.selectedFont = 1,
      this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedFont >= 0,
            'Selected color must be greater than 0'),
        assert(selectedColor >= 0 && selectedFont <= colorList.length - 1,
            'Selected color must be greater than 0');

  ThemeData getTheme() => ThemeData(
        //Whit this we decorate TextFormField
        inputDecorationTheme:
            CustomTextFormFieldTheme.lightInputDecorationTheme(
                borderColor: colorList[3],
                focusedBorderColor: colorList[selectedColor]),
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],

        //Global theme buttons design
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            //Parameter to put another color
            buttonColor: colorList[selectedColor]),

        //This is a custom button style for elevated buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(colorList[selectedColor]),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0))),
        )),

        iconTheme: IconThemeData(color: colorList[selectedColor]),
      );
}
