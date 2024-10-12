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
      ),
      body: Padding(
        padding: nDefaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image with square border radius
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Square with rounded corners
              child: Image.asset(
                'assets/fpassword.png', // Replace with your image path
                width: 120, // Adjust the size as needed
                height: 120,
                fit: BoxFit.cover, // To cover the entire widget
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Center the text
            Text(
              'Forgot Password',
              style: titleText,
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Please enter your email address',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(
              height: 20,
            ),
            // ForgotForm as usual
            const ForgotForm(),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordForm(
                      onEmailChanged: (String email) {},
                    ),
                  ),
                );
              },
              child: PrimaryButton(
                buttonText: 'Reset Password',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
