import 'package:flutter/material.dart';

import 'package:satujuta_app_mobile/app/theme/app_sizes.dart';
import 'package:satujuta_app_mobile/widget/atom/app_button.dart';
import 'package:satujuta_app_mobile/widget/atom/app_image.dart';
import 'package:satujuta_app_mobile/widget/atom/app_not_found_widget.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';


class ProjectListView extends StatefulWidget {
  const ProjectListView({Key? key}) : super(key: key);

  static const String routeName = '/project-list';

  @override
  State<ProjectListView> createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  int selectedCategory = -1;

  List<String> categories = [
    'Selesai',
    'Belum Selesai',
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
                'Katalog Project',
                style: AppTextStyle.bold(context, fontSize: 14),
              ),
            ],
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
          return projectCard(i);
        },
      ),
    );
  }

  Widget projectCard(int i) {
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                  child: AppImage(
                    imgProvider: ImgProvider.networkImage,
                    image: 'https://picsum.photos/20$i/300',
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.padding / 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(
                        onTap: () {
                          // TODO
                        },
                        text: 'Category',
                        fontSize: 12,
                        buttonColor: AppColors.yellow,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSizes.padding / 4,
                          horizontal: AppSizes.padding / 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timelapse_rounded,
                    size: 12,
                    color: AppColors.baseLv4,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
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
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 12,
                    color: AppColors.baseLv4,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
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
            'Grand Cordela Hotel Bandung',
            style: AppTextStyle.bold(context, fontSize: 16),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          Text(
            'If each interior angle is doubled of each exterior angle of a regular :',
            style: AppTextStyle.regular(context, fontSize: 14),
          ),
          const SizedBox(height: AppSizes.padding),
          const AppProgress(
            labelLeft: 'RP 1.000.231.313',
            labelRight: '100%',
            percent: 50,
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  onTap: () {
                    // TODO
                  },
                  text: 'Lihat Detail',
                  fontSize: 12,
                  buttonColor: AppColors.primary.withOpacity(0.12),
                  textColor: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Text(
                '${1}${i} Investor',
                style: AppTextStyle.medium(
                  context,
                  fontSize: 14,
                  color: AppColors.baseLv4,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppProgress extends StatelessWidget {
  final String? labelLeft;
  final String? labelRight;
  final TextStyle? labelLeftStyle;
  final TextStyle? labelRightStyle;
  final Color? progressColor;
  final Color? progressBackgroundColor;
  final num percent;
  final double? height;

  const AppProgress({
    super.key,
    this.labelLeft,
    this.labelRight,
    this.labelLeftStyle,
    this.labelRightStyle,
    this.progressBackgroundColor,
    this.progressColor,
    this.height,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) {
        // TODO
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height ?? 24,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: progressBackgroundColor ?? AppColors.baseLv7,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                height: 24,
                width: constraints.maxWidth * percent / 100,
                decoration: BoxDecoration(
                  color: progressColor ?? AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  labelLeft ?? 'label',
                  style: labelLeftStyle ??
                      AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                ),
                Text(
                  labelRight != null ? labelRight! : '${percent}%',
                  style: labelRightStyle ??
                      AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
