import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/widget/app_text_field.dart';
import '../../../app/widget/app_text_fields_wrapper.dart';

class RegBiodata extends StatefulWidget {
  const RegBiodata({Key? key}) : super(key: key);

  @override
  State<RegBiodata> createState() => _RegBiodataState();
}

class _RegBiodataState extends State<RegBiodata> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AppTextFieldsWrapper(
        textFields: [
          const AppTextField(
            suffixIcon: Icon(
              Icons.person_outline_rounded,
            ),
            lableText: 'Email',
          ),
          const AppTextField(
            suffixIcon: Icon(
              Icons.location_on_outlined,
            ),
            lableText: 'Alamat',
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Kota',
          ),
          AppTextField(
            onTap: () {
              // TODO
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
          ),
          AppTextField(
            onTap: () {
              // TODO
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Role',
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
        ],
      ),
    );
  }
}
