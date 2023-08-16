import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/theme/app_shadows.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';

class AppNavigationBar extends StatelessWidget {
  final int index;
  final Function(int) onTapIcon;
  final List<IconData> icons;

  const AppNavigationBar({
    super.key,
    required this.index,
    required this.onTapIcon,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding / 2,
        horizontal: AppSizes.padding / 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        boxShadow: [AppShadows.shadow4],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(
            icons.length,
            (index) => navButton(icons[index], index),
          ),
        ],
      ),
    );
  }

  Widget navButton(IconData icon, int i) {
    return InkWell(
      onTap: () {
        onTapIcon(i);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 4),
        child: CircleAvatar(
          backgroundColor: index == i ? AppColors.primary : Colors.transparent,
          radius: 20,
          child: Icon(
            icon,
            color: index == i ? AppColors.white : AppColors.base,
          ),
        ),
      ),
    );
  }
}
