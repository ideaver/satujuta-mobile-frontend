import 'package:flutter/material.dart';

import '../../app/const/app_sizes.dart';
import 'my_icon.dart';
import 'my_separated.dart';

class MyButtonWithIcon extends StatelessWidget {
  const MyButtonWithIcon({super.key, required this.onPressed, required this.text, required this.buttonStyle});

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
            const MySeparated(
              sizeWidth: AppSizes.height,
              sizeHeight: AppSizes.height,
            ),
            const MyIcon(
              iconData: Icons.arrow_forward_ios_outlined,
              size: AppSizes.height,
            )
          ],
        ));
  }
}
