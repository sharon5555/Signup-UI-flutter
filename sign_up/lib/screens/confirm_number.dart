import 'package:flutter/material.dart';
import 'package:sign_up/theme.dart';
import 'package:sign_up/widgets/confirm_number_form.dart';
import 'package:sign_up/widgets/primary_button.dart';

class ConfirmNumber extends StatefulWidget {
  const ConfirmNumber({super.key, required Null Function(String email) onEmailChanged});

  @override
  _ConfirmNumberState createState() => _ConfirmNumberState();
}

class _ConfirmNumberState extends State<ConfirmNumber> {
  final bool _isAgreed = false; // State variable for checkbox

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
                  'Confirm Phone Number',
                  style: titleText,
                  textAlign: TextAlign.center, // Center the text
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: nDefaultPadding,
              child: Center( // Centering the additional text
                child: Text(
                  'We collect phone numbers to securely match you with drivers and ensure safe communication.',
                  textAlign: TextAlign.center, // Center the text
                  style: TextStyle(color: nZambeziColor), // Optional styling
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: nDefaultPadding,
              child: ConfirmNumberForm(
                onEmailChanged: (String email) {},
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: nDefaultPadding,
              child: PrimaryButton(
                buttonText: 'Submit',
                onPressed: _validateAndSubmit,
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
