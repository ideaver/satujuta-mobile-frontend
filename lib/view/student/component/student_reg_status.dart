import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_expansion_list_tile.dart';
import '../../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_icon_button.dart';
import '../../checkout/student_checkout_view.dart';

class StudentRegStatus extends StatefulWidget {
  const StudentRegStatus({
    super.key,
  });

  static const String routeName = '/student-reg-status';

  @override
  State<StudentRegStatus> createState() => _StudentRegStatusState();
}

class _StudentRegStatusState extends State<StudentRegStatus> {
  bool isShow = true;
  int a = 3;

  @override
  Widget build(BuildContext context) {
    bool isSuccess = ModalRoute.of(context)?.settings.arguments as bool;

    return SizedBox(
      height: MediaQuery.of(context).size.height - (AppSizes.padding * 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                child: AppImage(
                  image: isSuccess ? AppAssets.successIlusPath : AppAssets.failedIlusPath,
                  imgProvider: ImgProvider.assetImage,
                ),
              ),
              Text(
                isSuccess ? 'Data Berhasil Dibuat' : 'Data Gagal Dibuat',
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
              const SizedBox(height: AppSizes.padding * 4),
              listStudentCard(),
              const SizedBox(height: AppSizes.padding * 2),
              validationButton(),
              const SizedBox(height: AppSizes.padding * 2),
            ]),
          ],
        ),
      ),
    );
  }

  Widget listStudentCard() {
    return AppExpansionListTile(
      icon: Icons.access_time_sharp,
      expand: true,
      children: [
        ...List.generate(a, (i) {
          return studentCard(i);
        }),
        showButton(() {
          // TODO
          setState(() {
            isShow ? a = 5 : a = 3;
            isShow ? isShow = false : isShow = true;
          });
        })
      ],
      title: '1 Siswa Siap Daftarkan',
    );
  }

  Widget validationButton() {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onTap: () {
              // TODO
              Navigator.pop(context);
            },
            text: 'Tambah Siswa',
            textColor: AppColors.primary,
            buttonColor: AppColors.primary.withOpacity(0.12),
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
      ],
    );
  }

  Widget studentCard(int i) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                i == 0 ? 'Lusy Joolmin' : 'Leo Leonardo',
                style: AppTextStyle.extraBold(
                  context,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: AppSizes.padding / 4),
              Text(
                '081234567890',
                style: AppTextStyle.regular(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
              const SizedBox(height: AppSizes.padding / 2),
              Text(
                i == 0 ? 'SD Bakti Luhur, Bandung' : 'SD Setia Hati, Jakarta',
                style: AppTextStyle.regular(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              AppIconButton(
                icon: CustomIcon.edit_icon,
                backgroundColor: AppColors.baseLv6,
                padding: EdgeInsets.all(AppSizes.padding / 2),
                iconColor: AppColors.base,
                iconSize: 18,
              ),
              SizedBox(width: AppSizes.padding / 2),
              AppIconButton(
                icon: CustomIcon.trash_icon,
                backgroundColor: AppColors.baseLv6,
                padding: EdgeInsets.all(AppSizes.padding / 2),
                iconColor: AppColors.base,
                iconSize: 18,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget showButton(dynamic functionButton) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding / 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: ElevatedButton(
        onPressed: functionButton,
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
              isShow ? 'Tampilkan Semua' : 'Sembunyikan ',
              style: AppTextStyle.bold(context, fontSize: 14, color: AppColors.primary),
            ),
            SizedBox(
              width: AppSizes.height,
            ),
            Icon(
              isShow ? Icons.arrow_downward : Icons.arrow_upward,
              size: AppSizes.height,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
