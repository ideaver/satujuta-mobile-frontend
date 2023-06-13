import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class MyButtonLeft extends StatelessWidget {
  const MyButtonLeft({
    super.key,
    required this.textLeftButton,
  });

  final String textLeftButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(40),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            textLeftButton,
            style:
                AppTextStyle.bold(context).copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
