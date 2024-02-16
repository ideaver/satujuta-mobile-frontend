import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/hotel_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_find_many.graphql.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_modal.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/console_log.dart';
import '../../app/utility/validator.dart';
import '../../view_model/address_view_model.dart';
import '../../view_model/student_reg_view_model.dart';
import '../../widget/atom/app_dialog.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_snackbar.dart';
import '../../widget/atom/app_text_field.dart';
import '../../widget/atom/app_text_fields_wrapper.dart';
import '../../widget/organism/address/address_list_modal.dart';
import '../../widget/organism/school/school_list_modal.dart';
import '../hotel_picker/hotel_picker_view.dart';

enum StudentRegViewState {
  create,
  add,
  edit,
}

class StudentRegistrationView extends StatefulWidget {
  final StudentRegViewState viewState;

  const StudentRegistrationView({
    super.key,
    required this.viewState,
  });

  static const String createRouteName = '/student-reg-create';
  static const String addRouteName = '/student-reg-add';
  static const String editRouteName = '/student-reg-edit';

  const StudentRegistrationView.create({super.key, this.viewState = StudentRegViewState.create});
  const StudentRegistrationView.add({super.key, this.viewState = StudentRegViewState.add});
  const StudentRegistrationView.edit({super.key, this.viewState = StudentRegViewState.edit});

  @override
  State<StudentRegistrationView> createState() => _StudentRegistrationViewState();
}

class _StudentRegistrationViewState extends State<StudentRegistrationView> {
  final studentViewModel = locator<StudentRegViewModel>();

