
import 'package:flutter/material.dart';

class AppTheme{
  static const blueColor = Color(0xFF004182);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;

  static ThemeData themeData =ThemeData(
      primaryColor: blueColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: whiteColor
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: whiteColor
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: whiteColor
      ),
    ),
      );
}