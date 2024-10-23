import 'package:flutter/material.dart';
import 'package:sign_up/theme.dart';

class CreatePasswordForm extends StatefulWidget {
  const CreatePasswordForm({super.key, required void Function(String email) onEmailChanged});

  @override
  State<CreatePasswordForm> createState() => _CreatePasswordFormState();
}

class _CreatePasswordFormState extends State<CreatePasswordForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Create new password', false),
        const SizedBox(height: 16), 
        buildInputForm('Confirm Password', true),
        const SizedBox(height: 16), // Add space after Password field
      ],
    );
  }

  Padding buildInputForm(String label, bool pass) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: nTextFieldColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: nPrimaryColor),
            borderRadius: BorderRadius.circular(12.0), // Set rounded corners
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: nTextFieldColor), // Border color when enabled
            borderRadius: BorderRadius.circular(12.0), // Set rounded corners
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
  }
}
