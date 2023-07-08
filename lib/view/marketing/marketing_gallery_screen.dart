import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satujuta_app_mobile/app/const/app_assets.dart';

import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

import '../../app/widget/app_not_found_widget.dart';
import '../../app/widget/my_icon_button.dart';

class MarketingGalleryView extends StatefulWidget {
  const MarketingGalleryView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/marketing-gallery';

  @override
  State<MarketingGalleryView> createState() => _MarketingGalleryViewState();
}

class _MarketingGalleryViewState extends State<MarketingGalleryView> {
  int selectedCategory = -1;

  List<String> categories = [
    'Foto',
    'Video',
    'File',
  ];

  List<String> photos = [
    AppAssets.randomPhotos1Path,
    AppAssets.randomPhotos2Path,
    AppAssets.randomPhotos3Path,
    AppAssets.randomPhotos4Path,
    AppAssets.randomPhotos1Path,
    AppAssets.randomPhotos2Path,
    AppAssets.randomPhotos3Path,
    AppAssets.randomPhotos4Path,
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
    );

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
      icon: Icons.arrow_back,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
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
      flexibleSpace: FlexibleSpaceBar(),
      bottom: tabBar(),
    );
  }

  PreferredSizeWidget tabBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 70),
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
      return Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.padding,
          right: AppSizes.padding,
        ),
        child: photoCard(),
      );
    } else if (selectedCategory == 1) {
      return Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.padding,
          right: AppSizes.padding,
        ),
        child: videoCard(),
      );
    } else if (selectedCategory == 2) {
      return Padding(
        padding: const EdgeInsets.only(
          top: AppSizes.padding,
          left: AppSizes.padding,
          right: AppSizes.padding,
        ),
        child: Column(
          children: [
            ...List.generate(4, (i) {
              return fileCard(i);
            })
          ],
        ),
      );
    }

    return const AppNotFoundWidget(
      title: 'Maaf, Saat Ini Belum Ada Program Tersedia',
      subtitle: 'Kami akan segera menambahkan program dan akan kami beritahukan lewat pemberitahuan',
    );
  }

  Widget fileCard(int i) {
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
                      i == 0 ? 'Data Administrasi' : 'Keamanan Data Bab $i',
                      style: AppTextStyle.bold(
                        context,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSizes.height / 2),
                      child: Text(
                        '230,40 KB',
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.file_download_outlined,
                    color: AppColors.baseLv4,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget videoCard() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Padding(
          padding: EdgeInsets.all(AppSizes.padding / 4),
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
                      photos[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSizes.radius * 3,
                  )),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.30),
                    borderRadius: BorderRadius.circular(
                      AppSizes.radius * 3,
                    )),
                child: Icon(
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

  Widget photoCard() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Padding(
          padding: EdgeInsets.all(AppSizes.padding / 4),
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
                      photos[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSizes.radius * 3,
                  )),
            ),
          ),
        );
      }),
    );
  }
}
