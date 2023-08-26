import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_modal.dart';
import '../../app/utility/console_log.dart';
import '../../view_model/address_view_model.dart';
import '../../view_model/student_reg_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_snackbar.dart';
import '../../widget/atom/app_text_field.dart';
import '../../widget/atom/app_text_fields_wrapper.dart';
import '../../widget/organism/address/address_list_modal.dart';
import '../hotel_picker/student_hotel_picker_view.dart';
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
      collapsedHeight: 60,
      elevation: 0.5,
      flexibleSpace: FlexibleSpaceBar(
        title: title(),
        background: sliverBackground(),
        expandedTitleScale: 1.2,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          // vertical: AppSizes.padding / 1.2,
        ),
      ),
    );
  }

  Widget title() {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 12),
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
                const SizedBox(height: AppSizes.padding / 6),
                Text(
                  "Isi data siswa untuk didaftarkan",
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
              ),
            ),
          ],
        ),
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
    return Consumer2<StudentRegViewModel, AddressViewModel>(builder: (context, student, address, _) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            form(student, address),
            validatorInfo(student),
            nextButton(student),
          ],
        ),
      );
    });
  }

  Widget form(StudentRegViewModel student, AddressViewModel address) {
    final navigator = Navigator.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: AppTextFieldsWrapper(
        textFields: [
          const AppTextField(
            suffixIcon: Icon(
              CupertinoIcons.person_alt_circle,
            ),
            lableText: 'Nama',
            hintText: 'Masukkkan Nama Lengkap Siswa',
          ),
          const AppTextField(
            suffixIcon: Icon(
              Icons.location_on_outlined,
            ),
            lableText: 'Alamat',
            hintText: 'Masukkkan Nama Lengkap Siswa',
          ),
          AppTextField(
            enabled: false,
            onTap: () async {
              var province = await AppModal.show(
                context: context,
                title: 'Provinsi',
                child: const AddressListModal(
                  type: AddressType.province,
                  parentId: 0,
                ),
              );

              if (province != null) {
                cl(province);
                student.provinceId = province.id;
                student.provinceCtrl.text = province.name;
                student.cityCtrl.clear();
                student.districtCtrl.clear();
                student.subdistrictCtrl.clear();
                student.postalCodeCtrl.clear();
                address.selectedCity = null;
                address.selectedDistrict = null;
                address.selectedSubdistrict = null;
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Provinsi',
          ),
          AppTextField(
            enabled: false,
            onTap: () async {
              if (student.provinceId == null) {
                AppSnackbar.show(navigator, title: 'Pilih provinsi terlebih dahulu');
                return;
              }

              var city = await AppModal.show(
                context: context,
                title: 'Kota',
                child: AddressListModal(
                  type: AddressType.city,
                  parentId: student.provinceId!,
                ),
              );

              if (city != null) {
                cl(city);
                student.cityId = city.id;
                student.cityCtrl.text = city.name;
                student.districtCtrl.clear();
                student.subdistrictCtrl.clear();
                student.postalCodeCtrl.clear();
                address.selectedDistrict = null;
                address.selectedSubdistrict = null;
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Kota',
          ),
          AppTextField(
            enabled: false,
            onTap: () async {
              if (student.cityId == null) {
                AppSnackbar.show(navigator, title: 'Pilih kota terlebih dahulu');
                return;
              }

              var district = await AppModal.show(
                context: context,
                title: 'Kecamatan',
                child: AddressListModal(
                  type: AddressType.district,
                  parentId: student.cityId!,
                ),
              );

              if (district != null) {
                cl(district);
                student.districtId = district.id;
                student.districtCtrl.text = district.name;
                student.subdistrictCtrl.clear();
                student.postalCodeCtrl.clear();
                address.selectedSubdistrict = null;
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Kecamatan',
          ),
          AppTextField(
            enabled: false,
            controller: student.subdistrictCtrl,
            onTap: () async {
              if (student.districtId == null) {
                AppSnackbar.show(navigator, title: 'Pilih kecamatan terlebih dahulu');
                return;
              }

              var subdistrict = await AppModal.show(
                context: context,
                title: 'Kelurahan',
                child: AddressListModal(
                  type: AddressType.subdistrict,
                  parentId: student.districtId!,
                ),
              );

              if (subdistrict != null) {
                cl(subdistrict);
                student.subdistrictId = subdistrict.id;
                student.subdistrictCtrl.text = subdistrict.name;
                student.postalCodeCtrl.text = subdistrict.postalCode;
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Kelurahan',
            disabledColor: AppColors.base,
          ),
          AppTextField(
            enabled: false,
            controller: student.postalCodeCtrl,
            suffixIcon: const Icon(
              CupertinoIcons.map_pin_ellipse,
            ),
            lableText: 'Kode Pos',
            hintText: '60241',
            disabledColor: AppColors.base,
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              CupertinoIcons.phone_circle,
            ),
            lableText: 'No. Whatsapp',
            hintText: 'Masukkan No. Whatsapp Aktif',
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              CupertinoIcons.mail,
            ),
            lableText: 'Email',
            hintText: 'Masukkan Email Siswa',
          ),
          AppTextField(
            enabled: false,
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_right,
            ),
            lableText: 'Sekolah',
          ),
          AppTextField(
            enabled: false,
            onTap: () {
              // TODO
              Navigator.pushNamed(context, StudentHotelPickerView.routeName);
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_right,
            ),
            lableText: 'Hotel',
          ),
        ],
      ),
    );
  }

  Widget validatorInfo(StudentRegViewModel model) {
    bool isEmailValid = model.emailCtrl.text.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(model.emailCtrl.text);
    bool isWhatsappNumberValid = model.whatsappNumberCtrl.text.isNotEmpty &&
        RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(model.whatsappNumberCtrl.text);

    return Column(
      children: [
        Visibility(
          visible: isEmailValid,
          child: Row(
            children: [
              const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Email tidak valid',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Visibility(
          visible: isWhatsappNumberValid,
          child: Row(
            children: [
              const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Nomor WhatsApp tidak valid',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget nextButton(StudentRegViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: AppButton(
        text: "Berikutnya",
        onTap: () {
          Navigator.pushNamed(context, StudentRegStatus.routeName);
        },
      ),
    );
  }
}
