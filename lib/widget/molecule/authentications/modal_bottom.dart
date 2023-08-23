import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/app_image.dart';

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
        vertical: AppSizes.height / 2,
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
            AppSizes.height * 2,
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
                width: AppSizes.padding * 2 / 2,
                height: AppSizes.padding * 2 / 2,
                decoration: BoxDecoration(
                  color: statement ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(
                    AppSizes.height * 5,
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
        vertical: AppSizes.height / 2,
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
            AppSizes.height * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppImage(
                    image: path,
                    imgProvider: ImgProvider.assetImage,
                    width: AppSizes.padding * 2,
                  ),
                  const SizedBox(
                    width: AppSizes.height,
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
                width: AppSizes.padding * 2 / 2,
                height: AppSizes.padding * 2 / 2,
                decoration: BoxDecoration(
                  color: statement ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(
                    AppSizes.height * 5,
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
