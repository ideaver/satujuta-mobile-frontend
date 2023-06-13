import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atoms/my_elevated_button.dart';
import '../../organisms/onboarding/ob_button_authentication.dart';
import 'onboarding_title.dart';

class ObSlide extends StatelessWidget {
  const ObSlide(
      {super.key,
      required this.context,
      required this.pageNumber,
      required this.pageController,
      required this.textTitle,
      required this.subTitle,
      required this.path,
      required this.listMark,
      required this.listColor});

  final BuildContext context;
  final int pageNumber;
  final PageController pageController;
  final String textTitle;
  final String subTitle;
  final String path;
  final List<Widget> listMark;
  final List<Color> listColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: MediaQuery.of(context).padding.top + 30,
          bottom: MediaQuery.of(context).padding.bottom + 1),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: listMark,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 35,
                  child: MyElevatedButton(
                      padding: 0,
                      text: "Lewati",
                      textStyle: AppTextStyle.medium(
                        context,
                        color: AppColors.base,
                      ),
                      buttonStyle: const ButtonStyle(),
                      onPressed: () {
                        pageController.jumpToPage(3);
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: OnBoardingTitle(
              textTitle: textTitle,
              textSubTitle: subTitle,
              listColor: listColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              path,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const ObButtonAuthentication()
        ],
      ),
    );
  }
}
