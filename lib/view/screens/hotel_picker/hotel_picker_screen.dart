import 'package:flutter/material.dart';

import '../../atoms/my_custom_text.dart';
import '../../atoms/my_image_short_card.dart';
import '../../atoms/my_short_card.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';
import '../../organisms/hotel_picker/content_not_ready.dart';
import '../../organisms/hotel_picker/hp_content_ready.dart';

class HotelPickerScreen extends StatefulWidget {
  const HotelPickerScreen({super.key});

  @override
  State<HotelPickerScreen> createState() => _HotelPickerScreenState();
}

class _HotelPickerScreenState extends State<HotelPickerScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoundationColor.bgColorGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: FoundationSize.sizeHeightDefault * 5,
              ),
              MyCustomText(
                text: "Pilih Hotel Menginap Anda",
                style: FoundationTyphography.darkFontBold
                    .copyWith(fontSize: FoundationTyphography.fontSizeH2),
              ),
              const SizedBox(
                height: FoundationSize.sizeHeightDefault * 3 + 4,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            i = 0;
                          },
                          child: MyImageShortCard(
                              state: i == 0,
                              text: "Semua",
                              pathImage: FoundationLinks.linkDashboardIconLogo),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = 1;
                            });
                          },
                          child: MyShortCard(state: i == 1, text: "Jakarta"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = 2;
                            });
                          },
                          child: MyShortCard(state: i == 2, text: "Bandung"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyShortCard(state: i == 3, text: "Surabaya"),
                        const SizedBox(
                          width: 10,
                        ),
                        MyShortCard(state: i == 4, text: "Yogyakarta"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: FoundationSize.sizeHeightDefault * 2 + 4,
              ),
              i == 2 ? const HpContentReady() : const ContentNotReady()
            ],
          ),
        ),
      ),
    );
  }
}
