import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/app_custom_text.dart';
import 'auth_list_form_register.dart';

class AuthFormDataRegister extends StatelessWidget {
  const AuthFormDataRegister({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: AppSizes.height * 5,
            ),
            Center(
              child: AppCustomText(
                text: 'Upload Foto Profile Anda',
                style: AppTextStyle.bold(
                  context,
                  color: AppColors.base,
                ).copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: AppSizes.height * 5),
                width: MediaQuery.of(context).size.width * .5,
                height: 150,
                child: Center(
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        child: Container(
                          width: AppSizes.padding * 3,
                          height: AppSizes.padding * 3,
                          decoration: BoxDecoration(
                              color: AppColors.primary, borderRadius: BorderRadius.circular(AppSizes.height * 5)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppAssets.editIconPath,
                              width: AppSizes.padding * 2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AuthListFormRegister(tabController: tabController),
          ],
        ));
  }
}
