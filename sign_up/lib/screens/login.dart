import 'package:flutter/material.dart';
import 'package:sign_up/screens/forget_password_screen.dart';
import 'package:sign_up/screens/sign_up_email.dart';
import 'package:sign_up/theme.dart';
import 'package:sign_up/widgets/login_form.dart';
import 'package:sign_up/widgets/login_option.dart';
import 'package:sign_up/widgets/primary_button.dart'; // Make sure to import your SignUpEmail screen

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to SignUpEmail screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpEmail()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sign Up',
                style: TextStyle(color: nPrimaryColor),
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: nDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                'Login',
                style: titleText,
              ),
              const SizedBox(
                height: 25,
              ),
              const LogInForm(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen()));
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: nZambeziColor,
                    fontSize: 16,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                buttonText: 'Log In', onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Or log in with:',
                style: subTitle.copyWith(color: nZambeziColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const LoginOption(),
            ],
          ),
        ),
      ),
    );
  }
}
