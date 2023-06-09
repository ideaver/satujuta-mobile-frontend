import 'package:flutter/material.dart';

import '../foundations/foundation_colors.dart';
import '../foundations/foundation_typhography.dart';

class MyButtonLeft extends StatelessWidget {
  const MyButtonLeft({
    super.key,
    required this.textLeftButton,
  });

  final String textLeftButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: FoundationColor.bgPrimary.withAlpha(40),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            textLeftButton,
            style: FoundationTyphography.lightFontBold
                .copyWith(color: FoundationColor.bgSplashScreen),
          ),
        ),
      ),
    );
  }
}
