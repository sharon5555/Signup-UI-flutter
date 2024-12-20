import 'package:flutter/material.dart';
import 'package:sign_up/screens/change_number.dart';
import 'package:sign_up/widgets/checkbox.dart';
import 'package:sign_up/widgets/create_password_form.dart';
import 'package:sign_up/widgets/primary_button.dart';
import '../theme.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key, required Null Function(String email) onEmailChanged});

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  bool _agreeToTerms = false; // To track checkbox state

  // Method to validate and submit the form
  void _validateAndSubmit() {
    if (_formKey.currentState?.validate() == true && _agreeToTerms) {
      // Proceed to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmNumber(
            onEmailChanged: (String email) {
              // You can handle the email change here
              print("Email changed: $email");
            },
          ),
        ),
      );
    } else if (!_agreeToTerms) {
      // Show error message if checkbox isn't checked
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
            Center(
              child: Image.asset(
                'assets/cpassword.webp', // Replace with your image path
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: Center(
                child: Text(
                  'Create Password',
                  style: titleText,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: nDefaultPadding,
              child: Center(
                child: Text(
                  'Create a password to secure your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: nZambeziColor),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: nDefaultPadding,
              child: Form(
                key: _formKey,
                child: CreatePasswordForm(
                  onEmailChanged: (email) {
                    // Handle email change
                    print("Email entered: $email");
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: nDefaultPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CheckBox(
                      'Keep me signed in.',
                      value: _agreeToTerms,
                      onChanged: (bool newValue) {
                        setState(() {
                          _agreeToTerms = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: 
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmNumber(
                            onEmailChanged: (String email) {
                              // Handle email change
                              print("Email changed in ConfirmNumber: $email");
                            },
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Change Phone Number',
                      style: subTitle.copyWith(color: nSecondaryColor),
                       textAlign: TextAlign.right, // Align the text to the right
                        overflow: TextOverflow.ellipsis, // Truncate overflowed text
                    ),
                  ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: nDefaultPadding,
              child: PrimaryButton(
                buttonText: 'Create Password',
                onPressed: _validateAndSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
