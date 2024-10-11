import 'package:flutter/material.dart';

import '../theme.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required void Function(String email) onEmailChanged});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('First Name', false),
        buildInputForm('Last Name', false),
        buildInputForm('Email', false),
        buildInputForm('Password', true),
        buildInputForm('Confirm Password', true),
      ],
    );
  }

  Padding buildInputForm(String hint, bool pass) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: nTextFieldColor),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: nPrimaryColor)),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? const Icon(
                            Icons.visibility_off,
                            color: nTextFieldColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: nPrimaryColor,
                          ))
                : null,
          ),
        ));
  }
}