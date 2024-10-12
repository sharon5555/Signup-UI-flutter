import 'package:flutter/material.dart';
import 'package:sign_up/theme.dart';

class ForgotForm extends StatelessWidget {
  const ForgotForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: const TextStyle(color: nTextFieldColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: nPrimaryColor),
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: nTextFieldColor),
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
      ),
    );
  }
}
