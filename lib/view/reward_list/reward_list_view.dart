import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';

class RewardListView extends StatefulWidget {
  const RewardListView({Key? key}) : super(key: key);

  static const String routeName = '/reward-list';

  @override
  State<RewardListView> createState() => _RewardListViewState();
}

class _RewardListViewState extends State<RewardListView> {
  int selectedCategory = -1;

  List<String> categories = [
    'Tersedia',
    'Belum Tersedia',
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
        right: AppSizes.padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.campaign_rounded,
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Text(
                'Katalog Reward',
                style: AppTextStyle.bold(context, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 20,
            child: AppButton(
              onTap: () {
                // TODO
              },
              text: '50',
              fontSize: 8,
              leftIcon: Icons.stars_rounded,
              buttonColor: AppColors.yellow,
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.padding / 4,
                horizontal: AppSizes.padding / 2,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(right: AppSizes.padding / 2),
              child: Icon(
                i == -1
                    ? Icons.dashboard_outlined
                    : i == 0
                        ? Icons.check_circle
                        : Icons.cancel,
                size: 16,
                color: selectedCategory == i ? AppColors.white : AppColors.base,
              ),
            ),
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
        title: 'Maaf, Belum Ada Reward Tersedia Untuk Kamu',
        subtitle: 'Kamu bisa kumpulkan banyak poin untuk mendapatkan hadiah yang menarik',
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.padding),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.all(AppSizes.padding),
        itemBuilder: (context, i) {
          return rewardCard(i);
        },
      ),
    );
  }

  Widget rewardCard(int i) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nilai Poin',
                style: AppTextStyle.bold(context, fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    '1000',
                    style: AppTextStyle.extraBold(
                      context,
                      fontSize: 12,
                      color: AppColors.yellow,
                    ),
                  ),
                  const SizedBox(width: AppSizes.padding / 4),
                  const Icon(
                    Icons.stars,
                    size: 14,
                    color: AppColors.yellow,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Text(
            'Tiket Umroh',
            style: AppTextStyle.bold(context, fontSize: 16),
          ),
          const SizedBox(height: AppSizes.padding),
          Text(
            'If each interior angle is doubled of each exterior angle of a regular polygon with n sides, then the value of n is:',
            style: AppTextStyle.regular(context, fontSize: 14),
          ),
          const SizedBox(height: AppSizes.padding),
          Container(
            padding: const EdgeInsets.all(AppSizes.padding / 1.2),
            decoration: BoxDecoration(
              color: AppColors.baseLv7,
              borderRadius: BorderRadius.circular(AppSizes.radius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Poin Anda',
                  style: AppTextStyle.bold(context, fontSize: 12),
                ),
                const SizedBox(height: AppSizes.padding / 4),
                Text(
                  '95 Poin lagi dapatkan haidah Umroh gratis',
                  style: AppTextStyle.regular(context, fontSize: 12),
                ),
                const SizedBox(height: AppSizes.padding),
                Container(
                  height: 24,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: AppColors.baseLv6,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 24,
                    width: 200,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.padding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '75',
                      style: AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      '100',
                      style: AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            onTap: () {
              // TODO
            },
            text: 'Klaim Reward',
          ),
        ],
      ),
    );
  }
}
