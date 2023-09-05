import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../app/service/auth/auth_service.dart';
import '../../widget/atom/app_dialog.dart';
import 'about_view.dart';
import 'components/settings_items.dart';
import 'edit_password_view.dart';
import 'edit_profile_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

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
          // const SizedBox(height: AppSizes.padding / 2),
          // SettingItem(
          //   icon: CustomIcon.notification_icon,
          //   title: 'Notifikasi',
          //   subTitle: 'Enable system send notification',
          //   functionButton: () {},
          //   rightButton: AppToggle(
          //     onChanged: (val) {},
          //     value: true,
          //   ),
          // ),
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
              final navigator = Navigator.of(context);

              AppDialog.show(
                navigator,
                title: 'Logout',
                text: 'Apakah anda yakin ingin keluar?',
                rightButtonText: "Keluar",
                leftButtonText: "Batal",
                onTapRightButton: () {
                  navigator.pop();
                  AuthService.logOut(navigator);
                },
              );
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
