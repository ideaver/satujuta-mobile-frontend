import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/const/app_assets.dart';
import 'package:satujuta_app_mobile/app/theme/app_text_style.dart';
import 'package:satujuta_app_mobile/app/widget/my_custom_text.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/widget/my_container_circle.dart';

class CircleUser extends StatelessWidget {
  const CircleUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          MyContainerCircle(
            size: 30,
            color: Colors.amber,
            border: Border.all(
              width: 2,
              color: AppColors.white,
            ),
            imageUrl: AppAssets.userImage1Path,
          ),
          Positioned(
            right: 20,
            child: Stack(
              children: [
                MyContainerCircle(
                  size: 30,
                  color: Colors.amber,
                  border: Border.all(
                    width: 2,
                    color: AppColors.white,
                  ),
                  imageUrl: AppAssets.userImage2Path,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Stack(
              children: [
                MyContainerCircle(
                  size: 30,
                  color: Colors.red,
                  border: Border.all(
                    width: 2,
                    color: AppColors.white,
                  ),
                  imageUrl: AppAssets.userImage3Path,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: MyCustomText(
                        text: '+9',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 12,
                          color: AppColors.white,
                        )),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(127, 0, 0, 0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
