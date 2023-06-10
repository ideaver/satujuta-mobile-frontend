import 'package:flutter/material.dart';

import '../../foundations/foundation_typhography.dart';

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
