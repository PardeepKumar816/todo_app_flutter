import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/button_style.dart';
import 'package:flutter_todo_app/presentation/widgets/circular_button.dart';
import 'package:flutter_todo_app/presentation/styles/colors.dart';
import 'package:flutter_todo_app/routes.dart';
import 'package:flutter_todo_app/screens/welcome_screen.dart';

import '../presentation/widgets/form_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Heyy !',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 24, letterSpacing: 3),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Create a New Account !',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      letterSpacing: 2,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  child: Column(
                    children: [
                      const FormTextField(
                        icon: Icons.person,
                        label: 'Full Name',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const FormTextField(
                        icon: Icons.local_post_office,
                        label: 'Email Address',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const FormTextField(
                        icon: Icons.password,
                        label: 'Password',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CircularButton(
                        style: MyButtonStyle.style.copyWith(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              horizontal: (WelcomeScreen.size.width / 3) + 8,
                              vertical: WelcomeScreen.size.height * 0.02,
                            ),
                          ),
                        ),
                        label: 'Sign Up',
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Row(
                          children: [
                            Text(
                              'Already have an account ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginScreen);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: AppColors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              indent: 24,
                              endIndent: 16,
                              thickness: 2,
                              height: 12,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                                color: AppColors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Divider(
                              indent: 16,
                              endIndent: 24,
                              thickness: 2,
                              height: 12,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image.asset('assets/icons/google.png'),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: WelcomeScreen.size.width / 8,
                          ),
                          GestureDetector(
                            child: Image.asset('assets/icons/facebook.png'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
