import 'package:flutter/material.dart';

import '../foundations/foundation_typhography.dart';

class MyCustomForm extends StatelessWidget {
  const MyCustomForm(
      {super.key,
      required this.lableText,
      required this.suffixIcon,
      this.keyboardtype = TextInputType.text,
      this.hideTextfild = false,
      required this.click});
  final String lableText;

  final Widget suffixIcon;
  final TextInputType keyboardtype;
  final bool hideTextfild;
  final VoidCallback click;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        click();
      },
      style: FoundationTyphography.darkFontSemibold
          .copyWith(fontSize: FoundationTyphography.fontSizeH4),
      decoration: InputDecoration(
        labelText: lableText,
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        labelStyle: FoundationTyphography.darkFontRegular.copyWith(
          fontSize: FoundationTyphography.fontSizeH4,
        ),
      ),
    );
  }
}
