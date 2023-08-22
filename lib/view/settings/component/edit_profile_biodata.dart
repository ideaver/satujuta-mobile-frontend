import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../view_model/edit_profile_view_model.dart';

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
    return Consumer<EditProfileViewModel>(
      builder: (context, model, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
          child: Container(
            color: AppColors.white,
            child: AppTextFieldsWrapper(
              textFields: [
                AppTextField(
                  controller: model.firstName,
                  suffixIcon: const Icon(
                    CupertinoIcons.person,
                  ),
                  lableText: 'Nama Depan',
                  hintText: widget.name,
                ),
                AppTextField(
                  controller: model.lastName,
                  suffixIcon: const Icon(
                    CupertinoIcons.person,
                  ),
                  lableText: 'Nama Belakang',
                  hintText: widget.name,
                ),
                AppTextField(
                  controller: model.addressName,
                  suffixIcon: Icon(
                    Icons.location_on_outlined,
                  ),
                  lableText: 'Alamat',
                  hintText: widget.address,
                ),
                AppTextField(
                  enabled: false,
                  onTap: () {
                    AppModal.show(
                      context: context,
                      title: 'Provinsi',
                      child: cityList(),
                    );
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Provinsi',
                  hintText: widget.city,
                ),
                AppTextField(
                  enabled: false,
                  onTap: () {
                    AppModal.show(
                      context: context,
                      title: 'Kota',
                      child: cityList(),
                    );
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Kota',
                  hintText: widget.city,
                ),
                AppTextField(
                  enabled: false,
                  onTap: () {
                    AppModal.show(
                      context: context,
                      title: 'Kecamatan',
                      child: districtList(),
                    );
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Kecamatan',
                ),
                AppTextField(
                  enabled: false,
                  onTap: () {
                    AppModal.show(
                      context: context,
                      title: 'Kelurahan',
                      child: districtList(),
                    );
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Kelurahan',
                ),
                AppTextField(
                  enabled: false,
                  controller: model.postalCode,
                  suffixIcon: const Icon(
                    CupertinoIcons.mail,
                  ),
                  lableText: 'Kode Pos',
                  hintText: widget.posCode,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget roleList() {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
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
                  title: Text(
                    'Siswa',
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
            // TODO
            Navigator.pop(context);
          },
          text: 'Pilih',
        ),
      ],
    );
  }

  Widget cityList() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const AppTextField(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: 'Cari Kota',
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 0,
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
                  title: Text(
                    'Dumai',
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
            // TODO
            Navigator.pop(context);
          },
          text: 'Pilih',
        ),
      ],
    );
  }

  Widget districtList() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const AppTextField(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: 'Cari Kecamatan',
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 0,
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
                  title: Text(
                    'Lubuk Gaung',
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
            // TODO
            Navigator.pop(context);
          },
          text: 'Pilih',
        ),
      ],
    );
  }
}
