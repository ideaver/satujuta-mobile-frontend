import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_not_found_widget.dart';
import '../../app/service/locator/service_locator.dart';
import '../../view_model/marketing_list_view_model.dart';
import '../../widget/atom/app_icon_button.dart';

class MarketingGalleryView extends StatefulWidget {
  const MarketingGalleryView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/marketing-gallery';

  @override
  State<MarketingGalleryView> createState() => _MarketingGalleryViewState();
}

class _MarketingGalleryViewState extends State<MarketingGalleryView> {
  // List<String> photos = [
  //   AppAssets.randomPhotos1Path,
  //   AppAssets.randomPhotos2Path,
  //   AppAssets.randomPhotos3Path,
  //   AppAssets.randomPhotos4Path,
  //   AppAssets.randomPhotos1Path,
  //   AppAssets.randomPhotos2Path,
  //   AppAssets.randomPhotos3Path,
  //   AppAssets.randomPhotos4Path,
  // ];

  final scrollController = ScrollController();

  final _marketingListViewModel = locator<MarketingListViewModel>();

  @override
  void initState() {
    _marketingListViewModel.searchCtrl = TextEditingController();
    scrollController.addListener(scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _marketingListViewModel.initFileListView();
    });
    super.initState();
  }

  @override
  void dispose() {
    _marketingListViewModel.searchCtrl.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    // final navigator = Navigator.of(context);

    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      _marketingListViewModel.getAllFiles(
        skip: _marketingListViewModel.fileFindMany?.length ?? 0,
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

  Widget title() {
    return Text(
      'Marketing Kit',
      style: AppTextStyle.bold(context, fontSize: 18),
    );
  }

  Widget backButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icons.chevron_left,
      iconSize: 18,
      iconColor: AppColors.base,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      backgroundColor: AppColors.baseLv7,
      pinned: true,
      elevation: 0.5,
      leading: backButton(),
      title: title(),
      automaticallyImplyLeading: false,
      flexibleSpace: const FlexibleSpaceBar(),
      bottom: tabBar(),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.baseLv7),
    );
  }

  PreferredSizeWidget tabBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 70),
      child: Consumer<MarketingListViewModel>(builder: (context, model, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.padding,
            vertical: AppSizes.padding,
          ),
          child: Row(
            children: [
              tabWidget(model, -1),
              ...List.generate(model.categories.length, (i) {
                return tabWidget(model, i);
              })
            ],
          ),
        );
      }),
    );
  }

  Widget tabWidget(MarketingListViewModel model, int i) {
    return GestureDetector(
      onTap: () {
        final navigator = Navigator.of(context);

        if (i >= 0) {
          model.onSelectCategory(navigator, model.categories[i], i);
        } else {
          model.onSelectCategory(navigator, null, i);
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
                      color: model.selectedTabIndex == i ? AppColors.white : AppColors.base,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              i == -1 ? 'Semua' : model.categories[i]['name'] ?? '',
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
    return Consumer<MarketingListViewModel>(builder: (context, model, _) {
      if (model.selectedTabIndex == 0) {
        return Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.padding,
            right: AppSizes.padding,
          ),
          child: photoCard(model),
        );
      } else if (model.selectedTabIndex == 1) {
        return Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.padding,
            right: AppSizes.padding,
          ),
          child: videoCard(model),
        );
      } else if (model.selectedTabIndex == 2) {
        return Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.padding,
            left: AppSizes.padding,
            right: AppSizes.padding,
          ),
          child: Column(
            children: model.fileFindMany == null
                ? []
                : [
                    ...List.generate(model.fileFindMany!.length, (i) {
                      return fileCard(i, model);
                    })
                  ],
          ),
        );
      }

      return const AppNotFoundWidget(
        title: 'Maaf, Saat Ini Belum Ada Program Tersedia',
        subtitle: 'Kami akan segera menambahkan program dan akan kami beritahukan lewat pemberitahuan',
      );
    });
  }

  Widget fileCard(int i, MarketingListViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 4),
      child: Ink(
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.fileIconPath,
                    )),
                const SizedBox(width: AppSizes.padding / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.fileFindMany?[i].name ?? '',
                      style: AppTextStyle.bold(
                        context,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSizes.height / 2),
                      child: Text(
                        '${(model.fileFindMany?[i].filesize ?? 0) / 1024} KB',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              splashColor: Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.file_download_outlined,
                  color: AppColors.baseLv4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget videoCard(MarketingListViewModel model) {
    if (model.fileFindMany == null) {
      return const AppNotFoundWidget(
        title: 'Maaf, Saat Ini Belum Ada Video Tersedia',
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(model.fileFindMany!.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.padding / 4),
          child: InkWell(
            borderRadius: BorderRadius.circular(
              AppSizes.radius * 3,
            ),
            onTap: () {
              // TODO
            },
            splashColor: Colors.black.withOpacity(0.06),
            child: Ink(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    model.fileFindMany![index].url,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  AppSizes.radius * 3,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.30),
                  borderRadius: BorderRadius.circular(
                    AppSizes.radius * 3,
                  ),
                ),
                child: const Icon(
                  CustomIcon.video_circle_icon,
                  size: 60,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget photoCard(MarketingListViewModel model) {
    if (model.fileFindMany == null) {
      return const AppNotFoundWidget(
        title: 'Maaf, Saat Ini Belum Ada Foto Tersedia',
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(model.fileFindMany!.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.padding / 4),
          child: InkWell(
            borderRadius: BorderRadius.circular(
              AppSizes.radius * 3,
            ),
            onTap: () {
              // TODO
            },
            splashColor: Colors.black.withOpacity(0.06),
            child: Ink(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    model.fileFindMany![index].url,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  AppSizes.radius * 3,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
