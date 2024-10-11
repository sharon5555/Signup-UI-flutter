import 'package:flutter/material.dart';
import 'package:sign_up/screens/sign_up_password.dart'; // Make sure the import path is correct

class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Center( // Center the entire Row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BuildButton(
            iconImage: const Image(
              height: 20,
              width: 20,
              image: AssetImage('assets/dial.jpg'),
            ),
            textButton: 'number',
            onPressed: () {
              // Navigate to the PasswordForm screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPassword(
                    onEmailChanged: (String email) {
                      // You can handle email change here if needed
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String textButton;
  final VoidCallback onPressed;

  const BuildButton({
    super.key,
    required this.iconImage,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed, // Use onTap for gesture detection
      child: Container(
        height: mediaQuery.height * 0.06,
        width: mediaQuery.width * 0.36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300] ?? Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconImage,
            const SizedBox(width: 5),
            Text(textButton),
          ],
        ),
      ),
    );
  }
}
