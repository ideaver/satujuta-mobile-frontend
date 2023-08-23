import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_style.dart';
import '../login/login_view.dart';
import '../register/register_view.dart';
import 'components/ob_slide.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const String routeName = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int pageIndex = 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topWidgets(),
            Expanded(
              child: PageView(
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                children: [
                  onBoardin1(),
                  onBoardin2(),
                  onBoardin3(),
                  onBoardin4(),
                ],
              ),
            ),
            bottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget topWidgets() {
    return Container(
      width: double.infinity,
      height: 32,
      margin: const EdgeInsets.only(top: 42),
      child: Stack(
        alignment: Alignment.center,
        children: [
          skipButton(),
          slideIndicator(),
        ],
      ),
    );
  }

  Widget slideIndicator() {
    return Wrap(
      spacing: 14,
      children: [
        ...List.generate(4, (i) {
          return Container(
            width: 14,
            height: 14,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: pageIndex == i ? AppColors.primary : AppColors.baseLv4,
              ),
            ),
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: pageIndex == i ? AppColors.primary : AppColors.white,
              ),
            ),
          );
        })
      ],
    );
  }

  Widget bottomButtons() {
    return Column(
      children: [
        pageIndex == 3 ? joinButton() : nextButton(),
        const SizedBox(height: 22),
        loginButton(),
        const SizedBox(height: 42),
      ],
    );
  }

  Widget skipButton() {
    if (pageIndex == 3) {
      return const SizedBox.shrink();
    }

    return Positioned(
      right: 22,
      child: InkWell(
        onTap: (() {
          _pageController.animateToPage(
            3,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
          );
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.baseLv7,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            "Lewati",
            style: AppTextStyle.bold(
              context,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return InkWell(
      onTap: (() {
        _pageController.animateToPage(
          pageIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
      }),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.base,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Center(
            child: Text(
              "Selanjutnya",
              style: AppTextStyle.bold(
                context,
                fontSize: 12,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget joinButton() {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, RegisterView.routeName);
      }),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Center(
            child: Text(
              "Bergabung Sekarang",
              style: AppTextStyle.bold(
                context,
                fontSize: 12,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, LoginView.routeName);
      },
      child: Text(
        "Login",
        style: AppTextStyle.bold(context, fontSize: 12),
      ),
    );
  }

  Widget onBoardin1() {
    return const ObSlide(
      textTitle: 'Belajar',
      subTitle: 'Dimanapun',
      path: AppAssets.onBoardingFirstIlusPath,
      listColor: [
        AppColors.lightBlue,
        AppColors.darkBlue,
      ],
    );
  }

  Widget onBoardin2() {
    return const ObSlide(
      textTitle: 'Liburan',
      subTitle: 'Kapanpun',
      path: AppAssets.onBoardingSecondIlusPath,
      listColor: [
        AppColors.lightBlue,
        AppColors.darkBlue,
      ],
    );
  }

  Widget onBoardin3() {
    return const ObSlide(
      textTitle: 'Reward',
      subTitle: 'Keliling Dunia',
      path: AppAssets.onBoardingThirdIlusPath,
      listColor: [
        AppColors.pink,
        AppColors.darkBlue,
      ],
    );
  }

  Widget onBoardin4() {
    return const ObSlide(
      textTitle: 'Berbisnis',
      subTitle: 'Investasi Hasil Maksimal',
      path: AppAssets.onBoardingFourthIlusPath,
      listColor: [
        AppColors.pink,
        AppColors.darkBlue,
      ],
    );
  }
}
