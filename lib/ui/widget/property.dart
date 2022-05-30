import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Property extends StatelessWidget {
  final String title, content;
  const Property({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return RichText(text: TextSpan(
      text: "$title : ",
      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.black),
      children: [
        TextSpan(
          text: content,
          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
        )
      ]
    ));
  }

}