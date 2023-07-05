import 'package:flutter/material.dart';

import 'package:satujuta_app_mobile/app/theme/app_text_style.dart';
import 'package:satujuta_app_mobile/app/widget/my_custom_text.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/widget/my_container_circle.dart';

class CircleUser extends StatelessWidget {
  CircleUser({
    super.key,
    required this.imageFriend1,
    required this.imageFriend2,
    required this.imageFriend3,
    required this.countFriend,
  });

  final String? imageFriend1;
  final String? imageFriend2;
  final String? imageFriend3;
  final String? countFriend;

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
            imageUrl: imageFriend1,
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
                  imageUrl: imageFriend2,
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
                  imageUrl: imageFriend3,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: MyCustomText(
                        text: '+$countFriend',
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
