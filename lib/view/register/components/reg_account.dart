import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/widget/app_text_field.dart';
import '../../../app/widget/app_text_fields_wrapper.dart';
import '../../../app/widget/my_asset_image.dart';

class RegAccount extends StatefulWidget {
  const RegAccount({Key? key}) : super(key: key);

  @override
  State<RegAccount> createState() => _RegAccountState();
}

class _RegAccountState extends State<RegAccount> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTextFieldsWrapper(
            textFields: [
              AppTextField(
                suffixIcon: Image.asset(
                  AppAssets.phoneIconPath,
                ),
                lableText: 'Nomor WhatsApp',
              ),
              AppTextField(
                suffixIcon: Image.asset(
                  AppAssets.dropdownRectangleFormIconPath,
                ),
                lableText: 'Email',
              ),
              AppTextField(
                onTap: () {
                  // TODO
                },
                suffixIcon: Image.asset(
                  AppAssets.passwordIconPath,
                ),
                lableText: 'Kata Sandi',
              ),
              AppTextField(
                onTap: () {
                  // TODO
                },
                suffixIcon: Image.asset(
                  AppAssets.passwordIconPath,
                ),
                lableText: 'Konfirmasi Kata Sandi',
              ),
            ],
          ),
          validatorInfo(),
        ],
      ),
    );
  }

  Widget validatorInfo() {
    return Column(
      children: [
        const SizedBox(
          height: AppSizes.height * 4,
        ),
        const Row(
          children: [
            Expanded(
              child: MyAssetImage(
                path: AppAssets.successIconPath,
                widthImage: AppSizes.padding * 2,
              ),
            ),
            Expanded(flex: 4, child: Text('Besar atau kecil karakter'))
          ],
        ),
        const SizedBox(
          height: AppSizes.height,
        ),
        const Row(
          children: [
            Expanded(
              child: MyAssetImage(
                path: AppAssets.failedIconPath,
                widthImage: AppSizes.padding * 2,
              ),
            ),
            Expanded(flex: 4, child: Text('6 atau lebih karakter'))
          ],
        ),
        const SizedBox(
          height: AppSizes.height,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: MyAssetImage(
                path: AppAssets.unsuccessIconPath,
                widthImage: AppSizes.padding * 2,
              ),
            ),
            Expanded(flex: 4, child: Text('Setidaknya 1 nomor'))
          ],
        ),
        const SizedBox(
          height: AppSizes.height * 4,
        ),
      ],
    );
  }
}
