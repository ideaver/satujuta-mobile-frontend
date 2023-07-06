import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/const/app_sizes.dart';

import '../../../app/const/app_assets.dart';

class BackgroudReferral extends StatelessWidget {
  final double gapImage = AppSizes.padding * 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets.shortLogoPath,
            width: 150,
            height: 150,
          ),
          Positioned(
            bottom: 296,
            left: 278 + gapImage,
            child: Image.asset(
              AppAssets.userDummy1Path,
              width: 95,
              height: 95,
            ),
          ),
          Positioned(
            top: 257,
            left: 278 + gapImage,
            child: Image.asset(
              AppAssets.userDummy2Path,
              width: 112,
              height: 112,
            ),
          ),
          Positioned(
            bottom: 54,
            right: 255 + gapImage,
            child: Image.asset(
              AppAssets.userDummy3Path,
              width: 70,
              height: 70,
            ),
          ),
          Positioned(
            right: 278 + gapImage,
            bottom: 285,
            child: Image.asset(
              AppAssets.userDummy4Path,
              width: 89,
              height: 89,
            ),
          ),
          Positioned(
            bottom: 329,
            left: 183 + gapImage,
            child: Image.asset(
              AppAssets.userDummy5Path,
              width: 36,
              height: 36,
            ),
          ),
          Positioned(
            bottom: 195,
            left: 278 + gapImage,
            child: Image.asset(
              AppAssets.userDummy6Path,
              width: 48,
              height: 48,
            ),
          ),
          Positioned(
            bottom: 48,
            right: 107 + gapImage,
            child: Image.asset(
              AppAssets.userDummy7Path,
              width: 48,
              height: 48,
            ),
          )
        ],
      ),
    );
  }
}
