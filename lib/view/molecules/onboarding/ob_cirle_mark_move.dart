import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';

class ObCircleMarkMove extends StatelessWidget {
  const ObCircleMarkMove({super.key, required this.state});
  final bool state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: state ? AppColors.primary : AppColors.white,
          border: Border.all(
            color: AppColors.base,
            width: AppSizes.sizeWidthBorder,
          ),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
