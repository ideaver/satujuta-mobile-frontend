import 'package:flutter/material.dart';

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
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
      decoration: InputDecoration(
        labelText: widget.lableText,
        suffixIcon: widget.suffixIcon,
        border: InputBorder.none,
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
