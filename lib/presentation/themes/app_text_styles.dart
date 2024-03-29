import 'package:flutter/material.dart';

//This is a global class to change text font sizes and styles for app
class TextStyles {
  //This is for titles
  static const double titleHighSize = 30.0;
  static const double titleMediumSize = 24.0;
  static const double titleSmallSize = 16.0;
  static const double titleTooSmallSize = 12.0;
  //This is for subtitles
  static const double subtitleMediumSize = 20.0;
  //This is for paragraphs
  static const double bodySmallSize = 14.0;
  //This is for buttons
  static const double labelSmallSize = 16.0;
  static const double labelLargeSize = 16.0;

  static TextStyle titleHigh({Color color = Colors.black}) {
    return TextStyle(
        fontSize: titleHighSize, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle titleHighWhite({Color color = Colors.white}) {
    return TextStyle(
        fontSize: titleHighSize, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle titleMedium({Color color = Colors.black}) {
    return TextStyle(
        fontSize: titleMediumSize, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle titleSmall({Color color = Colors.black38}) {
    return TextStyle(
        fontSize: titleSmallSize, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle titleTooSmall({Color color = Colors.black38}) {
    return TextStyle(
        fontSize: titleTooSmallSize, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle subtitleMedium({Color color = Colors.black}) {
    return TextStyle(
        fontSize: subtitleMediumSize,
        fontWeight: FontWeight.bold,
        color: color);
  }

  static TextStyle subtitleMediumWhite({Color color = Colors.white}) {
    return TextStyle(
        fontSize: titleSmallSize, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle labelSmall({Color color = Colors.black}) {
    return TextStyle(fontSize: labelSmallSize, color: color);
  }

  static TextStyle labelLarge({Color color = Colors.white}) {
    return TextStyle(fontSize: labelLargeSize, color: color);
  }

  static TextStyle bodySmall({Color color = Colors.black}) {
    return TextStyle(
        fontSize: bodySmallSize, fontWeight: FontWeight.normal, color: color);
  }
}
