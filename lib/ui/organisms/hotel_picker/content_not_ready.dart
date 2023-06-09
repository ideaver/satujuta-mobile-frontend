import 'package:flutter/material.dart';

import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';

class ContentNotReady extends StatelessWidget {
  const ContentNotReady({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.all(FoundationSize.sizePadding * 2),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(FoundationLinks.linkEmptyEmoji),
            const SizedBox(
              height: FoundationSize.sizeHeightDefault * 5,
            ),
            Text(
              "Maaf, belum ada hotel di kota ini.",
              style: FoundationTyphography.darkFontBold
                  .copyWith(fontSize: FoundationTyphography.fontSizeH3),
            ),
            const SizedBox(
              height: FoundationSize.sizePadding,
            ),
            Text(
              "Kami akan segera menambahkan daftar hotel yang kamu inginkan",
              textAlign: TextAlign.center,
              style: FoundationTyphography.darkFontRegular
                  .copyWith(fontSize: FoundationTyphography.fontSizeH4),
            )
          ],
        ),
      ),
    );
  }
}
