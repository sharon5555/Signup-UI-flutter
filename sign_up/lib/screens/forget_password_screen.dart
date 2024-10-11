import 'package:flutter/material.dart';
import 'package:sign_up/theme.dart';
import 'package:sign_up/widgets/forgot_form.dart';
import 'package:sign_up/widgets/password_form.dart';
import 'package:sign_up/widgets/primary_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: nDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 250,
            ),
            Text(
              'Forgot Password',
              style: titleText,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Please enter your email address',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const ForgotForm(),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordForm(onEmailChanged: (String email) {  },),
                      ));
                },
                child: PrimaryButton(buttonText: 'Reset Password', 
                onPressed: () {} ,
              )),
          ],
        ),
      ),
    );
  }
}