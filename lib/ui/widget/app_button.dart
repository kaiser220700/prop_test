import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String icon;
  final String text;
  const AppButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          color: const Color(0xFFDD0000),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFa7a7a7)),
        ),
      ],
    );
  }
}
