import 'package:flutter/material.dart';

import '../../app/theme/app_sizes.dart';
import 'app_image.dart';

class AppIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String? imgIcon;
  final double? imgIconSize;
  final double? iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsets padding;

  const AppIconButton({
    super.key,
    this.onPressed,
    this.icon,
    this.imgIcon,
    this.imgIconSize,
    this.iconSize,
    this.iconColor,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: icon != null
            ? Icon(
                icon,
                size: iconSize ?? AppSizes.icon,
                color: iconColor,
              )
            : AppImage(
                image: imgIcon ?? '',
                width: imgIconSize ?? AppSizes.icon,
              ),
      ),
    );
  }
}
