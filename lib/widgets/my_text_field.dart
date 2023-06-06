import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/constant.dart';

class MyTextField extends StatefulWidget {
  final String lableText;

  final Widget suffixIcon;
  final TextInputType keyboardtype;
  final bool hideTextfild;
  final VoidCallback click;

  const MyTextField({
    super.key,
    required this.lableText,
    required this.suffixIcon,
    this.keyboardtype = TextInputType.text,
    this.hideTextfild = false,
    required this.click,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        widget.click();
      },
      style: darkJakartaText.copyWith(fontSize: 14, fontWeight: semiBold),
      decoration: InputDecoration(
        labelText: widget.lableText,
        suffixIcon: widget.suffixIcon,
        border: InputBorder.none,
        labelStyle: darkJakartaText.copyWith(
          fontSize: 14,
        ),
      ),
    );
  }
}
