import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

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
      style: AppTextStyle.medium(
        context,
        color: AppColors.base,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: lableText,
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        labelStyle: AppTextStyle.regular(
          context,
          color: AppColors.base,
          fontSize: 14,
        ),
      ),
    );
  }
}
