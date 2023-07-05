import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/widget/my_container_circle.dart';

class CircleUser extends StatelessWidget {
  const CircleUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Stack(
        children: [
          MyContainerCircle(
            size: 40,
            color: Colors.amber,
            border: Border.all(
              width: 4,
              color: AppColors.white,
            ),
          ),
          Positioned(
            right: 0,
            child: Stack(
              children: [
                MyContainerCircle(
                  size: 40,
                  color: Colors.amber,
                  border: Border.all(
                    width: 4,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            child: MyContainerCircle(
              size: 40,
              color: Colors.amber,
              border: Border.all(
                width: 4,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
