import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/screens/home_page_screen.dart';
import 'package:flutter_todo_app/screens/login_screen.dart';
import 'package:flutter_todo_app/screens/onboarding_screen.dart';
import 'package:flutter_todo_app/screens/sign_up_screen.dart';
import 'package:flutter_todo_app/screens/welcome_screen.dart';

class Routes {
  static String onBoardingScreen = '/OnBoardingScreen';
  static String welcomeScreen = '/WelcomeScreen';
  static String signUpScreen = '/SignUpScreen';
  static String loginScreen = '/LogInScreen';
  static String homePageScreen = '/HomePageScreen';

  static getRoutes(BuildContext context) {
    return {
      onBoardingScreen: (context) => const OnBoardingScreen(),
      welcomeScreen: (context) => const WelcomeScreen(),
      signUpScreen: (context) => const SignUpScreen(),
      loginScreen: (context) => const LogInScreen(),
      homePageScreen: (context) => HomePageScreen(),
    };
  }
}
