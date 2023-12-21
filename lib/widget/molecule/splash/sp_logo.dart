import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../atom/app_image.dart';

class SpLogo extends StatelessWidget {
  const SpLogo({
    super.key,
    required this.widthLogo,
  });

  final double widthLogo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppImage(
        image: AppAssets.shortLogoPath,
        imgProvider: ImgProvider.assetImage,
        width: widthLogo,
      ),
    );
  }
}
