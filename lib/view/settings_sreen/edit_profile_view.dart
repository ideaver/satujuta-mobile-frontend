import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satujuta_app_mobile/view/settings_sreen/component/changeButton.dart';
import 'package:satujuta_app_mobile/view/settings_sreen/component/edit_profile_account.dart';
import 'package:satujuta_app_mobile/view/settings_sreen/component/edit_profile_biodata.dart';
import 'package:satujuta_app_mobile/view/settings_sreen/component/edit_profile_commission.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/widget/my_icon_button.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/edit-profile';

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> with TickerProviderStateMixin {
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

  AppBar appBar() {
    return AppBar(
      leading: backButton(),
      centerTitle: true,
      backgroundColor: AppColors.white,
      title: title(),
    );
  }

  Widget title() {
    return Text(
      'Profile',
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
      expandedHeight: 400,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            appBar(),
            background(),
          ],
        ),
        expandedTitleScale: 1,
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          tabBar(),
          tabBarViews(),
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400 - 60,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.backgroundPath)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
            child: Text(
              'Foto Profile',
              style: AppTextStyle.bold(context, fontSize: 20),
            ),
          ),
          const Stack(children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                AppAssets.userImage1Path,
              ),
              maxRadius: 80,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: AppColors.primary,
                  child: AppIconButton(
                    icon: CustomIcon.edit_icon,
                    iconColor: AppColors.white,
                  ),
                ))
          ])
        ],
      ),
    );
  }

  Widget tabBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.padding,
      ),
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
            ? wrapEditBiodata()
            : tabController.index == 1
                ? wrapEditAccount()
                : wrapEditCommision());
  }

  Widget wrapEditBiodata() {
    return Column(
      children: [
        const EditProfileBiodata(
          nama: 'Agus Susanto',
          alamat: 'jln ambarawa no 1 Semarang',
          kota: 'Surabaya',
          kecamatan: '',
          kodePos: '60241',
          noWa: '+62908327587',
          email: 'Agus@gmail.com',
        ),
        changeButton(
          'Simpan Perubahan',
          () {
            // TO DO
          },
        ),
      ],
    );
  }

  Widget wrapEditAccount() {
    return Column(
      children: [
        const EditProfileAccount(
          noWa: '+62908327587',
          email: 'Agususanto@gmail.com',
        ),
        changeButton(
          'Simpan Perubahan',
          () {
            // TO DO
          },
        ),
      ],
    );
  }

  Widget wrapEditCommision() {
    return Column(
      children: [
        EditProfileCommission(
          codeRef: '#123513UHD',
          noRek: '1234 5678 9101',
        ),
        changeButton(
          'Simpan Perubahan',
          () {
            // TO DO
          },
        ),
      ],
    );
  }

  // ===
}
