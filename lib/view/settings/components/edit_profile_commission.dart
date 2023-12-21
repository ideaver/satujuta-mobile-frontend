import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../app/utility/console_log.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/edit_profile_view_model.dart';
import '../../../widget/organism/bank/bank_list_modal.dart';

class EditProfileCommission extends StatefulWidget {
  const EditProfileCommission({super.key});

  @override
  State<EditProfileCommission> createState() => _EditProfileCommissionState();
}

class _EditProfileCommissionState extends State<EditProfileCommission> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<EditProfileViewModel, AddressViewModel>(
      builder: (context, editProfile, address, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
          child: Container(
            color: AppColors.white,
            child: AppTextFieldsWrapper(
              textFields: [
                AppTextField(
                  enabled: false,
                  controller: editProfile.referralCodeCtrl,
                  lableText: 'Kode Refferal',
                  hintText: "sj5w1",
                ),
                AppTextField(
                  controller: editProfile.bankNameCtrl,
                  enabled: false,
                  onTap: () async {
                    FocusScope.of(context).unfocus();

                    var account = await AppModal.show(
                      context: context,
                      title: 'Bank',
                      child: const BankListModal(),
                    );

                    if (account != null) {
                      cl(account);
                      editProfile.bankNameCtrl.text = account.name;
                      editProfile.bankAccountNumberCtrl.clear();
                    }
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  lableText: 'Bank',
                  hintText: "Pilih bank",
                  disabledColor: AppColors.base,
                ),
                AppTextField(
                  type: AppTextFieldType.number,
                  controller: editProfile.bankAccountNumberCtrl,
                  lableText: 'No Rekening',
                  hintText: "111222333444",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
