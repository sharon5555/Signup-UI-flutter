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
        const SizedBox(height: 15), // Bottom space between rows
        buildInputForm('Last Name', false),
        const SizedBox(height: 15), // Bottom space between rows
        buildInputForm('Email', false),
        const SizedBox(height: 15), // Bottom space between rows
        buildInputForm('Password', true),
        const SizedBox(height: 15), // Bottom space between rows
        buildInputForm('Confirm Password', true),
      ],
    );
  }

  Padding buildInputForm(String hint, bool pass) {
    try {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: nTextFieldColor),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: nPrimaryColor),
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: nTextFieldColor),
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
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
                          ),
                  )
                : null,
          ),
        ),
      );
    } catch (e) {
      throw Exception("Error building input form: $e");
    }
  }
}
