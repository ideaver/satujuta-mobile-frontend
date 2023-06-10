import 'package:flutter/material.dart';

import '../../atoms/my_asset_image.dart';
import '../../foundations/foundation_links.dart';

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
