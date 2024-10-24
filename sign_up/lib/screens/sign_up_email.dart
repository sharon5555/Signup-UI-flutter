import 'package:flutter/material.dart';
import 'package:sign_up/screens/create_password.dart'; // Import CreatePassword screen
import 'package:sign_up/widgets/checkbox.dart';
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
  final _formKey = GlobalKey<FormState>(); // For form validation
  bool _agreeToTerms = false; // To track checkbox state
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
        MaterialPageRoute(
          builder: (context) => CreatePassword(
            onEmailChanged: (String email) {}, // Pass data if needed
          ),
        ),
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
            // Centering the image
            Center(
              child: Image.asset(
                'assets/signup.webp', // Replace with your image path
                height: 100, // Adjust height as needed
                width: 100, // Adjust width as needed
              ),
            ),
            const SizedBox(height: 20), // Space between image and title
            Padding(
              padding: nDefaultPadding,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: titleText,
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between title and description
            const Padding(
              padding: nDefaultPadding,
              child: Center(
                child: Text(
                  'Create an account to get started with our services.',
                  textAlign: TextAlign.center, // Center the text
                  style: TextStyle(color: nZambeziColor), // Optional styling
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: nDefaultPadding,
              child: Form(
                key: _formKey,
                child: SignUpForm(
                  onEmailChanged: _onEmailChanged, // Track email changes
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Checkbox and terms
                  Expanded(
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
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: nDefaultPadding,
              child: PrimaryButton(
                buttonText: 'Sign Up',
                onPressed: _validateAndSubmit, // Trigger validation and submission
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: Center(
                child: Text(
                  'Or Sign Up with:',
                  style: subTitle, // Style this text as needed
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: nDefaultPadding,
              child: SignUpOption(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
