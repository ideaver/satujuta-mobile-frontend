import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/widget/app_button.dart';
import 'package:satujuta_app_mobile/app/widget/app_image.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class HotelPicker extends StatefulWidget {
  const HotelPicker({Key? key}) : super(key: key);

  static const String routeName = '/hotel-picker';

  @override
  State<HotelPicker> createState() => _HotelPickerState();
}

class _HotelPickerState extends State<HotelPicker> {
  int selectedLocation = -1;
  int? selectedHotel;

  List<String> locations = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Bekasi',
    'Bogor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseLv7,
      body: SafeArea(
        child: Column(
          children: [
            title(),
            tabBar(),
            body(),
          ],
        ),
      ),
      bottomSheet: bottomSheet(),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding * 2),
      child: Text(
        'Pilih Hotel Menginap Anda',
        style: AppTextStyle.bold(context, fontSize: 20),
      ),
    );
  }

  Widget tabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Row(
        children: [
          tabWidget(-1),
          ...List.generate(locations.length, (i) {
            return tabWidget(i);
          })
        ],
      ),
    );
  }

  Widget tabWidget(int i) {
    return GestureDetector(
      onTap: () {
        selectedLocation = i;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSizes.padding / 2),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        decoration: BoxDecoration(
          color: selectedLocation == i ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            i == -1
                ? Padding(
                    padding: const EdgeInsets.only(right: AppSizes.padding / 2),
                    child: Icon(
                      Icons.dashboard_outlined,
                      size: 16,
                      color: selectedLocation == -1
                          ? AppColors.white
                          : AppColors.base,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              i == -1 ? 'Semua' : locations[i],
              style: AppTextStyle.semiBold(
                context,
                color: selectedLocation == i ? AppColors.white : AppColors.base,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    if (selectedLocation == 0) {
      return notFoundWidget();
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.padding),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          padding: const EdgeInsets.all(AppSizes.padding),
          itemBuilder: (context, i) {
            return hotelCard(i);
          },
        ),
      ),
    );
  }

  Widget hotelCard(int i) {
    return Opacity(
      opacity: selectedHotel == null || selectedHotel == i ? 1 : 0.5,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSizes.padding),
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(4, 4),
              blurRadius: 22,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Bandung, Jawa Barat',
                      style: AppTextStyle.regular(context, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kuota',
                      style: AppTextStyle.regular(context, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '03/10',
                      style: AppTextStyle.bold(context, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: AppSizes.padding),
            AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                child: const AppImage(
                  image: randomImage,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              'Grand Cordela Hotel Bandung',
              style: AppTextStyle.bold(context, fontSize: 16),
            ),
            const SizedBox(height: AppSizes.padding),
            Row(
              children: [
                ...List.generate(5, (index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  );
                })
              ],
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              'If each interior angle is doubled of each exterior angle of a regular polygon with n sides, then the value of n is:',
              style: AppTextStyle.regular(context, fontSize: 14),
            ),
            const SizedBox(height: AppSizes.padding),
            AppButton(
              onTap: () {
                // TODO
                if (selectedHotel == null) {
                  selectedHotel = i;
                } else {
                  selectedHotel = null;
                }
                setState(() {});
              },
              enable: selectedHotel == null || selectedHotel == i,
              text: selectedHotel == null || selectedHotel != i
                  ? 'Pilih'
                  : 'Anda memilih ini',
              leftIcon: selectedHotel == null || selectedHotel != i
                  ? null
                  : Icons.check_circle,
              buttonColor: selectedHotel == null
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget notFoundWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.emptyEmojiPath,
              height: 172,
            ),
            const SizedBox(
              height: AppSizes.padding,
            ),
            Text(
              "Maaf, belum ada hotel di kota ini.",
              textAlign: TextAlign.center,
              style: AppTextStyle.bold(
                context,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Text(
              "Kami akan segera menambahkan daftar hotel yang kamu inginkan",
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                context,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    if (selectedHotel == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radius * 2),
          topRight: Radius.circular(AppSizes.radius * 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -4),
            blurRadius: 22,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grand Cordela Hotel Bandung',
            style: AppTextStyle.bold(context, fontSize: 16),
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            children: [
              const Icon(
                Icons.timelapse_outlined,
                size: 12,
                color: AppColors.baseLv4,
              ),
              const SizedBox(width: 4),
              Text(
                'Perkiraan check-in menginap',
                style: AppTextStyle.medium(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            'Medi 2023 - Juli 2023',
            style: AppTextStyle.bold(context, fontSize: 14),
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            text: 'Berikutnya',
            onTap: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }
}
