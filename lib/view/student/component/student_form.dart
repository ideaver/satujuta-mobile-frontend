import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view/hotel_picker/student_hotel_picker_view.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/app_button.dart';
import '../../../app/widget/app_modal.dart';
import '../../../app/widget/app_text_field.dart';
import '../../../app/widget/app_text_fields_wrapper.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: AppTextFieldsWrapper(
        textFields: [
          const AppTextField(
            suffixIcon: Icon(
              Icons.person_outline_rounded,
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
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              Icons.mail_outline_rounded,
            ),
            lableText: 'Kode Pos',
            hintText: 'Kode Pos',
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              CustomIcon.contact_icon,
            ),
            lableText: 'No. Whatsapp',
            hintText: 'Masukkan No. Whatsapp Aktif',
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              Icons.mail_outline_outlined,
            ),
            lableText: 'Email',
            hintText: 'Masukkan Email Siswa',
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: Image.asset(
              AppAssets.schoolIconPath,
            ),
            lableText: 'Sekolah',
          ),
          AppTextField(
            enabled: false,
            onTap: () {
              // TODO
              Navigator.pushNamed(context, StudentHotelPickerView.routeName);
            },
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Hotel',
          ),
        ],
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

  Widget hotelList() {
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
            hintText: 'Cari Hotel',
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
                    'Grand Cortela Hotel Bandung',
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