  @override
  void initState() {
    if (widget.viewState == StudentRegViewState.create) {
      studentViewModel.clearState();
    }

    if (widget.viewState == StudentRegViewState.add) {
      studentViewModel.clearState();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final currStudent = ModalRoute.of(context)?.settings.arguments as Query$UserFindMany$userFindMany?;

    if (widget.viewState == StudentRegViewState.edit) {
      studentViewModel.initEditProfileView(currStudent: currStudent);
    }

    return WillPopScope(
      onWillPop: () => AppDialog.showExitConfirmDialog(navigator),
      child: Scaffold(
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
                icon: Icons.person_add_alt_1_rounded,
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
            studentFormButton(student),
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
          AppTextField(
            controller: student.firstNameCtrl,
            suffixIcon: const Icon(
              CupertinoIcons.person_alt_circle,
            ),
            lableText: 'Nama Depan',
            hintText: 'Masukkkan Nama Depan Siswa',
            onChanged: (val) {
              setState(() {});
            },
          ),
          AppTextField(
            controller: student.lastNameCtrl,
            suffixIcon: const Icon(
              CupertinoIcons.person_alt_circle,
            ),
            lableText: 'Nama Belakang',
            hintText: 'Masukkkan Nama Belakang Siswa',
            onChanged: (val) {
              setState(() {});
            },
          ),
          AppTextField(
            controller: student.addressNameCtrl,
            suffixIcon: const Icon(
              Icons.location_on_outlined,
            ),
            lableText: 'Alamat',
            hintText: 'Masukkkan Alamat Siswa',
            onChanged: (val) {
              setState(() {});
            },
          ),
          AppTextField(
            enabled: false,
            controller: student.provinceCtrl,
            onTap: () async {
              FocusScope.of(context).unfocus();

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
                // Reset School & Hotel
                student.selectedSchool = null;
                student.schoolNameCtrl.clear();
                student.selectedHotel = null;
                student.hotelNameCtrl.clear();
                setState(() {});
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Provinsi',
            disabledColor: AppColors.base,
          ),
          AppTextField(
            enabled: false,
            controller: student.cityCtrl,
            onTap: () async {
              FocusScope.of(context).unfocus();

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
                // Reset School & Hotel
                student.selectedSchool = null;
                student.schoolNameCtrl.clear();
                student.selectedHotel = null;
                student.hotelNameCtrl.clear();
                setState(() {});
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Kota',
            disabledColor: AppColors.base,
          ),
          AppTextField(
            enabled: false,
            controller: student.districtCtrl,
            onTap: () async {
              FocusScope.of(context).unfocus();

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
                // Reset School & Hotel
                student.selectedSchool = null;
                student.schoolNameCtrl.clear();
                student.selectedHotel = null;
                student.hotelNameCtrl.clear();
                setState(() {});
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Kecamatan',
            disabledColor: AppColors.base,
          ),
          AppTextField(
            enabled: false,
            controller: student.subdistrictCtrl,
            onTap: () async {
              FocusScope.of(context).unfocus();

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
                // Reset School & Hotel
                student.selectedSchool = null;
                student.schoolNameCtrl.clear();
                student.selectedHotel = null;
                student.hotelNameCtrl.clear();
                setState(() {});
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
          ),
          AppTextField(
            controller: student.whatsappNumberCtrl,
            type: AppTextFieldType.number,
            suffixIcon: const Icon(
              CupertinoIcons.phone_circle,
            ),
            lableText: 'No. Whatsapp',
            hintText: 'Masukkan No. Whatsapp Aktif',
            onChanged: (val) {
              setState(() {});
            },
          ),
          AppTextField(
            controller: student.emailCtrl,
            suffixIcon: const Icon(
              CupertinoIcons.mail,
            ),
            lableText: 'Email',
            hintText: 'Masukkan Email Siswa',
            onChanged: (val) {
              setState(() {});
            },
          ),
          AppTextField(
            enabled: false,
            controller: student.schoolNameCtrl,
            disabledColor: AppColors.base,
            onTap: () async {
              FocusScope.of(context).unfocus();

              if (student.subdistrictId == null) {
                AppSnackbar.show(navigator, title: 'Lengkapi alamat terlebih dahulu');
                return;
              }

              var school = await AppModal.show(
                context: context,
                title: 'Pilih Sekolah',
                child: SchoolListModal(
                  cityId: student.cityId!,
                  subdistrictId: student.subdistrictId!,
                ),
              );

              if (school != null) {
                cl(school);
                student.selectedSchool = school;
                student.schoolNameCtrl.text = school.name;
                setState(() {});
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Sekolah',
          ),
          AppTextField(
            enabled: false,
            controller: student.hotelNameCtrl,
            disabledColor: AppColors.base,
            onTap: () async {
              FocusScope.of(context).unfocus();

              var hotel = await Navigator.pushNamed(
                context,
                HotelPicker.studentHotelRouteName,
                arguments: student.provinceId,
              );

              if (hotel != null && hotel is Query$HotelFindMany$hotelFindMany) {
                cl(hotel);
                student.selectedHotel = hotel;
                student.hotelNameCtrl.text = hotel.name;
                setState(() {});
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_right,
            ),
            lableText: 'Hotel',
          ),
          // AppTextField(
          //   controller: student.passwordCtrl,
          //   type: AppTextFieldType.password,
          //   lableText: 'Password Akun Siswa',
          //   onChanged: (val) {
          //     setState(() {});
          //   },
          // ),
        ],
      ),
    );
  }

  Widget validatorInfo(StudentRegViewModel model) {
    bool isEmailValid = Validator.isEmailValid(model.emailCtrl.text);
    bool isWhatsappNumberValid = Validator.isPhoneNumberValid(model.whatsappNumberCtrl.text);
    // bool isLengthMoreThan5 = model.passwordCtrl.text.length > 5;
    // bool isContainUppercase = Validator.isContainsUppercase(model.passwordCtrl.text);
    // bool isContainerNumber = Validator.isContainsNumber(model.passwordCtrl.text);

    return Column(
      children: [
        Opacity(
          opacity: isEmailValid ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isEmailValid ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Email valid',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Opacity(
          opacity: isWhatsappNumberValid ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isWhatsappNumberValid ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Nomor WhatsApp valid',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        // const SizedBox(height: AppSizes.padding / 2),
        // Opacity(
        //   opacity: isContainUppercase ? 1.0 : 0.5,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.check_circle,
        //         color: isContainUppercase ? AppColors.greenLv1 : AppColors.baseLv4,
        //         size: 18,
        //       ),
        //       const SizedBox(width: 6),
        //       Text(
        //         'Password mengandung karakter besar atau kecil',
        //         style: AppTextStyle.medium(context),
        //       ),
        //     ],
        //   ),
        // ),
        // const SizedBox(height: AppSizes.padding / 2),
        // Opacity(
        //   opacity: isLengthMoreThan5 ? 1.0 : 0.5,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.check_circle,
        //         color: isLengthMoreThan5 ? AppColors.greenLv1 : AppColors.baseLv4,
        //         size: 18,
        //       ),
        //       const SizedBox(width: 6),
        //       Text(
        //         'Password 6 atau lebih karakter',
        //         style: AppTextStyle.medium(context),
        //       ),
        //     ],
        //   ),
        // ),
        // const SizedBox(height: AppSizes.padding / 2),
        // Opacity(
        //   opacity: isContainerNumber ? 1.0 : 0.5,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.check_circle,
        //         color: isContainerNumber ? AppColors.greenLv1 : AppColors.baseLv4,
        //         size: 18,
        //       ),
        //       const SizedBox(width: 6),
        //       Text(
        //         'Password mengandung Setidaknya 1 angka',
        //         style: AppTextStyle.medium(context),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget studentFormButton(StudentRegViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: AppButton(
        onTap: () {
          FocusScope.of(context).unfocus();
          final navigator = Navigator.of(context);
          model.onTapStudentFormButton(
            navigator: navigator,
            viewState: widget.viewState,
          );
        },
        text: widget.viewState != StudentRegViewState.edit ? "Daftarkan Siswa" : "Perbarui Data Siswa",
        enable: model.studentButtonValidator(),
      ),
    );
  }
}
