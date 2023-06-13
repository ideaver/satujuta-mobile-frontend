import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../atoms/my_asset_image.dart';

class ObImageIlustration extends StatelessWidget {
  const ObImageIlustration({super.key, required this.sizeWidth});
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return MyAssetImage(
      path: AppAssets.onBoardingFirstIlusPath,
      widthImage: sizeWidth,
    );
  }
}
