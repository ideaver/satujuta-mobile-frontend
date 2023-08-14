import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../widget/atom/app_icon_button.dart';
import 'component/edit_profile_account.dart';
import 'component/edit_profile_biodata.dart';
import 'component/edit_profile_commission.dart';

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
      backgroundColor: AppColors.white,
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
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: true,
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
      pinned: true,
      expandedHeight: 170,
      elevation: 0.5,
      leading: backButton(),
      title: title(),
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: sliverBackground(),
        expandedTitleScale: 1,
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          userPhoto(),
          tabBar(),
          tabBarViews(),
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
    );
  }

  Widget userPhoto() {
    return Column(
      children: [
        const SizedBox(height: AppSizes.padding),
        Text(
          "Foto Profile",
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
                ClipOval(
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image(
                          image: AssetImage(
                        AppAssets.userImage1Path,
                      ))),
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
          name: 'Agus Susanto',
          address: 'jln ambarawa no 1 Semarang',
          city: 'Surabaya',
          posCode: '60241',
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

  Widget changeButton(String text, dynamic functionButton) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSizes.padding / 2,
        bottom: AppSizes.padding * 2,
      ),
      child: AppButton(text: text, onTap: functionButton),
    );
  }

  // ===
}
