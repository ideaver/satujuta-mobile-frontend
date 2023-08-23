import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_image.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../view_model/edit_profile_view_model.dart';

class EditProfileCommission extends StatefulWidget {
  const EditProfileCommission({
    super.key,
    this.codeRef,
    this.bank,
    this.noRek,
  });

  final String? codeRef;
  final String? bank;
  final String? noRek;

  @override
  State<EditProfileCommission> createState() => _EditProfileCommissionState();
}

class _EditProfileCommissionState extends State<EditProfileCommission> {
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
                  enabled: false,
                  controller: model.referralCode,
                  lableText: 'Kode Refferal',
                  hintText: widget.codeRef,
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
                  hintText: widget.bank,
                ),
                AppTextField(
                  type: AppTextFieldType.number,
                  controller: model.bankAccountNumber,
                  lableText: 'No Rekening',
                  hintText: widget.noRek,
                ),
              ],
            ),
          ),
        );
      },
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
