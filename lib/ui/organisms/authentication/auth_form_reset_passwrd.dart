import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';

import '../../atoms/my_form_custom.dart';

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
      child: MyFormCustom(
        lableText: "Email",
        suffixIcon: Image.asset(FoundationLinks.linkContactLogo),
        click: () {},
      ),
    );
  }
}
