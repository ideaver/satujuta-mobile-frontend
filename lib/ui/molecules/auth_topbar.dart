import 'package:flutter/material.dart';

import '../atoms/my_button_with_icon.dart';
import '../atoms/my_icon_button.dart';
import '../foundations/foundation_links.dart';
import '../foundations/foundation_size.dart';

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
      padding: const EdgeInsets.symmetric(vertical: FoundationSize.sizePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
              onPressed: () {},
              path: FoundationLinks.linkLockIconLogo,
              sizeImage: FoundationSize.sizeIcon),
          MyButtonWithIcon(
              onPressed: onPressed,
              text: text,
              buttonStyle: const ButtonStyle())
        ],
      ),
    );
  }
}
