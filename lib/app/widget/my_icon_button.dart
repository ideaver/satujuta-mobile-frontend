import 'package:flutter/material.dart';

import '../const/app_sizes.dart';
import 'my_asset_image.dart';

class AppIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String? imgIcon;
  final double? imgIconSize;
  final double? iconSize;
  final Color? iconColor;

  const AppIconButton({
    super.key,
    this.onPressed,
    this.icon,
    this.imgIcon,
    this.imgIconSize,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () {},
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      icon: icon != null
          ? Icon(
              icon,
              size: iconSize ?? AppSizes.icon,
              color: iconColor,
            )
          : MyAssetImage(
              path: imgIcon ?? '',
              widthImage: imgIconSize ?? AppSizes.icon,
            ),
    );
  }
}
