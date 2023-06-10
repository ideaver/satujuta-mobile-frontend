import 'package:flutter/material.dart';

import '../foundations/foundation_colors.dart';
import '../foundations/foundation_links.dart';
import '../foundations/foundation_size.dart';
import '../foundations/foundation_typhography.dart';

class MyImageShortCard extends StatelessWidget {
  const MyImageShortCard(
      {super.key,
      required this.text,
      required this.pathImage,
      required this.state});

  final bool state;
  final String text;
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: state ? FoundationColor.bgPrimary : FoundationColor.bgWhite,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(66, 181, 178, 178),
            offset: Offset(
              1,
              1,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: state
                ? Icon(
                    Icons.dashboard,
                    color: FoundationColor.bgWhite,
                    size: FoundationSize.sizeIconMini,
                  )
                : Image.asset(
                    FoundationLinks.linkDashboardIconLogo,
                    width: FoundationSize.sizeIconMini,
                  ),
          ),
          Expanded(
            child: Text(
              text,
              style: state
                  ? FoundationTyphography.lightFontBold
                  : FoundationTyphography.darkFontBold,
            ),
          ),
        ],
      ),
    );
  }
}
