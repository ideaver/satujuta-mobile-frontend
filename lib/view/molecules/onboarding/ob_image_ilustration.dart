import 'package:flutter/material.dart';

import '../../atoms/my_asset_image.dart';
import '../../foundations/foundation_links.dart';

class ObImageIlustration extends StatelessWidget {
  const ObImageIlustration({super.key, required this.sizeWidth});
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return MyAssetImage(
        path: FoundationLinks.linkOnBoardingFirst, widthImage: sizeWidth);
  }
}
