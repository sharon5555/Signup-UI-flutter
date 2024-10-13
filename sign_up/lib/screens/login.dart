import 'package:flutter/material.dart';
import 'package:sign_up/screens/sign_up_email.dart';
import 'package:sign_up/theme.dart'; // Make sure to import your SignUpEmail screen

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

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
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to SignUpEmail screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpEmail()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sign Up',
                style: TextStyle(color: nPrimaryColor),
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your input fields or other widgets here
          ],
        ),
      ),
    );
  }
}
