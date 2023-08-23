import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_image.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';

class RegCommission extends StatefulWidget {
  const RegCommission({Key? key}) : super(key: key);

  @override
  State<RegCommission> createState() => _RegCommissionState();
}

class _RegCommissionState extends State<RegCommission> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: AppTextFieldsWrapper(
        textFields: [
          AppTextField(
            suffixIcon: Image.asset(
              AppAssets.somePersonFormIconPath,
            ),
            lableText: 'Kode Refferal',
          ),
          AppTextField(
            enabled: false,
            onTap: () {
              AppModal.show(
                context: context,
                title: 'Bank',
                child: bankList(),
              );
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            lableText: 'Bank',
          ),
          const AppTextField(
            lableText: 'No Rekening',
          ),
        ],
      ),
    );
  }

  Widget bankList() {
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
                  title: Row(
                    children: [
                      const SizedBox(
                        width: 50,
                        child: AppImage(
                          image: AppAssets.bankMandiriImgPath,
                          imgProvider: ImgProvider.assetImage,
                        ),
                      ),
                      const SizedBox(width: AppSizes.padding),
                      Text(
                        'Bank Mandiri',
                        style: AppTextStyle.bold(context),
                      ),
                    ],
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
