import 'package:flutter/material.dart';

import 'ob_title.dart';

class ObSlide extends StatelessWidget {
  final BuildContext context;
  final int pageIndex;
  final PageController pageController;
  final String textTitle;
  final String subTitle;
  final String path;
  final List<Color> listColor;

  const ObSlide({
    super.key,
    required this.context,
    required this.pageIndex,
    required this.pageController,
    required this.textTitle,
    required this.subTitle,
    required this.path,
    required this.listColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          ObTitle(
            textTitle: textTitle,
            textSubTitle: subTitle,
            listColor: listColor,
          ),
          Expanded(
            child: Image.asset(
              path,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
