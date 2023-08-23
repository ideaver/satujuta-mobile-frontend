import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/operations/generated/user_find_many.graphql.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/const/app_consts.dart';
import '../../../model/chart_model.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_modal.dart';
import '../../../widget/atom/app_text_field.dart';
import '../../app/utility/currency_formatter.dart';
import '../../view_model/member_list_view_model.dart';
import '../../view_model/program_list_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_progress_indicator.dart';
import '../referral/referral_detail_view.dart';
import '../student/student_registration_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  static const String routeName = '/dashboard';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<String> periods = ['Minggu', 'Bulan', 'Tahun'];

  List<ChartModel> caseByDiseases = [
    ...List.generate(12, (index) {
      return ChartModel(
        x: getMonthName(index),
        y: Random().nextInt(100),
      );
    })
  ];

  List<StackedColumnSeries<ChartModel, String>> _getStackedColumnSeries() {
    return <StackedColumnSeries<ChartModel, String>>[
      StackedColumnSeries<ChartModel, String>(
        dataSource: caseByDiseases,
        xValueMapper: (ChartModel data, _) => data.x,
        yValueMapper: (ChartModel data, _) => data.y,
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radius / 2),
        width: 0.9,
        name: 'Poin',
      ),
    ];
  }

  double getChartMaxY() {
    return caseByDiseases.reduce((x, y) => x.y > y.y ? x : y).y.toDouble();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
    );

    return Consumer<UserViewModel>(builder: (context, userViewModel, _) {
      if (userViewModel.user == null) {
        return const Scaffold(body: AppProgressIndicator());
      }

      return Scaffold(
        backgroundColor: AppColors.baseLv7,
        appBar: appBar(userViewModel),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);

            return false;
          },
          child: body(userViewModel),
        ),
      );
    });
  }

  AppBar appBar(UserViewModel userViewModel) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.baseLv7,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // TODO
            },
            child: Row(
              children: [
                AppImage(
                  image: userViewModel.user?.avatarUrl ?? '',
                  width: 32,
                  height: 32,
                  errorWidget: const Icon(
                    Icons.person_rounded,
                    color: AppColors.baseLv4,
                  ),
                  borderRadius: 100,
                  backgroundColor: AppColors.baseLv6,
                ),
                const SizedBox(width: AppSizes.padding / 2),
                Text(
                  'Hi, ${userViewModel.user?.firstName ?? ''}',
                  style: AppTextStyle.bold(context, fontSize: 18),
                ),
              ],
            ),
          ),
          AppButton(
            onTap: () {
              Navigator.pushNamed(
                context,
                ReferralDetailView.viewAsMeRouteName,
              );
            },
            text: '${userViewModel.userPoint}',
            fontSize: 14,
            leftIcon: Icons.stars_rounded,
            buttonColor: AppColors.yellow,
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding / 3,
              horizontal: AppSizes.padding / 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget body(UserViewModel userViewModel) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding,
        vertical: AppSizes.padding / 2,
      ),
      child: Column(
        children: [
          searchField(),
          userPointCard(userViewModel),
          userCommission(userViewModel),
          chart(),
          nextRewardTarget(),
          registeredMemberAndProgram(),
          orderStatus(),
          withdrawalStatus(),
          whatsAppConsulCard(),
          const SizedBox(height: AppSizes.height * 8)
        ],
      ),
    );
  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const AppTextField(
        prefixIcon: Icon(
          Icons.search,
        ),
        hintText: 'Cari Nama Anggota Anda',
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding / 2,
          vertical: AppSizes.padding / 4,
        ),
      ),
    );
  }

  Widget userPointCard(UserViewModel model) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.tangerine.withOpacity(0.26),
        borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 200,
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.dashboardUserPointCardIlusPath,
                  color: AppColors.tangerine.withOpacity(0.52),
                ),
                Positioned(
                  top: 40,
                  right: 4,
                  child: SizedBox(
                    width: 114,
                    height: 114,
                    child: Image.asset(
                      AppAssets.shortLogoPath,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.padding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.userPoint}',
                  style: AppTextStyle.extraBold(context, fontSize: 42),
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                Text(
                  'Point Kamu',
                  style: AppTextStyle.regular(context, fontSize: 14),
                ),
                const SizedBox(height: AppSizes.padding * 1.5),
                Text(
                  '${model.user?.firstName} ${model.user?.lastName}',
                  style: AppTextStyle.extraBold(context, fontSize: 20),
                ),
                const SizedBox(height: AppSizes.padding * 1.5),
                const Row(
                  children: [
                    AppIconButton(
                      backgroundColor: AppColors.white,
                      icon: Icons.info_outline,
                      iconSize: 22,
                      padding: EdgeInsets.all(AppSizes.padding / 2),
                    ),
                    SizedBox(width: AppSizes.padding / 2),
                    AppIconButton(
                      backgroundColor: AppColors.white,
                      icon: Icons.share_outlined,
                      iconSize: 22,
                      padding: EdgeInsets.all(AppSizes.padding / 2),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.padding * 1.5),
                userMemberCard(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userMemberCard() {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      return Container(
        padding: const EdgeInsets.all(AppSizes.padding / 2),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              onTap: () {
                // TODO

                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   ReferralView.viewAsMeRouteName,
                //   ModalRoute.withName(DashboardView.routeName),
                // );
              },
              text: 'Undang',
              fontSize: 12,
              leftIcon: Icons.add,
              padding: const EdgeInsets.all(
                AppSizes.padding / 2,
              ),
            ),
            Text(
              '${model.userMembers?.length ?? 0} Anggota',
              style: AppTextStyle.regular(
                context,
                fontSize: 12,
              ),
            ),
            userMemberThumbs(model.userMembers),
          ],
        ),
      );
    });
  }

  Widget userMemberThumbs(List<Query$UserFindMany$userFindMany>? userMembers) {
    if (userMembers == null || userMembers.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: 80,
      height: 26,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(userMembers.length > 4 ? 4 : userMembers.length, (i) {
            return Positioned(
              left: i == 0 ? 0 : i * 18,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    width: 2,
                    color: AppColors.white,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const AppImage(
                        image: randomImage,
                      ),
                      userMembers.length < 4
                          ? const SizedBox.shrink()
                          : Container(
                              width: 26,
                              height: 26,
                              color: AppColors.base.withOpacity(0.54),
                              child: Center(
                                child: Text(
                                  '+${userMembers.length - 4}',
                                  style: AppTextStyle.bold(
                                    context,
                                    fontSize: 10,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget userCommission(UserViewModel userViewModel) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 12,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    'TOTAL KOMISI SAAT INI',
                    style: AppTextStyle.bold(
                      context,
                      fontSize: 12,
                      color: AppColors.baseLv4,
                    ),
                  ),
                ],
              ),
              AppButton(
                onTap: () {
                  AppModal.show(
                    context: context,
                    title: 'Piilih Rentang',
                    child: periodList(),
                  );
                },
                text: 'BULAN',
                fontSize: 12,
                rightIcon: Icons.keyboard_arrow_down_rounded,
                buttonColor: Colors.transparent,
                textColor: AppColors.base,
                padding: EdgeInsets.zero,
              )
            ],
          ),
          const SizedBox(height: AppSizes.padding / 2),
          Text(
            CurrencyFormatter.format(userViewModel.userCommission),
            style: AppTextStyle.extraBold(
              context,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          SizedBox(
            width: 160,
            child: AppButton(
              onTap: () {
                // TODO
              },
              text: 'Cairkan Komisi',
              fontSize: 14,
              leftIcon: Icons.stars,
              iconColor: AppColors.yellow,
              padding: const EdgeInsets.all(AppSizes.padding / 2),
            ),
          )
        ],
      ),
    );
  }

  Widget periodList() {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: periods.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: null,
                  groupValue: null,
                  onChanged: (value) {},
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        periods[i],
                        style: AppTextStyle.bold(context),
                      ),
                      Text(
                        '18 Jul - 24 Jul',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 14,
                          color: AppColors.baseLv4,
                        ),
                      ),
                    ],
                  ),
                  activeColor: AppColors.primary,
                  contentPadding: const EdgeInsets.fromLTRB(
                    AppSizes.padding,
                    AppSizes.padding / 1.8,
                    AppSizes.padding * 1.5,
                    AppSizes.padding / 1.8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        AppButton(
          onTap: () {
            // TODO
            Navigator.pop(context);
          },
          text: 'Terapkan',
        ),
      ],
    );
  }

  Widget chart() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding / 2,
        vertical: AppSizes.padding * 1.5,
      ),
      height: 250,
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          labelStyle: AppTextStyle.medium(
            context,
            fontSize: 10,
            color: AppColors.baseLv4,
          ),
          interval: 1,
          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(
            color: AppColors.baseLv5,
            dashArray: [2, 6],
          ),
          majorTickLines: const MajorTickLines(size: 0),
          labelStyle: AppTextStyle.medium(
            context,
            fontSize: 8,
            color: AppColors.baseLv4,
          ),
          maximum: getChartMaxY() + 10,
        ),
        series: _getStackedColumnSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  Widget nextRewardTarget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Target Reward Berikutnya',
            style: AppTextStyle.bold(context, fontSize: 12),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            '95 Poin lagi dapatkan haidah Umroh gratis',
            style: AppTextStyle.regular(context, fontSize: 12),
          ),
          const SizedBox(height: AppSizes.padding),
          Container(
            height: 24,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.baseLv7,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              height: 24,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '25',
                style: AppTextStyle.bold(
                  context,
                  fontSize: 12,
                  color: AppColors.primary,
                ),
              ),
              Text(
                '100',
                style: AppTextStyle.bold(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget registeredMemberAndProgram() {
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      child: Row(
        children: [
          Expanded(child: registeredMember()),
          const SizedBox(width: AppSizes.padding / 1.2),
          programTotal(),
        ],
      ),
    );
  }

  Widget registeredMember() {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      return Container(
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SISWA\nTERDAFTAR',
                      style: AppTextStyle.bold(
                        context,
                        fontSize: 14,
                        color: AppColors.baseLv4,
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding / 2),
                    Text(
                      // TODO STUDENT COUNT
                      '${model.userMembers?.length ?? 0}',
                      style: AppTextStyle.extraBold(
                        context,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppSizes.padding / 2),
                AppIconButton(
                  onPressed: () {
                    // TODO
                  },
                  icon: Icons.people_alt_outlined,
                  iconSize: 32,
                  backgroundColor: AppColors.baseLv7,
                  padding: const EdgeInsets.all(AppSizes.padding / 2),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.padding),
            AppButton(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StudentRegistrationView.routeName,
                );
              },
              text: 'Daftarkan Siswa',
              fontSize: 12,
              leftIcon: Icons.stars,
              iconColor: AppColors.yellow,
              padding: const EdgeInsets.all(AppSizes.padding / 2),
            ),
          ],
        ),
      );
    });
  }

  Widget programTotal() {
    return Consumer<ProgramListViewModel>(builder: (context, model, _) {
      return Container(
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconButton(
              onPressed: () {
                // TODO
              },
              icon: Icons.campaign_rounded,
              iconSize: 16,
              backgroundColor: AppColors.baseLv7,
              padding: const EdgeInsets.all(AppSizes.padding / 2),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Text(
              'PROGRAM',
              style: AppTextStyle.bold(
                context,
                fontSize: 12,
                color: AppColors.baseLv4,
              ),
            ),
            const SizedBox(height: AppSizes.padding / 4),
            Text(
              '${model.programs?.length ?? 0}',
              style: AppTextStyle.extraBold(
                context,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            AppButton(
              onTap: () {
                // TODO
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   ProgramListView.routeName,
                //   ModalRoute.withName(DashboardView.routeName),
                // );
              },
              text: '2 Baru',
              fontSize: 10,
              rightIcon: Icons.arrow_right_alt_rounded,
              textColor: AppColors.base,
              buttonColor: AppColors.baseLv7,
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.padding / 2,
                horizontal: AppSizes.padding,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget orderStatus() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                ),
                const SizedBox(width: AppSizes.padding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Status',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        'Modul anda dalam proses pengiriman',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: AppSizes.padding),
          AppIconButton(
            onPressed: () {
              // TODO
            },
            icon: Icons.close,
            iconSize: 14,
          )
        ],
      ),
    );
  }

  Widget withdrawalStatus() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                ),
                const SizedBox(width: AppSizes.padding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Withdrawal Status',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        'Komisi anda sedang dalam proses pencairan',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: AppSizes.padding),
          AppIconButton(
            onPressed: () {
              // TODO
            },
            icon: Icons.close,
            iconSize: 14,
          )
        ],
      ),
    );
  }

  Widget whatsAppConsulCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.26),
        borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 200,
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.dashboardUserPointCardIlusPath,
                  color: AppColors.secondary.withOpacity(0.52),
                ),
                Positioned(
                  top: 40,
                  right: 4,
                  child: SizedBox(
                    width: 114,
                    height: 114,
                    child: Image.asset(
                      AppAssets.whatsAppIconPath,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.padding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.padding * 2),
                Text(
                  'Praktik Bahasa Inggris\nDari mana saja',
                  style: AppTextStyle.regular(context, fontSize: 14),
                ),
                const SizedBox(height: AppSizes.padding),
                Text(
                  'Konsultasi\nGratis',
                  style: AppTextStyle.extraBold(context, fontSize: 24),
                ),
                const SizedBox(height: AppSizes.padding * 2),
                AppButton(
                  onTap: () {
                    // TODO
                  },
                  text: 'Mulai Konsultasi Via WhatsApp',
                  fontSize: 14,
                  buttonColor: AppColors.secondary,
                  borderWidth: 8,
                  borderColor: AppColors.white,
                  padding: const EdgeInsets.all(AppSizes.padding / 1.5),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
