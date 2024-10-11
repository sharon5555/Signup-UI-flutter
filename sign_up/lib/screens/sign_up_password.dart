import 'package:flutter/material.dart';
import 'package:sign_up/screens/forget_password_screen.dart';
import 'package:sign_up/theme.dart';
import 'package:sign_up/widgets/checkbox.dart';
import 'package:sign_up/widgets/password_form.dart';
import 'package:sign_up/widgets/primary_button.dart';

class SignUpPassword extends StatefulWidget {
  const SignUpPassword({super.key, required Null Function(String email) onEmailChanged});

  @override
  _SignUpPasswordState createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  bool _isAgreed = false; // State variable for checkbox

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Padding(
              padding: nDefaultPadding,
              child: Text(
                'Sign Up With Phone Number',
                style: titleText,
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 10),
            Padding(
              padding: nDefaultPadding,
              child: PasswordForm(
                onEmailChanged: (String email) {},
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: CheckBox(
                'Agree to terms and conditions.',
                value: _isAgreed, // Provide the current state
                onChanged: (bool? value) {
                  setState(() {
                    _isAgreed = value ?? false; // Update the checkbox state
                  });
                },
                 // The text for the checkbox
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: PrimaryButton(
                buttonText: 'Sign Up',
                onPressed: _validateAndSubmit,
              ),
            ),
            const SizedBox(height: 20),
Padding(
  padding: nDefaultPadding,
  child: GestureDetector( // Use GestureDetector for tap detection
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()), // Navigate to the Forget Password screen
      );
    },
    child: Text(
      'Forget Password',
      style: subTitle.copyWith(color: nBlackColor),
    ),
  ),
),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _validateAndSubmit() {
    // Implement your validation and submission logic here
  }
}
