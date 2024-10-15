import 'package:flutter/material.dart';
import 'package:sign_up/screens/confirm_number.dart';
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
          builder: (context) => ConfirmNumber(
            onEmailChanged: (String email) {},
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
            Padding(
              padding: nDefaultPadding,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: titleText,
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
                  // Confirm Phone Number text
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmNumber(onEmailChanged: (String email) {  },)), // Ensure SignUpPasswordScreen is imported
                      );
                    },
                    child: Text(
                      'Confirm Phone Number',
                      style: subTitle.copyWith(color:nPrimaryColor), // Style the text as needed
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
