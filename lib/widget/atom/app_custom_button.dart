import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({super.key, required this.text, this.onPressed, required this.decoration});

  final String text;
  final VoidCallback? onPressed;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * .8,
          decoration: decoration,
          child: Center(
            child: Text(
              text,
              style: AppTextStyle.regular(context),
            ),
          ),
        ),
      ),
    );
  }
}
