import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final double borderRadius;
  final EdgeInsets padding;
  final bool enable;
  final Color buttonColor;
  final Color disabledButtonColor;
  final Color disabledTextColor;
  final Color textColor;
  final String text;
  final Function() onTap;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? child;

  const AppButton({
    super.key,
    this.width,
    this.height = 48,
    this.fontSize,
    this.borderRadius = 100,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
    this.enable = true,
    this.buttonColor = AppColors.primary,
    this.disabledButtonColor = AppColors.baseLv2,
    this.disabledTextColor = Colors.white,
    this.textColor = Colors.white,
    this.leftIcon,
    this.rightIcon,
    this.child,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: enable ? onTap : null,
        splashColor: Colors.black.withOpacity(0.06),
        splashFactory: InkRipple.splashFactory,
        highlightColor: enable ? Colors.black12 : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: enable ? buttonColor : disabledButtonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child ??
              Center(
                child: Row(
                  children: [
                    leftIconWidget(),
                    textWidget(context),
                    rightIconWidget(),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  Widget textWidget(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.bold(
        context,
        fontSize: fontSize ?? (height != null ? height! / 3 : 12),
        color: enable ? textColor : disabledTextColor,
      ),
    );
  }

  Widget leftIconWidget() {
    if (leftIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: Icon(
        leftIcon,
        color: enable ? textColor : disabledTextColor,
      ),
    );
  }

  Widget rightIconWidget() {
    if (rightIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: Icon(
        rightIcon,
        color: enable ? textColor : disabledTextColor,
      ),
    );
  }
}
