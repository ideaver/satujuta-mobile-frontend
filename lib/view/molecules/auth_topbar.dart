import 'package:flutter/material.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/widget/my_button_with_icon.dart';
import '../../app/widget/my_icon_button.dart';

class AuthTopBar extends StatelessWidget {
  const AuthTopBar({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final String text;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            onPressed: () {},
            imgIcon: AppAssets.lockIconPath,
            imgIconSize: AppSizes.padding * 3,
          ),
          MyButtonWithIcon(
            onPressed: onPressed,
            text: text,
            buttonStyle: const ButtonStyle(),
          )
        ],
      ),
    );
  }
}
