import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.buttonStyle,
    required this.onPressed,
    required this.padding,
  });
  final String text;
  final TextStyle textStyle;
  final ButtonStyle buttonStyle;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
