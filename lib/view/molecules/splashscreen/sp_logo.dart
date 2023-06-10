import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_asset_image.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';

class SpLogo extends StatelessWidget {
  const SpLogo({super.key, required this.widthLogo});
  final double widthLogo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyAssetImage(
        path: FoundationLinks.linkLogoSplashScreen,
        widthImage: widthLogo,
      ),
    );
  }
}
