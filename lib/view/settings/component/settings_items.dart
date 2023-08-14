import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';

class SettingItem extends StatefulWidget {
  SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.rightButton,
    this.subTitle,
    required this.functionButton,
  });

  final IconData? icon;
  final String? title;
  final String? subTitle;
  final Widget? rightButton;
  final dynamic functionButton;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.functionButton,
      splashColor: Colors.black.withOpacity(0.06),
      borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      child: Ink(
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.icon!,
                    color: AppColors.base,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppSizes.padding / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title!,
                      style: AppTextStyle.bold(
                        context,
                      ),
                    ),
                    widget.subTitle == null
                        ? SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(top: AppSizes.height / 2),
                            child: Text(
                              widget.subTitle!,
                              style: AppTextStyle.regular(
                                context,
                                fontSize: 12,
                                color: AppColors.baseLv5,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
            widget.rightButton!,
          ],
        ),
      ),
    );
  }
}
