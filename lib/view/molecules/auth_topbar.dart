import 'package:flutter/material.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../atoms/my_button_with_icon.dart';
import '../atoms/my_icon_button.dart';

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
      padding: const EdgeInsets.symmetric(vertical: AppSizes.sizePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onPressed: () {},
            path: AppAssets.lockIconPath,
            sizeImage: AppSizes.sizeIcon,
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
