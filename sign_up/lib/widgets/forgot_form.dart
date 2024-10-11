import 'package:flutter/material.dart';
import 'package:sign_up/theme.dart';


class ForgotForm extends StatelessWidget {
  const ForgotForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: nTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: nPrimaryColor))),
      ),
    );
  }
}