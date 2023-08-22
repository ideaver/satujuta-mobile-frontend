import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satujuta_app_mobile/widget/atom/app_toggle.dart';

import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../about/about_view.dart';
import 'component/settings_items.dart';
import 'edit_password_view.dart';
import 'edit_profile_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/settings';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isCheck = true;

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

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.baseLv7,
      centerTitle: true,
      title: title(),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
    );
  }

  Widget title() {
    return Text(
      'Settings',
      style: AppTextStyle.bold(context, fontSize: 18),
    );
  }

  // Widget backButton() {
  //   return AppIconButton(
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //     icon: Icons.arrow_back,
  //     iconSize: 18,
  //     iconColor: AppColors.base,
  //     backgroundColor: AppColors.white,
  //     padding: const EdgeInsets.all(AppSizes.padding / 2),
  //   );
  // }

  // Widget logOutButton() {
  //   return AppIconButton(
  //     onPressed: () {
  //       Navigator.popAndPushNamed(context, LoginView.routeName);
  //     },
  //     icon: CustomIcon.logout_icon,
  //     iconSize: 20,
  //     iconColor: AppColors.base,
  //     backgroundColor: AppColors.white,
  //     padding: const EdgeInsets.all(AppSizes.padding / 2),
  //   );
  // }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      pinned: true,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            appBar(),
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
          settingListItems(),
          const SizedBox(height: AppSizes.height * 8),
        ],
      ),
    );
  }

  Widget settingListItems() {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.padding * 1.5),
      child: Column(
        children: [
          SettingItem(
            icon: CupertinoIcons.person,
            title: 'Ubah Profile',
            rightButton: chevronButton(),
            functionButton: () {
              Navigator.pushNamed(
                context,
                EditProfileView.routeName,
              );
            },
          ),
          const SizedBox(height: AppSizes.padding / 2),
          SettingItem(
            icon: CupertinoIcons.lock,
            title: 'Ubah Password',
            rightButton: chevronButton(),
            functionButton: () {
              Navigator.pushNamed(
                context,
                EditPasswordView.routeName,
              );
            },
          ),
          const SizedBox(height: AppSizes.padding / 2),
          SettingItem(
            icon: CustomIcon.notification_icon,
            title: 'Notifikasi',
            subTitle: 'Enable system send notification',
            functionButton: () {},
            rightButton: AppToggle(
              onChanged: (val) {},
              value: true,
            ),
            // IconButton(
            //   icon: isCheck
            //       ? const Image(
            //           image: AssetImage(
            //           AppAssets.checkIconPath,
            //         ))
            //       : const Image(
            //           image: AssetImage(
            //             AppAssets.uncheckIconPath,
            //           ),
            //         ),
            //   onPressed: () {
            //     // TODO
            //     setState(() {
            //       isCheck ? isCheck = false : isCheck = true;
            //     });
            //   },
            // ),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          SettingItem(
            icon: CustomIcon.about_icon,
            title: 'Tentang',
            subTitle: 'Informasi tentang aplikasi',
            rightButton: chevronButton(),
            functionButton: () {
              Navigator.pushNamed(
                context,
                AboutView.routeName,
              );
            },
          ),
          const SizedBox(height: AppSizes.padding / 2),
          SettingItem(
            icon: CupertinoIcons.arrow_left_circle,
            title: 'Logout',
            rightButton: chevronButton(),
            functionButton: () {
              // TODO LOG OUT
              // Navigator.pushNamed(
              //   context,
              //   LoginView.routeName,
              // );
            },
          ),
        ],
      ),
    );
  }

  Widget chevronButton() {
    return const Padding(
      padding: EdgeInsets.all(AppSizes.padding / 2),
      child: Icon(
        Icons.chevron_right,
        size: 20,
      ),
    );
  }
}
