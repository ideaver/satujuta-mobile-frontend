import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_icon.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_separated.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';

class MyButtonWithIcon extends StatelessWidget {
  const MyButtonWithIcon(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.buttonStyle});

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
              sizeWidth: FoundationSize.sizeHeightDefault,
              sizeHeight: FoundationSize.sizeHeightDefault,
            ),
            const MyIcon(
              iconData: Icons.arrow_forward_ios_outlined,
              size: FoundationSize.sizeHeightDefault,
            )
          ],
        ));
  }
}
