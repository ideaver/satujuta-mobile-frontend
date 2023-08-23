import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_modal.dart';
import '../../widget/atom/app_icon_button.dart';
import 'component/student_form.dart';
import 'component/student_reg_status.dart';

class StudentRegistrationView extends StatefulWidget {
  const StudentRegistrationView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/student-registration';

  @override
  State<StudentRegistrationView> createState() => _StudentRegistrationViewState();
}

class _StudentRegistrationViewState extends State<StudentRegistrationView> {
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daftarkan Siswa",
                style: AppTextStyle.bold(context, fontSize: 20),
              ),
              const SizedBox(height: AppSizes.padding / 4),
              Text(
                "Harap mengisi data siswa",
                style: AppTextStyle.regular(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 20,
              child: AppIconButton(
                icon: Icons.info_outline,
              )),
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

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          StudentForm(),
          validatorInfo(),
          buttons('Berikutnya', () {
            // TODO

            AppModal.show(
              context: context,
              title: '',
              child: StudentRegStatus(
                isSuccess: true,
              ),
            );
          }),
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
              'Email Telah Valid',
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
              'No. Whatsapp Salah',
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
              'Email valid',
              style: AppTextStyle.medium(context),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.padding),
      ],
    );
  }

  Widget buttons(String text, dynamic functionButton) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding,
      ),
      child: AppButton(text: text, onTap: functionButton),
    );
  }
}
