import 'package:flutter/material.dart';

import '../theme.dart';


class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key, required void Function(String email) onEmailChanged});

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Phone Number', false),
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