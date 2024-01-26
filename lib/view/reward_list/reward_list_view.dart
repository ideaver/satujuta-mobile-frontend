import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';
import '../../app/service/locator/service_locator.dart';
import '../../view_model/reward_list_view_model.dart';
import '../../widget/atom/app_progress_indicator.dart';

class RewardListView extends StatefulWidget {
  const RewardListView({Key? key}) : super(key: key);

  static const String routeName = '/reward-list';

  @override
  State<RewardListView> createState() => _RewardListViewState();
}

class _RewardListViewState extends State<RewardListView> {
  final scrollController = ScrollController();

  final _programListViewModel = locator<RewardListViewModel>();

  int selectedCategory = -1;

  List<String> categories = [
    'Tersedia',
    'Belum Tersedia',
  ];

  @override
  void initState() {
    _programListViewModel.searchCtrl = TextEditingController();
    scrollController.addListener(scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _programListViewModel.initRewardListView();
    });
    super.initState();
  }

  @override
  void dispose() {
    _programListViewModel.searchCtrl.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    // final navigator = Navigator.of(context);

    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      _programListViewModel.getAllRewards(
        skip: _programListViewModel.rewardFindMany?.length ?? 0,
      );
    }
  }

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

  Widget sliverAppBarWidget() {
    return Consumer<RewardListViewModel>(builder: (context, model, _) {
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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.baseLv7,
        ),
        bottom: tabBar(),
      );
    });
  }

  Widget title() {
    return Consumer<UserViewModel>(builder: (context, model, _) {
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
                text: '${model.totalUserPoint}',
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
    });
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

        // TODO API NOT AVAILABLE
        // final navigator = Navigator.of(context);

        // if (i >= 0) {
        //   model.onSelectCategory(navigator, model.rewardCategories![i], i);
        // } else {
        //   model.onSelectCategory(navigator, null, i);
        // }
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
    return Consumer<RewardListViewModel>(builder: (context, model, _) {
      if (model.rewardFindMany == null) {
        return const AppProgressIndicator();
      }

      if (model.rewardFindMany!.isEmpty) {
        return const AppNotFoundWidget(
          title: 'Maaf, Belum Ada Reward Tersedia Untuk Kamu',
          subtitle: 'Kamu bisa kumpulkan banyak poin untuk mendapatkan hadiah yang menarik',
        );
      }

      return RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 6),
        radius: const Radius.circular(100),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.rewardFindMany!.length,
          padding: const EdgeInsets.all(AppSizes.padding),
          itemBuilder: (context, i) {
            return rewardCard(i, model);
          },
        ),
      );
    });
  }

  Widget rewardCard(int i, RewardListViewModel model) {
    return Consumer<UserViewModel>(builder: (context, userViewModel, _) {
      var needPoints = (model.rewardFindMany?[i].pointCost ?? 0) - userViewModel.totalUserPoint > 0
          ? (model.rewardFindMany?[i].pointCost ?? 0) - userViewModel.totalUserPoint
          : 0;

      bool isClaimed =
          model.rewardFindMany![i].RewardClaim?.where((e) => e.user.id == userViewModel.user!.id).firstOrNull != null;
      return Container(
        margin: EdgeInsets.only(bottom: i < model.rewardFindMany!.length - 1 ? AppSizes.padding : AppSizes.padding * 6),
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          boxShadow: const [
            BoxShadow(
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
                      '${model.rewardFindMany?[i].pointCost.round()}',
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
              model.rewardFindMany?[i].name ?? '-',
              style: AppTextStyle.bold(context, fontSize: 16),
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              model.rewardFindMany?[i].description ?? '-',
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
                    needPoints > 0
                        ? '${needPoints.round()} Poin lagi dapatkan haidah Umroh gratis'
                        : 'Klaim reward sekarang',
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
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Container(
                        height: 24,
                        width: userViewModel.totalUserPoint /
                            (model.rewardFindMany?[i].pointCost ?? 0) *
                            constraint.maxWidth,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: AppSizes.padding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${userViewModel.totalUserPoint.round()}',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${(model.rewardFindMany?[i].pointCost ?? 0).round()}',
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
                final navigator = Navigator.of(context);
                model.claimReward(navigator, model.rewardFindMany![i].id);
              },
              enable: !isClaimed,
              text: 'Klaim Reward',
            ),
          ],
        ),
      );
    });
  }
}
