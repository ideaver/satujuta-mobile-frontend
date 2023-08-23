import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppImageShortCard extends StatelessWidget {
  const AppImageShortCard({super.key, required this.text, required this.pathImage, required this.state});

  final bool state;
  final String text;
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: state ? AppColors.primary : AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(66, 181, 178, 178),
            offset: Offset(
              1,
              1,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: state
                ? Icon(
                    Icons.dashboard,
                    color: AppColors.white,
                    size: AppSizes.padding * 2,
                  )
                : Image.asset(
                    AppAssets.dashboardIconPath,
                    width: AppSizes.padding * 2,
                  ),
          ),
          Expanded(
            child: Text(
              text,
              style: state ? AppTextStyle.bold(context) : AppTextStyle.bold(context, color: AppColors.base),
            ),
          ),
        ],
      ),
    );
  }
}
