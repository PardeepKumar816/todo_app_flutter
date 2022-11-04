import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/button_style.dart';
import 'package:flutter_todo_app/presentation/widgets/circular_button.dart';
import 'package:flutter_todo_app/presentation/styles/colors.dart';
import 'package:flutter_todo_app/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Image.asset('assets/images/welcome.png'),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Hello!',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 32, letterSpacing: 3),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Welcome to the best task manager dear!',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 16, letterSpacing: 3),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(
                height: 32,
              ),
              CircularButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
                style: MyButtonStyle.style.copyWith(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: (WelcomeScreen.size.width / 3) + 8,
                      vertical: WelcomeScreen.size.height * 0.02,
                    ),
                  ),
                ),
                label: 'Login',
              ),
              const SizedBox(
                height: 16,
              ),
              CircularButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.signUpScreen),
                style: MyButtonStyle.style,
                label: 'Sign Up',
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signUpScreen);
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.purple),
                ),
                style: MyButtonStyle.style.copyWith(
                  backgroundColor: MaterialStateProperty.all(AppColors.white),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      side: BorderSide(color: AppColors.purple, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
