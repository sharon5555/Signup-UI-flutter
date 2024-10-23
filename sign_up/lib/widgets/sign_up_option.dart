import 'package:flutter/material.dart';
import 'package:sign_up/theme.dart';

class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: BuildButton(
            iconImage: Image(
              height: 30,
              width: 30,
              image: AssetImage('assets/google.png'),
            ),
            textButton: 'Google',
            textStyle: TextStyle(
              color: nZambeziColor,
              fontSize: 16,
            ), // Optional styling
          ),
        ),
        SizedBox(width: 16), // 16px space between the buttons
        Expanded(
          child: BuildButton(
            iconImage: Image(
              height: 30,
              width: 30,
              image: AssetImage('assets/apple.png'),
            ),
            textButton: 'Apple',
            textStyle: TextStyle(color: nZambeziColor), // Optional styling
          ),
        ),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String textButton;
  final TextStyle textStyle; // Add the textStyle parameter

  const BuildButton({
    super.key,
    required this.iconImage,
    required this.textButton,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.06,
      width: mediaQuery.width * 0.42, // Increase width for each button
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
    );
  }
}
