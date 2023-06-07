import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

class ObTextButton extends StatelessWidget {
  const ObTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Login",
          style: FoundationTyphography.darkFontBold,
        ));
  }
}
