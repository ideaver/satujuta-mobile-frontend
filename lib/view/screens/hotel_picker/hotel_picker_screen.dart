import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/my_custom_text.dart';
import '../../../app/widget/my_image_short_card.dart';
import '../../../app/widget/my_short_card.dart';
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
      backgroundColor: AppColors.baseLv4,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: AppSizes.height * 5,
              ),
              MyCustomText(
                text: "Pilih Hotel Menginap Anda",
                style: AppTextStyle.bold(
                  context,
                  color: AppColors.base,
                ).copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: AppSizes.height * 3 + 4,
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
                              pathImage: AppAssets.dashboardIconPath),
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
                height: AppSizes.height * 2 + 4,
              ),
              i == 2 ? const HpContentReady() : const ContentNotReady()
            ],
          ),
        ),
      ),
    );
  }
}
