import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

class AppCardContainer extends StatelessWidget {
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const AppCardContainer({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.child,
    this.boxShadow,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius * 2),
        boxShadow: boxShadow ?? [],
        gradient: gradient,
      ),
      padding: padding ?? EdgeInsets.all(AppSizes.padding),
      margin: margin ?? EdgeInsets.all(AppSizes.padding),
      child: child,
    );
  }
}
