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

class AddressListModal extends StatefulWidget {
  final AddressType type;
  final int parentId;

  const AddressListModal({
    super.key,
    required this.type,
    required this.parentId,
  });

  @override
  State<AddressListModal> createState() => _AddressListModalState();
}

class _AddressListModalState extends State<AddressListModal> {
  final scrollController = ScrollController();

  final addressViewModel = locator<AddressViewModel>();

  @override
  void initState() {
    scrollController.addListener(scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigator = Navigator.of(context);

      if (widget.type == AddressType.province) {
        addressViewModel.getProvinces(navigator);
      }

      if (widget.type == AddressType.city) {
        addressViewModel.getCities(navigator, provinceId: widget.parentId);
      }

      if (widget.type == AddressType.district) {
        addressViewModel.getDistrict(navigator, cityId: widget.parentId);
      }

      if (widget.type == AddressType.subdistrict) {
        addressViewModel.getSubdistrict(navigator, districtId: widget.parentId);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    final navigator = Navigator.of(context);

    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      if (widget.type == AddressType.province) {
        addressViewModel.getProvinces(
          navigator,
          skip: (addressViewModel.provinceFindMany?.length ?? 0),
        );
      }

      if (widget.type == AddressType.city) {
        addressViewModel.getCities(
          navigator,
          provinceId: widget.parentId,
          skip: (addressViewModel.cityFindMany?.length ?? 0),
        );
      }

      if (widget.type == AddressType.district) {
        addressViewModel.getDistrict(
          navigator,
          cityId: widget.parentId,
          skip: (addressViewModel.districtFindMany?.length ?? 0),
        );
      }

      if (widget.type == AddressType.subdistrict) {
        addressViewModel.getSubdistrict(
          navigator,
          districtId: widget.parentId,
          skip: (addressViewModel.subdistrictFindMany?.length ?? 0),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Consumer<AddressViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          searchField(navigator, model),
          const SizedBox(height: AppSizes.padding),
          addressList(navigator, model),
          const SizedBox(height: AppSizes.padding),
          chooseButton(navigator, model),
        ],
      );
    });
  }

  Widget searchField(NavigatorState navigator, AddressViewModel model) {
    var hintTextName = widget.type == AddressType.province
        ? 'Provinsi'
        : widget.type == AddressType.city
            ? 'Kota'
            : widget.type == AddressType.district
                ? 'Kecamatan'
                : 'Kelurahan';

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: AppTextField(
        prefixIcon: const Icon(
          Icons.search,
        ),
        hintText: 'Cari $hintTextName',
        onChanged: (val) async {
          if (val.length % 3 == 0) {
            if (widget.type == AddressType.province) {
              await model.getProvinces(navigator, contains: val);
            }

            if (widget.type == AddressType.city) {
              await model.getCities(navigator, provinceId: widget.parentId, contains: val);
            }

            if (widget.type == AddressType.district) {
              await model.getDistrict(navigator, cityId: widget.parentId, contains: val);
            }

            if (widget.type == AddressType.subdistrict) {
              await model.getSubdistrict(navigator, districtId: widget.parentId, contains: val);
            }
          }
        },
      ),
    );
  }

  Widget addressList(NavigatorState navigator, AddressViewModel model) {
    if (widget.type == AddressType.province
        ? model.provinceFindMany == null
        : widget.type == AddressType.city
            ? model.cityFindMany == null
            : widget.type == AddressType.district
                ? model.districtFindMany == null
                : model.subdistrictFindMany == null) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: AppProgressIndicator(),
      );
    }

    if (widget.type == AddressType.province
        ? model.provinceFindMany!.isEmpty
        : widget.type == AddressType.city
            ? model.cityFindMany!.isEmpty
            : widget.type == AddressType.district
                ? model.districtFindMany!.isEmpty
                : model.subdistrictFindMany!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          '(Kosong)',
          style: AppTextStyle.bold(context, color: AppColors.baseLv5),
        ),
      );
    }

    var itemCount = widget.type == AddressType.province
        ? model.provinceFindMany!.length
        : widget.type == AddressType.city
            ? model.cityFindMany!.length
            : widget.type == AddressType.district
                ? model.districtFindMany!.length
                : model.subdistrictFindMany!.length;

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 300),
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 6),
        radius: const Radius.circular(100),
        child: ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: itemCount,
          itemBuilder: (context, i) {
            return addressListTile(model, i);
          },
        ),
      ),
    );
  }

  Widget addressListTile(AddressViewModel model, int i) {
    var value = widget.type == AddressType.province
        ? model.selectedProvince
        : widget.type == AddressType.city
            ? model.selectedCity
            : widget.type == AddressType.district
                ? model.selectedDistrict
                : model.selectedSubdistrict;

    var groupValue = widget.type == AddressType.province
        ? model.provinceFindMany![i]
        : widget.type == AddressType.city
            ? model.cityFindMany![i]
            : widget.type == AddressType.district
                ? model.districtFindMany![i]
                : model.subdistrictFindMany![i];

    var title = widget.type == AddressType.province
        ? model.provinceFindMany![i].name
        : widget.type == AddressType.city
            ? model.cityFindMany![i].name
            : widget.type == AddressType.district
                ? model.districtFindMany![i].name
                : model.subdistrictFindMany![i].name;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          if (widget.type == AddressType.province) {
            model.onSelectProvince(model.provinceFindMany![i]);
          }

          if (widget.type == AddressType.city) {
            model.onSelectCity(model.cityFindMany![i]);
          }

          if (widget.type == AddressType.district) {
            model.onSelectDistrict(model.districtFindMany![i]);
          }

          if (widget.type == AddressType.subdistrict) {
            model.onSelectSubdistrict(model.subdistrictFindMany![i]);
          }
        },
        title: Text(
          title,
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
  }

  Widget chooseButton(NavigatorState navigator, AddressViewModel model) {
    bool enable = widget.type == AddressType.province
        ? model.selectedProvince != null
        : widget.type == AddressType.city
            ? model.selectedCity != null
            : widget.type == AddressType.district
                ? model.selectedDistrict != null
                : model.selectedSubdistrict != null;

    return AppButton(
      onTap: () {
        if (widget.type == AddressType.province) {
          Navigator.pop(context, model.selectedProvince);
        }

        if (widget.type == AddressType.city) {
          Navigator.pop(context, model.selectedCity);
        }

        if (widget.type == AddressType.district) {
          Navigator.pop(context, model.selectedDistrict);
        }

        if (widget.type == AddressType.subdistrict) {
          Navigator.pop(context, model.selectedSubdistrict);
        }
      },
      enable: enable,
      text: 'Pilih',
    );
  }
}
