import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../app/utility/console_log.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/register_view_model.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/organism/bank/bank_list_modal.dart';

class RegCommission extends StatefulWidget {
  const RegCommission({Key? key}) : super(key: key);

  @override
  State<RegCommission> createState() => _RegCommissionState();
}

class _RegCommissionState extends State<RegCommission> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<RegisterViewModel, AddressViewModel>(
      builder: (context, register, address, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
              child: Container(
                color: AppColors.white,
                child: AppTextFieldsWrapper(
                  textFields: [
                    AppTextField(
                      enabled: true,
                      controller: register.referralCodeCtrl,
                      lableText: 'Kode Refferal (Opsional)',
                      hintText: "sj5w1",
                    ),
                    AppTextField(
                      controller: register.bankNameCtrl,
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
                          register.bankNameCtrl.text = account.name;
                          register.bankAccountNumberCtrl.clear();
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
                      controller: register.bankAccountNumberCtrl,
                      lableText: 'No Rekening',
                      hintText: "111222333444",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        register.tabController.animateTo(register.tabController.index - 1);
                      },
                      text: 'Sebelumnya',
                      textColor: AppColors.primary,
                      buttonColor: AppColors.primary.withOpacity(0.12),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        final navigator = Navigator.of(context);
                        register.onTapRegisterUser(navigator);
                      },
                      enable: register.isCommissionFormValid(),
                      text: 'Daftar',
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
