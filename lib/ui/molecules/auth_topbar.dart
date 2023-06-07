import 'package:flutter/material.dart';

import '../atoms/my_button_with_icon.dart';
import '../atoms/my_icon_button.dart';
import '../foundations/foundation_links.dart';
import '../foundations/foundation_size.dart';
import '../ui.dart';

class AuthTopBar extends StatelessWidget {
  const AuthTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: FoundationSize.sizePaddingAuth,
          vertical: FoundationSize.sizePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
              onPressed: () {},
              path: FoundationLinks.linkLockIconLogo,
              sizeImage: FoundationSize.sizeIcon),
          MyButtonWithIcon(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen(),
                  )),
              text: "Lupa Password",
              buttonStyle: const ButtonStyle())
        ],
      ),
    );
  }
}
