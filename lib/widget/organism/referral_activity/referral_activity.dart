import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/app_icon_button.dart';

class ReferralActivity extends StatelessWidget {
  final String? timeText;
  final String? activityText;
  final String? descriptionText;
  final String? imageUser;
  final IconData? iconUser;
  final Color? activityTextColor;

  final Color? backgroundColorIcon;
  final void Function()? onTapButton;
  final void Function()? onTapCard;

  const ReferralActivity({
    Key? key,
    this.activityText,
    this.descriptionText,
    this.iconUser,
    this.imageUser,
    this.onTapButton,
    this.onTapCard,
    this.timeText,
    this.backgroundColorIcon,
    this.activityTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 45,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUser ?? '',
                  ),
                  maxRadius: 17,
                  minRadius: 17,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    child: Icon(
                      iconUser ?? Icons.person,
                      color: AppColors.white,
                      size: 14,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColorIcon ?? AppColors.red,
                        border: Border.all(
                          color: AppColors.white,
                          width: 2,
                        )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.padding / 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeText ?? '',
                          style: AppTextStyle.regular(
                            context,
                            fontSize: 10,
                            color: AppColors.baseLv4,
                          ),
                        ),
                        Text(
                          activityText ?? '',
                          style: AppTextStyle.extraBold(
                            context,
                            fontSize: 14,
                            color: activityTextColor ?? AppColors.base,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    AppIconButton(
                      icon: Icons.arrow_forward_outlined,
                      backgroundColor: AppColors.baseLv7,
                      iconSize: 14,
                      padding: const EdgeInsets.all(AppSizes.padding / 2),
                      onPressed: () {
                        // TODO
                      },
                    )
                  ],
                ),
                const SizedBox(height: AppSizes.padding / 4),
                Text(
                  descriptionText ?? '',
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.regular(
                    context,
                    fontSize: 16,
                    color: AppColors.baseLv4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
