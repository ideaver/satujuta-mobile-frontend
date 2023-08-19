import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../widget/atom/app_icon_button.dart';
import '../about/about_view.dart';
import '../login/login_view.dart';
import 'component/changeButton.dart';
import 'component/settings_items.dart';
import 'component/settings_password.dart';
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
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.baseLv7,
      title: title(),
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backButton(),
        Text(
          'Settings',
          style: AppTextStyle.bold(context, fontSize: 18),
        ),
        logOutButton(),
      ],
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

  Widget logOutButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.popAndPushNamed(context, LoginView.routeName);
      },
      icon: CustomIcon.logout_icon,
      iconSize: 20,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

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
          const SettingsPassword(),
          validatorInfo(),
          changeButton(
            'Ubah Password',
            () {
              // TO DO
            },
          ),
          const SizedBox(height: AppSizes.height * 8)
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
            icon: Icons.person_outline,
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
            icon: CustomIcon.notification_icon,
            title: 'Notifikasi',
            subTitle: 'Enable system send notification',
            functionButton: () {},
            rightButton: IconButton(
              icon: isCheck
                  ? const Image(
                      image: AssetImage(
                      AppAssets.checkIconPath,
                    ))
                  : const Image(
                      image: AssetImage(
                      AppAssets.uncheckIconPath,
                    )),
              onPressed: () {
                // TO DO
                setState(() {
                  isCheck ? isCheck = false : isCheck = true;
                });
              },
            ),
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
            icon: Icons.arrow_circle_left_outlined,
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
