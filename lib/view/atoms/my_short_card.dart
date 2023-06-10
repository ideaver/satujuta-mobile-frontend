import 'package:flutter/material.dart';

import '../foundations/foundation_colors.dart';
import '../foundations/foundation_typhography.dart';

class MyShortCard extends StatelessWidget {
  const MyShortCard({super.key, required this.state, required this.text});
  final bool state;
  final String text;
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
        children: [
          Text(
            text,
            style: state
                ? FoundationTyphography.lightFontBold
                : FoundationTyphography.darkFontBold,
          ),
        ],
      ),
    );
  }
}
