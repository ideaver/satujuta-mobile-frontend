import 'package:flutter/material.dart';

import '../../../app/theme/app_sizes.dart';
import '../../molecule/hotel_picker/hp_card_picker.dart';

class HpContentReady extends StatefulWidget {
  const HpContentReady({super.key});

  @override
  State<HpContentReady> createState() => _ContentIsReadyState();
}

class _ContentIsReadyState extends State<HpContentReady> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.height * 2 + 2,
        right: AppSizes.height * 2 + 2,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 5,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
          children: [
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
            HpCardPicker(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
