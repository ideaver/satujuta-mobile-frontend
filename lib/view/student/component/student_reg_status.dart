import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/app/theme/app_shadows.dart';
import 'package:satujuta_app_mobile/widget/atom/app_progress_indicator.dart';
import 'package:satujuta_gql_client/operations/generated/user_find_many.graphql.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_expansion_list_tile.dart';
import '../../../../widget/atom/app_image.dart';
import '../../../app/service/locator/service_locator.dart';
import '../../../app/theme/app_theme.dart';
import '../../../view_model/member_list_view_model.dart';
import '../../../widget/atom/app_icon_button.dart';
import '../../checkout/student_checkout_view.dart';

class StudentRegStatus extends StatefulWidget {
  final bool isSuccess;

  const StudentRegStatus({super.key, required this.isSuccess});

  static const String successRouteName = '/student-status-success';
  static const String failedRouteName = '/student-status-failed';

  const StudentRegStatus.success({super.key, this.isSuccess = true});
  const StudentRegStatus.failed({super.key, this.isSuccess = false});

  @override
  State<StudentRegStatus> createState() => _StudentRegStatusState();
}

class _StudentRegStatusState extends State<StudentRegStatus> {
  ScrollController scrollController = ScrollController();
  ScrollController usersScrollController = ScrollController();

  final memberListViewModel = locator<MemberListViewModel>();

  bool isShow = false;
  // int a = 3;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      memberListViewModel.getAllUserMembers();
    });
    super.initState();
  }

  void expandCollapse(bool value) {
    isShow = value;
    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isShow) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
      } else {
        usersScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      AppTheme.lightOverlayStyle..copyWith(statusBarColor: AppColors.white),
    );

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                  child: AppImage(
                    image: widget.isSuccess ? AppAssets.successIlusPath : AppAssets.failedIlusPath,
                    imgProvider: ImgProvider.assetImage,
                  ),
                ),
                Text(
                  widget.isSuccess ? 'Data Berhasil Dibuat' : 'Data Gagal Dibuat',
                  style: AppTextStyle.bold(context, fontSize: 20),
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                Text(
                  'Harap melakukan pembayaran untuk\nmenambahkan siswa ini',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.semiBold(
                    context,
                    fontSize: 14,
                    color: AppColors.baseLv4,
                  ),
                ),
                const SizedBox(height: AppSizes.padding * 2),
                listStudentCard(),
                // const SizedBox(height: AppSizes.padding * 2),
                // validationButton(),
                const SizedBox(height: AppSizes.padding * 4),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: bottomButtons(),
    );
  }

  Widget listStudentCard() {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      if (model.userStudentsInactive == null) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
          child: AppProgressIndicator(),
        );
      }

      if (model.userStudentsInactive!.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
          child: Text(
            '(Kosong)',
            style: AppTextStyle.bold(context, color: AppColors.baseLv4),
          ),
        );
      }

      return AppExpansionListTile(
        icon: Icons.access_time_sharp,
        expand: true,
        title: '${model.userStudentsInactive!.length} Siswa Siap Didaftarkan',
        onChanged: expandCollapse,
        children: [
          studentList(model),
          expandCollapseButton(),
        ],
      );
    });
  }

  Widget studentList(MemberListViewModel model) {
    return Container(
      constraints: BoxConstraints(maxHeight: isShow ? AppSizes.screenSize.height / 2 : 112),
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 6),
        radius: const Radius.circular(100),
        child: SingleChildScrollView(
          controller: usersScrollController,
          physics: isShow ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              ...List.generate(model.userStudentsInactive!.length, (i) {
                return studentCard(model.userStudentsInactive![i], i);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget studentCard(Query$UserFindMany$userFindMany student, int i) {
    return Container(
      margin: EdgeInsets.only(
        top: i == 0 ? AppSizes.padding / 4 : 0,
        bottom: AppSizes.padding / 2,
      ),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${student.firstName} ${student.lastName}',
                style: AppTextStyle.extraBold(
                  context,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: AppSizes.padding / 4),
              Text(
                student.whatsappNumber,
                style: AppTextStyle.regular(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
              const SizedBox(height: AppSizes.padding / 2),
              Text(
                student.address.name,
                style: AppTextStyle.regular(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppIconButton(
                onPressed: () {
                  Navigator.pop(context, student);
                },
                icon: CustomIcon.edit_icon,
                backgroundColor: AppColors.baseLv6,
                padding: const EdgeInsets.all(AppSizes.padding / 2),
                iconColor: AppColors.base,
                iconSize: 18,
              ),
              const SizedBox(width: AppSizes.padding / 2),
              AppIconButton(
                onPressed: () {
                  // TODO REMOVE USER
                },
                icon: CustomIcon.trash_icon,
                backgroundColor: AppColors.baseLv6,
                padding: const EdgeInsets.all(AppSizes.padding / 2),
                iconColor: AppColors.base,
                iconSize: 18,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget bottomButtons() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding / 2),
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [AppShadows.bottomNav],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Tambah Siswa',
              textColor: AppColors.primary,
              buttonColor: AppColors.primary.withOpacity(0.12),
              padding: EdgeInsets.zero,
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
                Navigator.pushNamed(context, StudentCheckoutView.routeName);
              },
              text: 'Bayar',
              padding: EdgeInsets.zero,
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

  Widget expandCollapseButton() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding / 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: ElevatedButton(
        onPressed: () async {
          expandCollapse(!isShow);
        },
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              !isShow ? 'Tampilkan Semua' : 'Sembunyikan ',
              style: AppTextStyle.bold(context, fontSize: 14, color: AppColors.primary),
            ),
            const SizedBox(width: AppSizes.height),
            Icon(
              !isShow ? Icons.arrow_downward : Icons.arrow_upward,
              size: AppSizes.height,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
