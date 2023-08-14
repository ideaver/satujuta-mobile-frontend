import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/const/app_consts.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_text_field.dart';
import '../../widget/atom/app_icon_button.dart';

class ReferralView extends StatefulWidget {
  final PageStateEnum pageState;

  const ReferralView({Key? key, required this.pageState}) : super(key: key);

  static const String viewAsMeRouteName = '/my-referral';
  static const String viewAsOtherRouteName = '/other-user-referral';

  const ReferralView.viewAsMe({
    super.key,
    this.pageState = PageStateEnum.viewAsMe,
  });

  const ReferralView.viewAsOther({
    super.key,
    this.pageState = PageStateEnum.viewAsOther,
  });

  @override
  State<ReferralView> createState() => _ReferralViewState();
}

class _ReferralViewState extends State<ReferralView> {
  int selectedMemberStatus = -1;

  List<String> memberStatuses = [
    'Aktif',
    'Non-Aktif',
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
      appBar: appBar(),
      body: body(),
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
        Row(
          children: [
            backButton(),
            widget.pageState == PageStateEnum.viewAsOther
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anggota',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                      Text(
                        'Robert Meijer',
                        style: AppTextStyle.bold(context, fontSize: 18),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      const Icon(
                        Icons.people_alt_outlined,
                        color: AppColors.base,
                      ),
                      const SizedBox(width: AppSizes.padding / 2),
                      Text(
                        'Anggota Anda',
                        style: AppTextStyle.bold(context, fontSize: 18),
                      ),
                    ],
                  ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.person,
              color: AppColors.base,
              size: 18,
            ),
            const SizedBox(width: AppSizes.padding / 4),
            Text(
              '16',
              style: AppTextStyle.bold(context, fontSize: 16),
            ),
            const SizedBox(width: AppSizes.padding / 4),
          ],
        ),
      ],
    );
  }

  Widget backButton() {
    if (widget.pageState != PageStateEnum.viewAsOther) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.padding),
      child: AppIconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icons.arrow_back_ios_rounded,
        iconSize: 18,
        iconColor: AppColors.base,
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchField(),
        tabBar(),
        memberList(),
      ],
    );
  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppSizes.padding,
        AppSizes.padding / 4,
        AppSizes.padding,
        AppSizes.padding,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const Expanded(
            child: AppTextField(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: 'Cari',
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.padding / 2,
                vertical: AppSizes.padding / 4,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.padding / 2),
          sortButton(),
          const SizedBox(width: AppSizes.padding),
          inviteButton(),
          const SizedBox(width: AppSizes.padding),
        ],
      ),
    );
  }

  Widget sortButton() {
    return AppIconButton(
      onPressed: () {
        // TODO
      },
      icon: Icons.sort,
      iconSize: 18,
    );
  }

  Widget inviteButton() {
    if (widget.pageState == PageStateEnum.viewAsOther) {
      return const SizedBox.shrink();
    }

    return AppButton(
      onTap: () {
        // TODO
      },
      text: 'Undang',
      fontSize: 12,
      leftIcon: Icons.add,
      padding: const EdgeInsets.all(
        AppSizes.padding / 2,
      ),
    );
  }

  Widget tabBar() {
    if (widget.pageState == PageStateEnum.viewAsOther) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
        ),
        child: Row(
          children: [
            tabWidget(-1),
            ...List.generate(memberStatuses.length, (i) {
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
        selectedMemberStatus = i;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSizes.padding / 2),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        decoration: BoxDecoration(
          color: selectedMemberStatus == i ? AppColors.primary : AppColors.white,
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
                      color: selectedMemberStatus == -1 ? AppColors.white : AppColors.base,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              i == -1 ? 'Semua' : '${memberStatuses[i]} (0)',
              style: AppTextStyle.semiBold(
                context,
                color: selectedMemberStatus == i ? AppColors.white : AppColors.base,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget memberList() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: Column(
          children: [
            ...List.generate(15, (i) {
              return memberCard(i);
            }),
            SizedBox(
              height: AppSizes.padding * 6,
            )
          ],
        ),
      ),
    );
  }

  Widget memberCard(int i) {
    return Container(
      margin: EdgeInsets.only(bottom: i == 3 ? 0 : AppSizes.padding / 4),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const ClipOval(
                    child: AppImage(
                      image: randomImage,
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.padding / 1.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Robert Meijer',
                        style: AppTextStyle.extraBold(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        'Bergabung 22/10/2021',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.stars,
                            size: 18,
                            color: AppColors.yellow,
                          ),
                          const SizedBox(width: AppSizes.padding / 4),
                          Text(
                            '1080 Poin',
                            style: AppTextStyle.medium(
                              context,
                              fontSize: 12,
                              color: AppColors.baseLv4,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.padding / 2),
          AppButton(
            onTap: () {
              // TODO
            },
            text: '15',
            fontSize: 14,
            textColor: AppColors.base,
            buttonColor: AppColors.white,
            borderWidth: 1,
            borderColor: AppColors.baseLv6,
            leftIcon: Icons.person_2_outlined,
            rightIcon: Icons.arrow_forward_ios_rounded,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding / 2,
              vertical: AppSizes.padding / 4,
            ),
          ),
        ],
      ),
    );
  }
}
