import 'package:flutter/material.dart';

import '../../app/const/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../molecules/onboarding/ob_cirle_mark_move.dart';
import '../organisms/onboarding/ob_slide.dart';
import '../organisms/onboarding/ob_slide_close.dart';

class ObContent extends StatefulWidget {
  const ObContent({super.key});

  @override
  State<ObContent> createState() => _ObContentState();
}

class _ObContentState extends State<ObContent> {
  int pageNumber = 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
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
        ],
      ),
    );
  }

  Widget onBoardin1() {
    return ObSlide(
      context: context,
      pageNumber: pageNumber,
      pageController: _pageController,
      textTitle: 'Belajar',
      subTitle: 'Dimanapun',
      path: AppAssets.onBoardingFirstIlusPath,
      listColor: const [AppColors.lightBlue, AppColors.darkBlue],
      listMark: [
        ObCircleMarkMove(state: pageNumber == 0),
        const ObCircleMarkMove(state: false),
        const ObCircleMarkMove(state: false),
        const ObCircleMarkMove(state: false)
      ],
    );
  }

  Widget onBoardin2() {
    return ObSlide(
      context: context,
      pageNumber: pageNumber,
      pageController: _pageController,
      textTitle: 'Liburan',
      subTitle: 'Kapanpun',
      path: AppAssets.onBoardingSecondIlusPath,
      listColor: const [AppColors.lightBlue, AppColors.darkBlue],
      listMark: [
        const ObCircleMarkMove(state: false),
        ObCircleMarkMove(state: pageNumber == 1),
        const ObCircleMarkMove(state: false),
        const ObCircleMarkMove(state: false)
      ],
    );
  }

  Widget onBoardin3() {
    return ObSlide(
      context: context,
      pageNumber: pageNumber,
      pageController: _pageController,
      textTitle: 'Reward',
      subTitle: 'Keliling Dunia',
      path: AppAssets.onBoardingThirdIlusPath,
      listColor: const [AppColors.pink, AppColors.darkBlue],
      listMark: [
        const ObCircleMarkMove(state: false),
        const ObCircleMarkMove(state: false),
        ObCircleMarkMove(state: pageNumber == 2),
        const ObCircleMarkMove(state: false)
      ],
    );
  }

  Widget onBoardin4() {
    return ObSlideClose(
      context: context,
      pageNumber: pageNumber,
      pageController: _pageController,
      textTitle: 'Berbisnis',
      subTitle: 'Investasi Hasil Maksimal',
      path: AppAssets.onBoardingFourthIlusPath,
      listMark: [
        const ObCircleMarkMove(state: false),
        const ObCircleMarkMove(state: false),
        const ObCircleMarkMove(state: false),
        ObCircleMarkMove(state: pageNumber == 3),
      ],
    );
  }
}
