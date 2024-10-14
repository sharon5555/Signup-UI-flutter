import 'package:flutter/material.dart';
import '../theme.dart';

class ConfirmNumberForm extends StatefulWidget {
  const ConfirmNumberForm({super.key, required void Function(String email) onEmailChanged});

  @override
  _ConfirmNumberFormState createState() => _ConfirmNumberFormState();
}

class _ConfirmNumberFormState extends State<ConfirmNumberForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Phone Number', false),
        const SizedBox(height: 15), // Bottom space between rows
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
  }
}
