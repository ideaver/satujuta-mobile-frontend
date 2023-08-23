import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: AppTextStyle.bold(context),
      ),
    );
  }
}
