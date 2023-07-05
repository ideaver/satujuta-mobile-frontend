import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  const MyCustomText({super.key, required this.text, required this.style});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
