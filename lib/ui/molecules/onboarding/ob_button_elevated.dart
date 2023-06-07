import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_elevated_button.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

class ObButtonElevated extends StatelessWidget {
  const ObButtonElevated({super.key});

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
        padding: FoundationSize.sizeHeightDefault,
        text: "Mulai",
        textStyle:
            FoundationTyphography.lightFontSemibold.copyWith(letterSpacing: 1),
        onPressed: () {},
        buttonStyle: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                FoundationColor.btnElevatedColorOnboarding)));
  }
}
