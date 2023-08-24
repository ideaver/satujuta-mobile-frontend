import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_image.dart';
import '../../../../widget/atom/app_modal.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../app/service/locator/service_locator.dart';
import '../../../app/utility/console_log.dart';
import '../../../view_model/account_view_model.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/edit_profile_view_model.dart';
import '../../../widget/atom/app_progress_indicator.dart';

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
                  hintText: widget.codeRef,
                ),
                AppTextField(
                  controller: editProfile.bankNameCtrl,
                  enabled: false,
                  onTap: () async {
                    var account = await AppModal.show(
                      context: context,
                      title: 'Bank',
                      child: bankList(),
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
                  hintText: widget.bank,
                  disabledColor: AppColors.base,
                ),
                AppTextField(
                  type: AppTextFieldType.number,
                  controller: editProfile.bankAccountNumberCtrl,
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
    final navigator = Navigator.of(context);
    final accountViewModel = locator<AccountViewModel>();

    accountViewModel.getSupportedBanks(navigator);

    return Consumer<AccountViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 200,
            ),
            child: model.bankFindMany == null
                ? const Padding(
                    padding: EdgeInsets.all(32),
                    child: AppProgressIndicator(),
                  )
                : model.bankFindMany!.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          '(Kosong)',
                          style: AppTextStyle.bold(context, color: AppColors.baseLv5),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.bankFindMany!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSizes.radius),
                            ),
                            child: RadioListTile(
                              value: model.selectedBank,
                              groupValue: model.bankFindMany![i],
                              onChanged: (value) {
                                model.onSelectBank(model.bankFindMany![i]);
                              },
                              title: Row(
                                children: [
                                  AppImage(
                                    image: model.bankFindMany![i].logoUrl,
                                    width: 50,
                                    errorWidget: const Icon(
                                      CupertinoIcons.building_2_fill,
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.padding),
                                  Text(
                                    model.bankFindMany![i].name,
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
              Navigator.pop(context, model.selectedBank);
            },
            enable: model.selectedBank != null,
            text: 'Pilih',
          ),
        ],
      );
    });
  }
}
