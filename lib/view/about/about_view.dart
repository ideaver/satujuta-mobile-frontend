import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../widget/atom/app_icon_button.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  static const String routeName = '/about';

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: AppIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_rounded,
            iconColor: AppColors.base,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: .6,
                child: Container(
                  width: size.width * 2.6,
                  height: size.width * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.white.withAlpha(10),
                  ),
                ),
              ),
            ),
            Center(
                child: Container(
              width: size.width - AppSizes.padding * 4,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About App',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 32,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: AppSizes.height),
                      Text(
                        'Last Updated 21/03/2023',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: AppSizes.height),
                      AppButton(
                        width: 200,
                        text: 'Update Sekarang',
                        onTap: () {},
                        fontSize: 12,
                        textColor: AppColors.yellow,
                        buttonColor: Colors.transparent,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.padding * 2,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                    padding: const EdgeInsets.all(
                      AppSizes.padding,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius * 3),
                      color: AppColors.base.withOpacity(0.12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.shortLogoPath,
                          scale: 3,
                        ),
                        const SizedBox(
                          width: AppSizes.padding,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SatuJuta App',
                              style: AppTextStyle.bold(
                                context,
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: AppSizes.height / 2),
                            Text(
                              'v2 1.0 (12345)',
                              style: AppTextStyle.regular(
                                context,
                                fontSize: 13,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.padding * 4),
                  Image.asset(
                    AppAssets.emojiHappyIlus2Path,
                    scale: 3,
                  ),
                  const SizedBox(height: AppSizes.padding * 6),
                  Text(
                    'Build With Love By\nWWW.DSAAGROUP.COM',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.medium(
                      context,
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppSizes.padding * 6),
                  AppButton(
                    text: 'Visit Developer',
                    onTap: () {},
                    width: 200,
                    buttonColor: Colors.white.withOpacity(0.3),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
