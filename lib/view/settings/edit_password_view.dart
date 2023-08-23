import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../app/asset/app_assets.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_text_field.dart';
import '../../widget/atom/app_text_fields_wrapper.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/edit-password';

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> with TickerProviderStateMixin {
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
      backgroundColor: AppColors.white,
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: title(),
      elevation: 0.5,
    );
  }

  Widget title() {
    return Text(
      'Ubah Password',
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

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          const SizedBox(height: AppSizes.padding / 2),
          AppTextFieldsWrapper(
            textFields: [
              AppTextField(
                type: AppTextFieldType.password,
                lableText: 'Password Lama',
                onChanged: (val) {},
              ),
              AppTextField(
                type: AppTextFieldType.password,
                showVisibilityButton: false,
                lableText: 'Password Baru',
                onChanged: (val) {},
              ),
              AppTextField(
                type: AppTextFieldType.password,
                showVisibilityButton: false,
                lableText: 'Ulangi Password',
                onChanged: (val) {},
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          // validatorInfo(),
          const SizedBox(height: AppSizes.padding),
          changeButton(),
        ],
      ),
    );
  }

  Widget changeButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSizes.padding / 2,
        bottom: AppSizes.padding * 2,
      ),
      child: AppButton(
        text: 'Change',
        onTap: () {},
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
      ],
    );
  }
}
