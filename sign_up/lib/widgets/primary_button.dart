import 'package:flutter/material.dart';

import '../theme.dart';


class PrimaryButton extends StatelessWidget {
  final String buttonText;
  const PrimaryButton({super.key, required this.buttonText, required void Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: nPrimaryColor),
      child: Text(
        buttonText,
        style: textButton.copyWith(color: nWhiteColor),
      ),
    );
  }
}