import 'package:flutter/material.dart';
import 'package:sign_up/screens/forget_password_screen.dart';
import 'package:sign_up/screens/sign_up_email.dart';
import 'package:sign_up/theme.dart';
import 'package:sign_up/widgets/login_form.dart';
import 'package:sign_up/widgets/login_option.dart';
import 'package:sign_up/widgets/primary_button.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // Controllers for the email and password fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // FocusNodes to manage focus on email and password fields
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
            Navigator.pop(context); // Navigate back to the previous screen
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
              const SizedBox(height: 120),
              Text(
                'Sign in',
                style: titleText,
              ),
              const SizedBox(height: 25),
              const LogInForm(), // Form fields for login
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to ForgetPasswordScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Forgot password?',
                  style: subTitle.copyWith(color: nPrimaryColor),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                buttonText: 'Sign In',
                onPressed: () {
                  // Implement your sign-in logic here
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Or sign in with:',
                style: subTitle.copyWith(color: nZambeziColor),
              ),
              const SizedBox(height: 20),
              const LoginOption(), // Options for logging in with social accounts
            ],
          ),
        ),
      ),
    );
  }
}
