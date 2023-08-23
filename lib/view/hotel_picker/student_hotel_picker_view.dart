import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';
import '../student/student_registration_view.dart';

class StudentHotelPickerView extends StatefulWidget {
  const StudentHotelPickerView({Key? key}) : super(key: key);

  static const String routeName = '/student-hotel-picker';

  @override
  State<StudentHotelPickerView> createState() => _StudentHotelPickerViewState();
}

class _StudentHotelPickerViewState extends State<StudentHotelPickerView> {
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
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            sliverAppBarWidget(),
          ];
        },
        body: body(),
      ),
      bottomSheet: bottomSheet(),
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 170,
      pinned: true,
      backgroundColor: AppColors.baseLv7,
      elevation: 0.5,
      flexibleSpace: FlexibleSpaceBar(
        title: title(),
        expandedTitleScale: 1.5,
      ),
      bottom: tabBar(),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 3),
      child: Text(
        'Pilih Hotel Menginap Siswa',
        style: AppTextStyle.bold(context, fontSize: 14),
      ),
    );
  }

  PreferredSizeWidget tabBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.padding,
        ),
        child: Row(
          children: [
            tabWidget(-1),
            ...List.generate(locations.length, (i) {
              return tabWidget(i);
            })
          ],
        ),
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
                      color: selectedLocation == -1 ? AppColors.white : AppColors.base,
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
      return AppNotFoundWidget(
        title: 'Maaf, Belum Ada Hotel Di Lokasi Ini',
        subtitle: "Kami akan segera menambahkan daftar hotel yang kamu inginkan",
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.padding),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.all(AppSizes.padding),
        itemBuilder: (context, i) {
          return hotelCard(i);
        },
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
              text: selectedHotel == null || selectedHotel != i ? 'Pilih' : 'Anda memilih ini',
              leftIcon: selectedHotel == null || selectedHotel != i ? null : Icons.check_circle,
              buttonColor: selectedHotel == null ? AppColors.primary : AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: selectedHotel == null
          ? const SizedBox.shrink()
          : Container(
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
                      Navigator.pushNamed(
                        context,
                        StudentRegistrationView.routeName,
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
