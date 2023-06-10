import 'package:flutter/material.dart';

import '../foundations/foundation_colors.dart';
import '../foundations/foundation_links.dart';
import '../foundations/foundation_size.dart';

class SpContent extends StatelessWidget {
  const SpContent({super.key, required this.sizeQuery});

  final Size sizeQuery;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FoundationColor.bgSplashScreen,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: .6,
              child: Container(
                width: sizeQuery.width * 2.6,
                height: sizeQuery.width * 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      FoundationSize.sizeHeightDefault * 9),
                  color: FoundationColor.bgRectangleSplashScreen,
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              FoundationLinks.linkLogoSplashScreen,
            ),
          )
        ],
      ),
    );
  }
}
