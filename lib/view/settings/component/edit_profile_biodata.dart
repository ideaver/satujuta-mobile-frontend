import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/app/service/locator/service_locator.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_app_mobile/widget/atom/app_progress_indicator.dart';
import 'package:satujuta_app_mobile/widget/atom/app_snackbar.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/edit_profile_view_model.dart';

enum AddressType {
  province,
  city,
  district,
  subdistrict,
}

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
                    CupertinoIcons.person,
                  ),
                  lableText: 'Nama Depan',
                  hintText: widget.name,
                ),
                AppTextField(
                  controller: editProfile.lastNameCtrl,
                  suffixIcon: const Icon(
                    CupertinoIcons.person,
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
                    var province = await AppModal.show(
                      context: context,
                      title: 'Provinsi',
                      child: addressList(AddressType.province, 0),
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
                    if (editProfile.provinceId == null) {
                      AppSnackbar.show(navigator, title: 'Pilih provinsi terlebih dahulu');
                      return;
                    }

                    var city = await AppModal.show(
                      context: context,
                      title: 'Kota',
                      child: addressList(AddressType.city, editProfile.provinceId!),
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
                    if (editProfile.cityId == null) {
                      AppSnackbar.show(navigator, title: 'Pilih kota terlebih dahulu');
                      return;
                    }

                    var district = await AppModal.show(
                      context: context,
                      title: 'Kecamatan',
                      child: addressList(AddressType.district, editProfile.cityId!),
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
                    if (editProfile.districtId == null) {
                      AppSnackbar.show(navigator, title: 'Pilih kecamatan terlebih dahulu');
                      return;
                    }

                    var subdistrict = await AppModal.show(
                      context: context,
                      title: 'Kelurahan',
                      child: addressList(AddressType.subdistrict, editProfile.districtId!),
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
                    CupertinoIcons.mail,
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

  Widget addressList(AddressType type, int parentId) {
    final navigator = Navigator.of(context);
    final addressViewModel = locator<AddressViewModel>();

    if (type == AddressType.province) {
      addressViewModel.getProvinces(navigator);
    }

    if (type == AddressType.city) {
      addressViewModel.getCities(navigator, provinceId: parentId);
    }

    if (type == AddressType.district) {
      addressViewModel.getDistrict(navigator, cityId: parentId);
    }

    if (type == AddressType.subdistrict) {
      addressViewModel.getSubdistrict(navigator, districtId: parentId);
    }

    return Consumer<AddressViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: AppTextField(
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText:
                  'Cari ${type == AddressType.province ? 'Provinsi' : type == AddressType.city ? 'Kota' : type == AddressType.district ? 'Kecamatan' : 'Kelurahan'}',
              onChanged: (val) async {
                await Future.delayed(const Duration(seconds: 1));

                if (type == AddressType.province) {
                  await model.getProvinces(navigator, contains: val);
                }

                if (type == AddressType.city) {
                  await model.getCities(navigator, provinceId: parentId, contains: val);
                }

                if (type == AddressType.district) {
                  await model.getDistrict(navigator, cityId: parentId, contains: val);
                }

                if (type == AddressType.subdistrict) {
                  await model.getSubdistrict(navigator, districtId: parentId, contains: val);
                }
              },
            ),
          ),
          const SizedBox(height: AppSizes.padding),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 300,
            ),
            child: (type == AddressType.province
                    ? model.provinceFindMany == null
                    : type == AddressType.city
                        ? model.cityFindMany == null
                        : type == AddressType.district
                            ? model.districtFindMany == null
                            : model.subdistrictFindMany == null)
                ? const Padding(
                    padding: EdgeInsets.all(32),
                    child: AppProgressIndicator(),
                  )
                : (type == AddressType.province
                        ? model.provinceFindMany!.isEmpty
                        : type == AddressType.city
                            ? model.cityFindMany!.isEmpty
                            : type == AddressType.district
                                ? model.districtFindMany!.isEmpty
                                : model.subdistrictFindMany!.isEmpty)
                    ? Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          '(Kosong)',
                          style: AppTextStyle.bold(context, color: AppColors.baseLv5),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: type == AddressType.province
                            ? model.provinceFindMany!.length
                            : type == AddressType.city
                                ? model.cityFindMany!.length
                                : type == AddressType.district
                                    ? model.districtFindMany!.length
                                    : model.subdistrictFindMany!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSizes.radius),
                            ),
                            child: RadioListTile(
                              value: type == AddressType.province
                                  ? model.selectedProvince
                                  : type == AddressType.city
                                      ? model.selectedCity
                                      : type == AddressType.district
                                          ? model.selectedDistrict
                                          : model.selectedSubdistrict,
                              groupValue: type == AddressType.province
                                  ? model.provinceFindMany![i]
                                  : type == AddressType.city
                                      ? model.cityFindMany![i]
                                      : type == AddressType.district
                                          ? model.districtFindMany![i]
                                          : model.subdistrictFindMany![i],
                              onChanged: (value) {
                                if (type == AddressType.province) {
                                  model.onSelectProvince(model.provinceFindMany![i]);
                                }

                                if (type == AddressType.city) {
                                  model.onSelectCity(model.cityFindMany![i]);
                                }

                                if (type == AddressType.district) {
                                  model.onSelectDistrict(model.districtFindMany![i]);
                                }

                                if (type == AddressType.subdistrict) {
                                  model.onSelectSubdistrict(model.subdistrictFindMany![i]);
                                }
                              },
                              title: Text(
                                type == AddressType.province
                                    ? model.provinceFindMany![i].name
                                    : type == AddressType.city
                                        ? model.cityFindMany![i].name
                                        : type == AddressType.district
                                            ? model.districtFindMany![i].name
                                            : model.subdistrictFindMany![i].name,
                                style: AppTextStyle.bold(context),
                              ),
                              activeColor: AppColors.primary,
                              contentPadding: const EdgeInsets.fromLTRB(
                                AppSizes.padding,
                                AppSizes.padding / 1.8,
                                AppSizes.padding / 1.8,
                                AppSizes.padding / 1.8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSizes.radius),
                              ),
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          );
                        },
                      ),
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            onTap: () {
              if (type == AddressType.province) {
                Navigator.pop(context, model.selectedProvince);
              }

              if (type == AddressType.city) {
                Navigator.pop(context, model.selectedCity);
              }

              if (type == AddressType.district) {
                Navigator.pop(context, model.selectedDistrict);
              }

              if (type == AddressType.subdistrict) {
                Navigator.pop(context, model.selectedSubdistrict);
              }
            },
            enable: (type == AddressType.province
                ? model.selectedProvince != null
                : type == AddressType.city
                    ? model.selectedCity != null
                    : type == AddressType.district
                        ? model.selectedDistrict != null
                        : model.selectedSubdistrict != null),
            text: 'Pilih',
          ),
        ],
      );
    });
  }
}
