import 'package:flutter/material.dart';
import 'package:sign_up/widgets/checkbox.dart';
import 'package:sign_up/widgets/password_form.dart';
import 'package:sign_up/widgets/primary_button.dart';
import 'package:sign_up/widgets/sign_up_option.dart';
import 'package:sign_up/widgets/signup_form.dart';
import '../theme.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  _SignUpEmailState createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  final _formKey = GlobalKey<FormState>();  // For form validation
  bool _agreeToTerms = false;  // To track checkbox state
  String _email = '';

  // Callback for when email changes in the form
  void _onEmailChanged(String email) {
    setState(() {
      _email = email;
    });
  }

  // Method to validate and submit the form
  void _validateAndSubmit() {
    if (_formKey.currentState?.validate() == true && _agreeToTerms) {
      // Proceed to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordForm(onEmailChanged: (String email) {  },)),
      );
    } else if (!_agreeToTerms) {
      // Show error message if terms not agreed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must agree to the terms and conditions.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
              child: Center(
                child: Text(
                  'Create Account',
                  style: titleText,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: nDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already a member?',
                    style: subTitle,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // Handle login navigation
                    },
                    child: Text(
                      'Log in',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: nDefaultPadding,
              child: Form(
                key: _formKey,
                child: SignUpForm(
                  onEmailChanged: _onEmailChanged,  // Track email changes
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: CheckBox(
                'Agree to terms and conditions.',
                value: _agreeToTerms,
                onChanged: (bool newValue) {
                  setState(() {
                    _agreeToTerms = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: nDefaultPadding,
              child: PrimaryButton(
                buttonText: 'Sign Up',
                onPressed: _validateAndSubmit,  // Trigger validation and submission
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Or Sign Up with:',
                        style: subTitle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: nDefaultPadding,
                        child: SignUpOption(),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
