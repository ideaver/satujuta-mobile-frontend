import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';

class RefButtonWithCustomIcon extends StatelessWidget {
  const RefButtonWithCustomIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppSizes.padding * 2,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding / 1.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: AppTextStyle.bold(
                  context,
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  icon,
                  size: 24,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
