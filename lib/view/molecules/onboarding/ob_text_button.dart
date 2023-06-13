import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';

class ObTextButton extends StatelessWidget {
  const ObTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Login",
        style: AppTextStyle.bold(
          context,
          color: AppColors.base,
        ),
      ),
    );
  }
}
