import 'package:flutter/material.dart';

import '../../atoms/my_elevated_button.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';

class ObButtonElevated extends StatelessWidget {
  const ObButtonElevated({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
        padding: FoundationSize.sizeHeightDefault,
        text: "Mulai",
        textStyle:
            FoundationTyphography.lightFontSemibold.copyWith(letterSpacing: 1),
        onPressed: onPressed,
        buttonStyle: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                FoundationColor.btnElevatedColorOnboarding)));
  }
}
