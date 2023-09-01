import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/date_formatter.dart';
import '../../view_model/hotel_picker_view_model.dart';
import '../../widget/atom/app_progress_indicator.dart';

class HotelPicker extends StatefulWidget {
  final String title;

  const HotelPicker({
    super.key,
    required this.title,
  });

  static const String userHotelRouteName = '/hotel-picker';
  static const String studentHotelRouteName = '/student-hotel-picker';

  const HotelPicker.user({
    super.key,
    this.title = "Pilih Hotel Menginap Anda",
  });

  const HotelPicker.student({
    super.key,
    this.title = "Pilih Hotel Menginap Siswa",
  });

  @override
  State<HotelPicker> createState() => _HotelPickerState();
}

class _HotelPickerState extends State<HotelPicker> {
  final hotelPickerViewModel = locator<HotelPickerViewModel>();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final provinceId = ModalRoute.of(context)?.settings.arguments as int?;

    hotelPickerViewModel.initHotelPicker(navigator, provinceId);

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

  Widget sliverAppBarWidget() {
    return Consumer<HotelPickerViewModel>(builder: (context, model, _) {
      return SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: model.cityFindMany == null || model.cityFindMany!.isEmpty ? 62 : 170,
        pinned: true,
        backgroundColor: AppColors.baseLv7,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.baseLv7,
        ),
        elevation: 0.5,
        flexibleSpace: FlexibleSpaceBar(
          title: title(model),
          expandedTitleScale: 1.5,
        ),
        bottom: model.cityFindMany == null || model.cityFindMany!.isEmpty ? null : tabBar(),
      );
    });
  }

  Widget title(HotelPickerViewModel model) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: model.cityFindMany == null || model.cityFindMany!.isEmpty ? 0 : AppSizes.padding * 4,
      ),
      child: Text(
        widget.title,
        style: AppTextStyle.bold(context, fontSize: 14),
      ),
    );
  }

  PreferredSizeWidget tabBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: Consumer<HotelPickerViewModel>(builder: (context, model, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.padding,
            vertical: AppSizes.padding,
          ),
          child: Row(
            children: [
              tabWidget(model, -1),
              ...List.generate(model.cityFindMany!.length, (i) {
                return tabWidget(model, i);
              })
            ],
          ),
        );
      }),
    );
  }

  Widget tabWidget(HotelPickerViewModel model, int i) {
    return GestureDetector(
      onTap: () async {
        final navigator = Navigator.of(context);

        if (i >= 0) {
          model.onSelectCity(navigator, model.cityFindMany![i], i);
        } else {
          model.onSelectCity(navigator, null, i);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSizes.padding / 2),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        decoration: BoxDecoration(
          color: model.selectedTabIndex == i ? AppColors.primary : AppColors.white,
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
                      color: model.selectedTabIndex == -1 ? AppColors.white : AppColors.base,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              i == -1 ? 'Semua' : model.cityFindMany![i].name,
              style: AppTextStyle.semiBold(
                context,
                color: model.selectedTabIndex == i ? AppColors.white : AppColors.base,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Consumer<HotelPickerViewModel>(builder: (context, model, _) {
      if (model.hotelFindMany == null) {
        return const AppProgressIndicator();
      }

      if (model.hotelFindMany!.isEmpty) {
        return const AppNotFoundWidget(
          title: 'Maaf, Belum Ada Hotel Di Lokasi Ini',
          subtitle: "Kami akan segera menambahkan daftar hotel yang kamu inginkan",
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        itemCount: model.hotelFindMany!.length,
        padding: const EdgeInsets.all(AppSizes.padding),
        itemBuilder: (context, i) {
          return hotelCard(model, i);
        },
      );
    });
  }

  Widget hotelCard(HotelPickerViewModel model, int i) {
    return Opacity(
      opacity: model.selectedHotel == null || model.selectedHotel == model.hotelFindMany![i] ? 1 : 0.5,
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
                      '${model.hotelFindMany![i].address.subdistrict.district.city.name}, ${model.hotelFindMany![i].address.subdistrict.district.city.province.name}',
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
                      '${model.hotelFindMany![i].$_count.checkIns}/${model.hotelFindMany![i].quota}',
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
                child: AppImage(
                  image: model.hotelFindMany![i].images?.first.url ?? '',
                  backgroundColor: AppColors.baseLv7,
                  errorWidget: const Icon(
                    CupertinoIcons.building_2_fill,
                    color: AppColors.baseLv4,
                    size: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              model.hotelFindMany![i].name,
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
              model.hotelFindMany![i].description,
              style: AppTextStyle.regular(context, fontSize: 14),
            ),
            const SizedBox(height: AppSizes.padding),
            AppButton(
              onTap: () {
                model.onSelectHotel(model.hotelFindMany![i]);
              },
              enable: model.selectedHotel == null || model.selectedHotel == model.hotelFindMany![i],
              text: model.selectedHotel == null ? 'Pilih' : 'Anda memilih ini',
              leftIcon: model.selectedHotel == null ? null : Icons.check_circle,
              buttonColor: model.selectedHotel == null ? AppColors.primary : AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Consumer<HotelPickerViewModel>(builder: (context, model, _) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: model.selectedHotel == null
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
                      model.selectedHotel!.name,
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
                      '${DateFormatter.normal(model.selectedHotel!.startDate)} ',
                      style: AppTextStyle.bold(context, fontSize: 14),
                    ),
                    const SizedBox(height: AppSizes.padding),
                    AppButton(
                      text: 'Pilih',
                      onTap: () {
                        Navigator.pop(context, model.selectedHotel);
                      },
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
