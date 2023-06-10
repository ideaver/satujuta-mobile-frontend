import 'package:flutter/material.dart';

import '../../atoms/my_custom_form.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';

class AuthFormResetPassword extends StatelessWidget {
  const AuthFormResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(FoundationSize.sizePadding + 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: FoundationColor.bgColorGrey),
          borderRadius:
              BorderRadius.circular(FoundationSize.sizeHeightDefault)),
      child: MyCustomForm(
        lableText: "Email",
        suffixIcon: Image.asset(FoundationLinks.linkContactLogo),
        click: () {},
      ),
    );
  }
}
