import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';

class MyInviteButton extends StatelessWidget {
  MyInviteButton({
    super.key,
    this.textButton,
    this.leadingButton,
    required this.functionButton,
  });

  dynamic functionButton;
  String? textButton;
  Widget? leadingButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.baseLv6),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: functionButton,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              leadingButton!,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  textButton!,
                  style: AppTextStyle.regular(context, color: AppColors.base, fontSize: 12),
                ),
              ),
              Icon(
                Icons.arrow_forward_outlined,
                color: AppColors.base,
                size: 18,
              )
            ],
          ),
        ));
  }
}
