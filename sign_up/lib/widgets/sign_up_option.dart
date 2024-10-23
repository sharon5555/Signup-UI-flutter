import 'package:flutter/material.dart';

class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildButton(
          iconImage: Image(
            height: 20,
            width: 20,
            image: AssetImage('assets/google.png'),
          ),
          textButton: 'Google',
        ),
        SizedBox(width: 16), // Add 16px space between the buttons
        BuildButton(
          iconImage: Image(
            height: 20,
            width: 20,
            image: AssetImage('assets/apple.png'),
          ),
          textButton: 'Apple',
        ),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String textButton;
  const BuildButton({super.key, required this.iconImage, required this.textButton});

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
