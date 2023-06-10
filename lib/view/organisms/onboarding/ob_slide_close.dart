import 'package:flutter/material.dart';

import '../../atoms/my_custom_button.dart';
import '../../foundations/foundation_typhography.dart';
import '../../ui.dart';
import 'onboarding_title_final.dart';

class ObSlideClose extends StatelessWidget {
  const ObSlideClose(
      {super.key,
      required this.context,
      required this.pageNumber,
      required this.pageController,
      required this.textTitle,
      required this.subTitle,
      required this.path,
      required this.listMark});

  final BuildContext context;
  final int pageNumber;
  final PageController pageController;
  final String textTitle;
  final String subTitle;
  final String path;
  final List<Widget> listMark;
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
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listMark,
                ),
              ),
            ),
          ),
          const Expanded(
            child: OnBoardingTitleFinal(
                textTitle: 'Berbisnis',
                textSubTitle: 'Investasi Hasil Maksimal'),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              path,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        )),
                    child: MyCustomButton(
                      text: "Bergabung sekarang",
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      )),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      // style: const ButtonStyle(
                      //     backgroundColor: MaterialStatePropertyAll(
                      //         FoundationColor.bgColorBtnGetstarted)),
                      // onPressed: () {},
                      // child: Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: FoundationSize.sizeLeftPadding),
                      //   child: Text(
                      //     "Bergabung Sekarang",
                      //     textAlign: TextAlign.center,
                      //     style: FoundationTyphography.lightFontBold.copyWith(
                      //         letterSpacing: .5,
                      //         fontSize: AppTypography.kFontSizeMediumLarge),
                      //   ),
                      // )
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: FoundationTyphography.darkFontBold,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
