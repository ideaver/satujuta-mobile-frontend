import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/tokens/typography.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      required this.decoration});

  final String text;
  final VoidCallback? onPressed;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * .8,
          decoration: decoration,
          child: Center(
            child: Text(
              text,
              style: AppTypography.whiteJakartaText.copyWith(
                  fontSize: AppTypography.kFontSizeMediumLarge,
                  fontWeight: AppTypography.semiBold),
            ),
          ),
        ),
      ),
    );
  }
}
