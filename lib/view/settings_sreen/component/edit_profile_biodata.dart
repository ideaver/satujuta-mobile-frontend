import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/app_button.dart';
import '../../../app/widget/app_modal.dart';
import '../../../app/widget/app_text_field.dart';
import '../../../app/widget/app_text_fields_wrapper.dart';

class EditProfileBiodata extends StatefulWidget {
  const EditProfileBiodata({
    Key? key,
    this.nama,
    this.alamat,
    this.kota,
    this.kecamatan,
    this.kodePos,
    this.noWa,
    this.email,
  });

  final String? nama;
  final String? alamat;
  final String? kota;
  final String? kecamatan;
  final String? kodePos;
  final String? noWa;
  final String? email;

  @override
  State<EditProfileBiodata> createState() => _EditProfileBiodataState();
}

class _EditProfileBiodataState extends State<EditProfileBiodata> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: Container(
        color: AppColors.white,
        child: AppTextFieldsWrapper(
          textFields: [
            AppTextField(
              suffixIcon: Icon(
                Icons.person_outline_rounded,
              ),
              lableText: 'Nama Lengkap',
              hintText: widget.nama,
            ),
            AppTextField(
              suffixIcon: Icon(
                Icons.location_on_outlined,
              ),
              lableText: 'Alamat',
              hintText: widget.alamat,
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
              hintText: widget.kota,
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
              hintText: widget.kecamatan,
            ),
            AppTextField(
              onTap: () {
                // TODO
              },
              suffixIcon: const Icon(
                Icons.mail_outline_rounded,
              ),
              lableText: 'Kode Pos',
              hintText: widget.kodePos,
            ),
            AppTextField(
                enabled: false,
                onTap: () {
                  AppModal.show(
                    context: context,
                    title: 'Role',
                    child: roleList(),
                  );
                },
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down,
                ),
                lableText: 'No. Whatsapp',
                hintText: widget.noWa),
            AppTextField(
              onTap: () {
                // TODO
              },
              suffixIcon: const Icon(
                Icons.mail_outline_rounded,
              ),
              lableText: 'Email',
              hintText: widget.email,
            ),
          ],
        ),
      ),
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
