import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../const/app_sizes.dart';

class AppTextField extends StatelessWidget {
  final String? lableText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardtype;
  final bool obscureText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.lableText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardtype,
    this.obscureText = false,
    this.onTap,
    this.onChanged,
    this.padding,
    this.contentPadding,
    this.controller,
    this.textInputAction,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppSizes.padding,
            vertical: AppSizes.padding / 2,
          ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: keyboardtype,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        style: AppTextStyle.medium(
          context,
          color: AppColors.base,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: lableText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          labelStyle: AppTextStyle.medium(
            context,
            color: AppColors.baseLv4,
            fontSize: 14,
          ),
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}
