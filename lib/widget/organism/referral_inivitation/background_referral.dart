import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_sizes.dart';

class BackgroudReferral extends StatelessWidget {
  const BackgroudReferral({
    Key? key,
    this.width,
    this.imgNetwork = false,
  }) : super(key: key);

  final double? width;
  final bool? imgNetwork;

  @override
  Widget build(BuildContext context) {
    final double gapImage = AppSizes.padding * 3;
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          imgNetwork == true
              ? Image.network(
                  AppAssets.shortLogoPath,
                  width: 150,
                  height: 150,
                )
              : Image.asset(
                  AppAssets.shortLogoPath,
                  width: 150,
                  height: 150,
                ),
          Positioned(
            bottom: 296,
            left: 278 + gapImage,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy1Path,
                    width: 95,
                    height: 95,
                  )
                : Image.asset(
                    AppAssets.userDummy1Path,
                    width: 95,
                    height: 95,
                  ),
          ),
          Positioned(
            top: 257,
            left: 278 + gapImage,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy2Path,
                    width: 112,
                    height: 112,
                  )
                : Image.asset(
                    AppAssets.userDummy2Path,
                    width: 112,
                    height: 112,
                  ),
          ),
          Positioned(
            bottom: 54,
            right: 255 + gapImage,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy3Path,
                    width: 70,
                    height: 70,
                  )
                : Image.asset(
                    AppAssets.userDummy3Path,
                    width: 70,
                    height: 70,
                  ),
          ),
          Positioned(
            right: 278 + gapImage,
            bottom: 285,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy4Path,
                    width: 89,
                    height: 89,
                  )
                : Image.asset(
                    AppAssets.userDummy4Path,
                    width: 89,
                    height: 89,
                  ),
          ),
          Positioned(
            bottom: 329,
            left: 183 + gapImage,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy5Path,
                    width: 36,
                    height: 36,
                  )
                : Image.asset(
                    AppAssets.userDummy5Path,
                    width: 36,
                    height: 36,
                  ),
          ),
          Positioned(
            bottom: 195,
            left: 278 + gapImage,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy6Path,
                    width: 48,
                    height: 48,
                  )
                : Image.asset(
                    AppAssets.userDummy6Path,
                    width: 48,
                    height: 48,
                  ),
          ),
          Positioned(
            bottom: 48,
            right: 107 + gapImage,
            child: imgNetwork == true
                ? Image.network(
                    AppAssets.userDummy7Path,
                    width: 48,
                    height: 48,
                  )
                : Image.asset(
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
