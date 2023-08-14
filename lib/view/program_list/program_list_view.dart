import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';

class ProgramListView extends StatefulWidget {
  const ProgramListView({Key? key}) : super(key: key);

  static const String routeName = '/program-list';

  @override
  State<ProgramListView> createState() => _ProgramListViewState();
}

class _ProgramListViewState extends State<ProgramListView> {
  int selectedCategory = -1;

  List<String> categories = [
    'Kamping',
    'Jalan-Jalan',
    'Marathon',
    'Seminar',
    'Tour',
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
      padding: const EdgeInsets.only(
        bottom: AppSizes.padding * 3,
        left: AppSizes.padding,
      ),
      child: Row(
        children: [
          Icon(
            Icons.campaign_rounded,
          ),
          SizedBox(width: AppSizes.padding / 2),
          Text(
            'Katalog Program',
            style: AppTextStyle.bold(context, fontSize: 14),
          ),
        ],
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
            ...List.generate(categories.length, (i) {
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
        selectedCategory = i;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSizes.padding / 2),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        decoration: BoxDecoration(
          color: selectedCategory == i ? AppColors.primary : AppColors.white,
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
                      color: selectedCategory == -1 ? AppColors.white : AppColors.base,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              i == -1 ? 'Semua' : categories[i],
              style: AppTextStyle.semiBold(
                context,
                color: selectedCategory == i ? AppColors.white : AppColors.base,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    if (selectedCategory == 0) {
      return const AppNotFoundWidget(
        title: 'Maaf, Saat Ini Belum Ada Program Tersedia',
        subtitle: 'Kami akan segera menambahkan program dan akan kami beritahukan lewat pemberitahuan',
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.padding),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.all(AppSizes.padding),
        itemBuilder: (context, i) {
          return programCard(i);
        },
      ),
    );
  }

  Widget programCard(int i) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timelapse_rounded,
                    size: 12,
                    color: AppColors.baseLv4,
                  ),
                  SizedBox(width: AppSizes.padding / 2),
                  Text(
                    '20/12/2023',
                    style: AppTextStyle.regular(
                      context,
                      fontSize: 12,
                      color: AppColors.baseLv4,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 12,
                    color: AppColors.baseLv4,
                  ),
                  SizedBox(width: AppSizes.padding / 2),
                  Text(
                    '2 Hari Lagi',
                    style: AppTextStyle.regular(
                      context,
                      fontSize: 12,
                      color: AppColors.baseLv4,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Text(
            'If each interior angle is doubled of each exterior angle of a regular polygon with n sides, then the value of n is:',
            style: AppTextStyle.regular(context, fontSize: 14),
          ),
          const SizedBox(height: AppSizes.padding),
          SizedBox(
            width: 100,
            child: AppButton(
              onTap: () {
                // TODO
              },
              text: 'Join',
              fontSize: 12,
              rightIcon: Icons.arrow_right_alt_rounded,
              buttonColor: AppColors.white,
              textColor: AppColors.base,
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.padding / 2,
                horizontal: AppSizes.padding,
              ),
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
