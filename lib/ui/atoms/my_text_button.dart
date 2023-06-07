import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/tokens/typography.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: AppTypography.darkJakartaText
              .copyWith(fontWeight: AppTypography.bold),
        ));
  }
}
