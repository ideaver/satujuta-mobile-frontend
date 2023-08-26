import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/service/locator/service_locator.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../view_model/address_view_model.dart';
import '../../atom/app_button.dart';
import '../../atom/app_progress_indicator.dart';
import '../../atom/app_text_field.dart';

enum AddressType {
  province,
  city,
  district,
  subdistrict,
}

class AddressListModal extends StatelessWidget {
  final AddressType type;
  final int parentId;

  const AddressListModal({
    super.key,
    required this.type,
    required this.parentId,
  });

  @override
  Widget build(BuildContext context) {
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
