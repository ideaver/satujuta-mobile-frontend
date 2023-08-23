import 'package:flutter/material.dart';

import '../../app/theme/app_sizes.dart';
import 'app_icon.dart';
import 'app_separated.dart';

class AppButtonWithIcon extends StatelessWidget {
  const AppButtonWithIcon({super.key, required this.onPressed, required this.text, required this.buttonStyle});

  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const AppSeparated(
              sizeWidth: AppSizes.height,
              sizeHeight: AppSizes.height,
            ),
            const AppIcon(
              iconData: Icons.arrow_forward_ios_outlined,
              size: AppSizes.height,
            )
          ],
        ));
  }
}
