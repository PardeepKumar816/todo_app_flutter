import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/welcome_screen.dart';

import 'colors.dart';

class MyButtonStyle {
  static ButtonStyle style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.purple),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
          horizontal: WelcomeScreen.size.width / 3,
          vertical: WelcomeScreen.size.height * 0.02),
    ),
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
    ),
  );
}
