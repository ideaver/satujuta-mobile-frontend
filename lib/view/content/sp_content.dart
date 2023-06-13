import 'package:flutter/material.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';

class SpContent extends StatelessWidget {
  const SpContent({super.key, required this.sizeQuery});

  final Size sizeQuery;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: .6,
              child: Container(
                width: sizeQuery.width * 2.6,
                height: sizeQuery.width * 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.height * 9),
                  color: AppColors.white.withAlpha(10),
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              AppAssets.shortLogoPath,
            ),
          )
        ],
      ),
    );
  }
}
