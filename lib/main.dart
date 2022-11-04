import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/themes.dart';
import 'package:flutter_todo_app/routes.dart';
import 'package:flutter_todo_app/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO List',
      // themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      // darkTheme: MyThemes.darkTheme,
      //home: OnBoardingScreen(),
      initialRoute: Routes.onBoardingScreen,
      routes: Routes.getRoutes(context),
    );
  }
}
