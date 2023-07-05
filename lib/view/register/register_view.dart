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
    tabController.addListener(tabListener);
  }

  void tabListener() {
    setState(() {});
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
      pinned: true,
      expandedHeight: 170,
      collapsedHeight: 70,
      elevation: 0.5,
      flexibleSpace: FlexibleSpaceBar(
        title: title(),
        background: sliverBackground(),
        expandedTitleScale: 1.2,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.padding,
        ),
      ),
    );
  }

  Widget title() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Registrasi",
            style: AppTextStyle.bold(context, fontSize: 20),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            "Bergabung menjadi anggota SatuJuta!",
            style: AppTextStyle.regular(
              context,
              fontSize: 12,
              color: AppColors.baseLv4,
            ),
          ),
        ],
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
        children: [
          const SizedBox(height: AppSizes.padding),
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
        ],
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          userPhoto(),
          tabBar(),
          tabBarViews(),
          buttons(),
        ],
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
            vertical: AppSizes.padding,
          ),
          width: 150,
          height: 150,
          child: Center(
            child: Stack(
              children: [
                const ClipOval(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: AppImage(
                      image: randomImage,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AppAssets.editIconPath,
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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: tabController.index == 0
          ? const RegBiodata()
          : tabController.index == 1
              ? const RegAccount()
              : const RegCommission(),
    );
    // return Expanded(
    //   // padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
    //   child: TabBarView(
    //     controller: tabController,
    //     children: const [
    //       RegBiodata(),
    //       RegAccount(),
    //       RegCommission(),
    //     ],
    //   ),
    // );
  }

  Widget buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      child: tabController.index == 0
          ? AppButton(
              onTap: () {
                tabController.animateTo(tabController.index + 1);
              },
              text: 'Berikutnya',
            )
          : tabController.index == 1
              ? Column(
                  children: [
                    validatorInfo(),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              tabController.animateTo(tabController.index - 1);
                            },
                            text: 'Sebelumnya',
                            textColor: AppColors.primary,
                            buttonColor: AppColors.primary.withOpacity(0.12),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              tabController.animateTo(tabController.index + 1);
                            },
                            text: 'Berikutnya',
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onTap: () {
                          tabController.animateTo(tabController.index - 1);
                        },
                        text: 'Sebelumnya',
                        textColor: AppColors.primary,
                        buttonColor: AppColors.primary.withOpacity(0.12),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppButton(
                        onTap: () {
                          // TODO
                        },
                        text: 'Daftar',
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget validatorInfo() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppAssets.successIconPath,
            ),
            const SizedBox(width: 6),
            Text(
              'Besar atau kecil karakter',
              style: AppTextStyle.medium(context),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Row(
          children: [
            Image.asset(
              AppAssets.failedIconPath,
            ),
            const SizedBox(width: 6),
            Text(
              '6 atau lebih karakter',
              style: AppTextStyle.medium(context),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Row(
          children: [
            Image.asset(
              AppAssets.unsuccessIconPath,
            ),
            const SizedBox(width: 6),
            Text(
              'Setidaknya 1 nomor',
              style: AppTextStyle.medium(context),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.padding),
      ],
    );
  }
}
