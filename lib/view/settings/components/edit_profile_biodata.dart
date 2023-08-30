import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../app/utility/console_log.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/edit_profile_view_model.dart';
import '../../../widget/atom/app_snackbar.dart';
import '../../../widget/organism/address/address_list_modal.dart';

class EditProfileBiodata extends StatefulWidget {
  const EditProfileBiodata({
    super.key,
    this.name,
    this.address,
    this.city,
    this.posCode,
    this.noWa,
    this.email,
  });

  final String? name;
  final String? address;
  final String? city;

  final String? posCode;
  final String? noWa;
  final String? email;

  @override
  State<EditProfileBiodata> createState() => _EditProfileBiodataState();
}

class _EditProfileBiodataState extends State<EditProfileBiodata> {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Consumer2<EditProfileViewModel, AddressViewModel>(
      builder: (context, editProfile, address, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
          child: Container(
            color: AppColors.white,
            child: AppTextFieldsWrapper(
              textFields: [
                AppTextField(
                  controller: editProfile.firstNameCtrl,
                  suffixIcon: const Icon(
                    CupertinoIcons.home,
                  ),
                  lableText: 'Nama Depan',
                  hintText: widget.name,
                ),
                AppTextField(
                  controller: editProfile.lastNameCtrl,
                  suffixIcon: const Icon(
                    CupertinoIcons.home,
                  ),
                  lableText: 'Nama Belakang',
                  hintText: widget.name,
                ),
                AppTextField(
                  controller: editProfile.addressNameCtrl,
                  suffixIcon: const Icon(
                    Icons.location_on_outlined,
                  ),
                  lableText: 'Alamat',
                  hintText: widget.address,
                ),
                AppTextField(
                  enabled: false,
                  controller: editProfile.provinceCtrl,
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
                      editProfile.provinceId = province.id;
                      editProfile.provinceCtrl.text = province.name;
                      editProfile.cityCtrl.clear();
                      editProfile.districtCtrl.clear();
                      editProfile.subdistrictCtrl.clear();
                      editProfile.postalCodeCtrl.clear();
                      address.selectedCity = null;
                      address.selectedDistrict = null;
                      address.selectedSubdistrict = null;
                    }
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Provinsi',
                  hintText: widget.city,
                  disabledColor: AppColors.base,
                ),
                AppTextField(
                  enabled: false,
                  controller: editProfile.cityCtrl,
                  onTap: () async {
                    FocusScope.of(context).unfocus();

                    if (editProfile.provinceId == null) {
                      AppSnackbar.show(navigator, title: 'Pilih provinsi terlebih dahulu');
                      return;
                    }

                    var city = await AppModal.show(
                      context: context,
                      title: 'Kota',
                      child: AddressListModal(
                        type: AddressType.city,
                        parentId: editProfile.provinceId!,
                      ),
                    );

                    if (city != null) {
                      cl(city);
                      editProfile.cityId = city.id;
                      editProfile.cityCtrl.text = city.name;
                      editProfile.districtCtrl.clear();
                      editProfile.subdistrictCtrl.clear();
                      editProfile.postalCodeCtrl.clear();
                      address.selectedDistrict = null;
                      address.selectedSubdistrict = null;
                    }
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Kota',
                  hintText: widget.city,
                  disabledColor: AppColors.base,
                ),
                AppTextField(
                  enabled: false,
                  controller: editProfile.districtCtrl,
                  onTap: () async {
                    FocusScope.of(context).unfocus();

                    if (editProfile.cityId == null) {
                      AppSnackbar.show(navigator, title: 'Pilih kota terlebih dahulu');
                      return;
                    }

                    var district = await AppModal.show(
                      context: context,
                      title: 'Kecamatan',
                      child: AddressListModal(
                        type: AddressType.district,
                        parentId: editProfile.cityId!,
                      ),
                    );

                    if (district != null) {
                      cl(district);
                      editProfile.districtId = district.id;
                      editProfile.districtCtrl.text = district.name;
                      editProfile.subdistrictCtrl.clear();
                      editProfile.postalCodeCtrl.clear();
                      address.selectedSubdistrict = null;
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
                  controller: editProfile.subdistrictCtrl,
                  onTap: () async {
                    FocusScope.of(context).unfocus();

                    if (editProfile.districtId == null) {
                      AppSnackbar.show(navigator, title: 'Pilih kecamatan terlebih dahulu');
                      return;
                    }

                    var subdistrict = await AppModal.show(
                      context: context,
                      title: 'Kelurahan',
                      child: AddressListModal(
                        type: AddressType.subdistrict,
                        parentId: editProfile.districtId!,
                      ),
                    );

                    if (subdistrict != null) {
                      cl(subdistrict);
                      editProfile.subdistrictId = subdistrict.id;
                      editProfile.subdistrictCtrl.text = subdistrict.name;
                      editProfile.postalCodeCtrl.text = subdistrict.postalCode;
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
                  controller: editProfile.postalCodeCtrl,
                  suffixIcon: const Icon(
                    CupertinoIcons.map_pin_ellipse,
                  ),
                  lableText: 'Kode Pos',
                  hintText: widget.posCode,
                  disabledColor: AppColors.base,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget roleList() {
  //   return Column(
  //     children: [
  //       Container(
  //         constraints: BoxConstraints(
  //           maxHeight: MediaQuery.of(context).size.height - 200,
  //         ),
  //         child: ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: 5,
  //           itemBuilder: (context, i) {
  //             return Container(
  //               margin: const EdgeInsets.only(bottom: 6),
  //               decoration: BoxDecoration(
  //                 color: AppColors.white,
  //                 borderRadius: BorderRadius.circular(AppSizes.radius),
  //               ),
  //               child: RadioListTile(
  //                 value: null,
  //                 groupValue: null,
  //                 onChanged: (value) {},
  //                 title: Text(
  //                   'Siswa',
  //                   style: AppTextStyle.bold(context),
  //                 ),
  //                 activeColor: AppColors.primary,
  //                 contentPadding: const EdgeInsets.fromLTRB(
  //                   AppSizes.padding,
  //                   AppSizes.padding / 1.8,
  //                   AppSizes.padding / 1.8,
  //                   AppSizes.padding / 1.8,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(AppSizes.radius),
  //                 ),
  //                 controlAffinity: ListTileControlAffinity.trailing,
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //       const SizedBox(height: AppSizes.padding),
  //       AppButton(
  //         onTap: () {
  //           // TODO
  //           Navigator.pop(context);
  //         },
  //         text: 'Pilih',
  //       ),
  //     ],
  //   );
  // }
}
