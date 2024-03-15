import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../app/utility/console_log.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/register_view_model.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_snackbar.dart';
import '../../../widget/organism/address/address_list_modal.dart';
import '../../../widget/organism/school/school_list_modal.dart';
import '../../../widget/organism/user_type/user_type_list_modal.dart';

class RegBiodata extends StatefulWidget {
  const RegBiodata({Key? key}) : super(key: key);

  @override
  State<RegBiodata> createState() => _RegBiodataState();
}

class _RegBiodataState extends State<RegBiodata> {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Consumer2<RegisterViewModel, AddressViewModel>(
      builder: (context, register, address, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
              child: Container(
                color: AppColors.white,
                child: AppTextFieldsWrapper(
                  textFields: [
                    AppTextField(
                      controller: register.firstNameCtrl,
                      suffixIcon: const Icon(
                        CupertinoIcons.person_alt_circle,
                      ),
                      lableText: 'Nama Depan',
                      hintText: "Agus",
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    AppTextField(
                      controller: register.lastNameCtrl,
                      suffixIcon: const Icon(
                        CupertinoIcons.person_alt_circle,
                      ),
                      lableText: 'Nama Belakang',
                      hintText: "Susanto",
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    AppTextField(
                      controller: register.addressNameCtrl,
                      suffixIcon: const Icon(
                        Icons.location_on_outlined,
                      ),
                      lableText: 'Alamat',
                      hintText: "Jl. Anggrek no. 51",
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    AppTextField(
                      enabled: false,
                      controller: register.provinceCtrl,
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
                          register.provinceId = province.id;
                          register.provinceCtrl.text = province.name;
                          register.cityCtrl.clear();
                          register.districtCtrl.clear();
                          register.subdistrictCtrl.clear();
                          register.postalCodeCtrl.clear();
                          address.selectedCity = null;
                          address.selectedDistrict = null;
                          address.selectedSubdistrict = null;
                          setState(() {});
                        }
                      },
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      lableText: 'Provinsi',
                      hintText: "Jawa Timur",
                      disabledColor: AppColors.base,
                    ),
                    AppTextField(
                      enabled: false,
                      controller: register.cityCtrl,
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        if (register.provinceId == null) {
                          AppSnackbar.show(navigator, title: 'Pilih provinsi terlebih dahulu');
                          return;
                        }

                        var city = await AppModal.show(
                          context: context,
                          title: 'Kota',
                          child: AddressListModal(
                            type: AddressType.city,
                            parentId: register.provinceId!,
                          ),
                        );

                        if (city != null) {
                          cl(city);
                          register.cityId = city.id;
                          register.cityCtrl.text = city.name;
                          register.districtCtrl.clear();
                          register.subdistrictCtrl.clear();
                          register.postalCodeCtrl.clear();
                          address.selectedDistrict = null;
                          address.selectedSubdistrict = null;
                          setState(() {});
                        }
                      },
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      lableText: 'Kota',
                      hintText: "Surabaya",
                      disabledColor: AppColors.base,
                    ),
                    AppTextField(
                      enabled: false,
                      controller: register.districtCtrl,
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        if (register.cityId == null) {
                          AppSnackbar.show(navigator, title: 'Pilih kota terlebih dahulu');
                          return;
                        }

                        var district = await AppModal.show(
                          context: context,
                          title: 'Kecamatan',
                          child: AddressListModal(
                            type: AddressType.district,
                            parentId: register.cityId!,
                          ),
                        );

                        if (district != null) {
                          cl(district);
                          register.districtId = district.id;
                          register.districtCtrl.text = district.name;
                          register.subdistrictCtrl.clear();
                          register.postalCodeCtrl.clear();
                          address.selectedSubdistrict = null;
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
                      controller: register.subdistrictCtrl,
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        if (register.districtId == null) {
                          AppSnackbar.show(navigator, title: 'Pilih kecamatan terlebih dahulu');
                          return;
                        }

                        var subdistrict = await AppModal.show(
                          context: context,
                          title: 'Kelurahan',
                          child: AddressListModal(
                            type: AddressType.subdistrict,
                            parentId: register.districtId!,
                          ),
                        );

                        if (subdistrict != null) {
                          cl(subdistrict);
                          register.subdistrictId = subdistrict.id;
                          register.subdistrictCtrl.text = subdistrict.name;
                          register.postalCodeCtrl.text = subdistrict.postalCode;
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
                      controller: register.postalCodeCtrl,
                      suffixIcon: const Icon(
                        CupertinoIcons.map_pin_ellipse,
                      ),
                      lableText: 'Kode Pos',
                      hintText: "12345",
                      disabledColor: AppColors.baseLv4,
                    ),
                    AppTextField(
                      enabled: false,
                      controller: register.schoolNameCtrl,
                      disabledColor: AppColors.base,
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        if (register.subdistrictId == null) {
                          AppSnackbar.show(navigator, title: 'Lengkapi alamat terlebih dahulu');
                          return;
                        }

                        var school = await AppModal.show(
                          context: context,
                          title: 'Sekolah',
                          child: SchoolListModal(
                            cityId: register.cityId!,
                            subdistrictId: register.subdistrictId!,
                          ),
                        );

                        if (school != null) {
                          cl(school);
                          register.selectedSchool = school;
                          register.schoolNameCtrl.text = school.name;
                          setState(() {});
                        }
                      },
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      lableText: 'Sekolah',
                    ),
                    // AppTextField(
                    //   enabled: false,
                    //   controller: register.userRoleNameCtrl,
                    //   disabledColor: AppColors.base,
                    //   onTap: () async {
                    //     FocusScope.of(context).unfocus();

                    //     var userRole = await AppModal.show(
                    //       context: context,
                    //       title: 'Pilih Role',
                    //       child: const UserRoleListModal(),
                    //     );

                    //     if (userRole != null && userRole is Enum$UserRole) {
                    //       cl(userRole);
                    //       register.selectedUserRole = userRole;
                    //       register.userRoleNameCtrl.text = userRole.name;
                    //       setState(() {});
                    //     }
                    //   },
                    //   suffixIcon: const Icon(
                    //     Icons.keyboard_arrow_down,
                    //   ),
                    //   lableText: 'Role',
                    // ),
                    AppTextField(
                      enabled: false,
                      controller: register.userTypeNameCtrl,
                      disabledColor: AppColors.base,
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        var userType = await AppModal.show(
                          context: context,
                          title: 'Pilih Pekerjaan',
                          child: const UserTypeListModal(),
                        );

                        if (userType != null && userType is Enum$UserType) {
                          cl(userType);
                          register.selectedUserType = userType;
                          register.userTypeNameCtrl.text = userType.name.replaceAll('_', ' ');
                          setState(() {});
                        }
                      },
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      lableText: 'Pekerjaan',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
              child: AppButton(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  register.tabController.animateTo(register.tabController.index + 1);
                },
                text: 'Berikutnya',
                enable: register.isBiodataFormValid(),
              ),
            )
          ],
        );
      },
    );
  }
}
