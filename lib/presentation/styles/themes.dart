import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/colors.dart';

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light()
        .copyWith(secondary: AppColors.purple, primary: AppColors.white),
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: AppColors.black),
      subtitle1: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.white),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w300, fontSize: 18, color: AppColors.white),
    ),
  );
}
