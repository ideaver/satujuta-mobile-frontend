import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/widget/app_image.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/widget/app_button.dart';
import '../../app/widget/my_icon_button.dart';
import 'components/reg_account.dart';
import 'components/reg_biodata.dart';
import 'components/reg_commission.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      expandedHeight: MediaQuery.of(context).size.height / 4,
      flexibleSpace: FlexibleSpaceBar(
        background: sliverBackground(),
      ),
    );
  }

  Widget sliverBackground() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIconButton(
                onPressed: () {
                  // TODO
                },
                imgIcon: AppAssets.lockIconPath,
              ),
              AppButton(
                onTap: () {
                  // TODO
                },
                textColor: AppColors.primary,
                buttonColor: AppColors.primary.withOpacity(0.12),
                text: 'Login',
                fontSize: 12,
                rightIcon: Icons.arrow_forward_ios_rounded,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding * 1.5),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrasi",
                  style: AppTextStyle.bold(context, fontSize: 22),
                ),
                const SizedBox(height: AppSizes.padding / 2),
                Text(
                  "Bergabung menjadi anggota SatuJuta!",
                  style: AppTextStyle.regular(
                    context,
                    fontSize: 14,
                    color: AppColors.baseLv4,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            userPhoto(),
            tabBar(),
            tabBarViews(),
            buttons(),
          ],
        ),
      ),
    );
  }

  Widget userPhoto() {
    return Column(
      children: [
        const SizedBox(height: AppSizes.padding),
        Text(
          "Upload Foto Profile Anda",
          style: AppTextStyle.bold(context),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: AppSizes.padding * 1.5,
          ),
          width: 150,
          height: 150,
          child: Center(
            child: Stack(
              children: [
                const ClipOval(
                  child: AppImage(
                    image: randomImage,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // TODO
                      },
                      child: Image.asset(
                        AppAssets.editIconPath,
                        width: AppSizes.padding * 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
      ],
    );
  }

  Widget tabBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.baseLv6,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TabBar(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        labelColor: AppColors.base,
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.personFormIconPath,
                ),
                const SizedBox(width: AppSizes.padding / 3),
                Flexible(
                  child: Text(
                    "Data Diri",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(context, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.lockDarkIconPath,
                ),
                const SizedBox(width: AppSizes.padding / 3),
                Flexible(
                  child: Text(
                    "Akun",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(context, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.coinFormIconPath,
                ),
                const SizedBox(width: AppSizes.padding / 3),
                Flexible(
                  child: Text(
                    "Komisi",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(context, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBarViews() {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: TabBarView(
        controller: tabController,
        children: const [
          RegBiodata(),
          RegAccount(),
          RegCommission(),
        ],
      ),
    );
  }

  Widget buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      child: AppButton(
        onTap: () {
          // TODO
        },
        text: 'Berikutnya',
      ),
    );
  }
}
