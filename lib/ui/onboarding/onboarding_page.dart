import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/constant.dart';
import 'package:satujuta_app_mobile/shared/link_images_utils.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
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
                print(value);
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circleMarkMoveOnBoarding(pageNumber == 0),
                        circleMarkMoveOnBoarding(false),
                        circleMarkMoveOnBoarding(false),
                        circleMarkMoveOnBoarding(false)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 35,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Lewati",
                          style: darkJakartaText.copyWith(fontWeight: semiBold),
                        )))
              ],
            ),
          ),
          const Expanded(
            child: OnBoardingTitle(
              textTitle: 'Belajar',
              textSubTitle: 'Dimanapun',
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              LinkImageUtils.onBoardingFirstIlusUrl,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ButtonAuthentication(context: context)
        ],
      ),
    );
  }

  Container circleMarkMoveOnBoarding(bool state) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: state ? kColorPrimary : kColorWhite,
          border: Border.all(
            color: kColorBase,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50)),
    );
  }

  Widget onBoardin2() {
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circleMarkMoveOnBoarding(false),
                        circleMarkMoveOnBoarding(pageNumber == 1),
                        circleMarkMoveOnBoarding(false),
                        circleMarkMoveOnBoarding(false)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 35,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Lewati",
                          style: darkJakartaText.copyWith(fontWeight: semiBold),
                        )))
              ],
            ),
          ),
          Expanded(
            child: OnBoardingTitle(
              textTitle: 'Liburan',
              textSubTitle: 'Kapanpun',
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              LinkImageUtils.onBoardingSecondIlusUrl,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ButtonAuthentication(context: context),
        ],
      ),
    );
  }

  Widget onBoardin3() {
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circleMarkMoveOnBoarding(false),
                        circleMarkMoveOnBoarding(false),
                        circleMarkMoveOnBoarding(pageNumber == 2),
                        circleMarkMoveOnBoarding(false)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 35,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Lewati",
                          style: darkJakartaText.copyWith(fontWeight: semiBold),
                        )))
              ],
            ),
          ),
          Expanded(
            child: const OnBoardingTitle(
                textTitle: 'Reward', textSubTitle: 'Keliling Dunia'),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              LinkImageUtils.onBoardingThirdIlusUrl,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ButtonAuthentication(context: context)
        ],
      ),
    );
  }

  Widget onBoardin4() {
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
                  children: [
                    circleMarkMoveOnBoarding(false),
                    circleMarkMoveOnBoarding(false),
                    circleMarkMoveOnBoarding(false),
                    circleMarkMoveOnBoarding(pageNumber == 3),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: OnBoardingTitle(
                textTitle: 'Berbisnis',
                textSubTitle: 'Investasi Hasil Maksimal'),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              LinkImageUtils.onBoardingFourthIlusUrl,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  height: 50,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(kColorPrimary)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bergabung Sekarang",
                          style: whiteJakartaText.copyWith(
                              fontWeight: bold,
                              letterSpacing: 1,
                              fontSize: kFontSizeMediumLarge),
                        ),
                      )),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: darkJakartaText.copyWith(fontWeight: bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
  });
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [kColorBlueDark, kColorBlueLight],
          ).createShader(bounds),
          child: Text(
            textTitle,
            style: whiteJakartaText.copyWith(fontSize: 48, fontWeight: bold),
          ),
        ),
        Text(
          textSubTitle,
          style: darkJakartaText.copyWith(fontSize: 32, fontWeight: bold),
        ),
      ],
    );
  }
}

class ButtonAuthentication extends StatelessWidget {
  const ButtonAuthentication({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            height: 50,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kColorBase)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Mulai",
                    style: whiteJakartaText.copyWith(
                        fontWeight: semiBold, letterSpacing: 1),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: darkJakartaText.copyWith(fontWeight: bold),
              ))
        ],
      ),
    );
  }
}
