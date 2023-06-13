import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atoms/my_asset_image.dart';

class ModalBottom {
  static Future<void> modalBottom(BuildContext context, ListView list) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.baseLv4,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: list,
        );
      },
    );
  }

  static Widget customRadioButton(
    BuildContext context,
    String text,
    bool statement,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.sizeHeightDefault / 2,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(
            AppSizes.sizeHeightDefault * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppTextStyle.bold(context).copyWith(
                  color: statement ? Colors.green : Colors.black,
                ),
              ),
              Container(
                width: AppSizes.sizeIconMini / 2,
                height: AppSizes.sizeIconMini / 2,
                decoration: BoxDecoration(
                  color: statement ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(
                    AppSizes.sizeHeightDefault * 5,
                  ),
                  border: Border.all(
                    color: AppColors.baseLv4,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget customRadioButtonBank(
    BuildContext context,
    String text,
    String path,
    bool statement,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      color: AppColors.baseLv4,
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.sizeHeightDefault / 2,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppColors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.sizeHeightDefault * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyAssetImage(
                    path: path,
                    widthImage: AppSizes.sizeIconMini,
                  ),
                  const SizedBox(
                    width: AppSizes.sizeHeightDefault,
                  ),
                  Text(
                    text,
                    style: AppTextStyle.bold(context).copyWith(
                      color: statement ? Colors.green : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: AppSizes.sizeIconMini / 2,
                height: AppSizes.sizeIconMini / 2,
                decoration: BoxDecoration(
                  color: statement ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(
                    AppSizes.sizeHeightDefault * 5,
                  ),
                  border: Border.all(
                    color: AppColors.baseLv4,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
