import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/view_model/checkout_view_model.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../app/const/app_consts.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_image.dart';

class PaymentMethodListModal extends StatefulWidget {
  const PaymentMethodListModal({
    super.key,
  });

  @override
  State<PaymentMethodListModal> createState() => _PaymentMethodListModalState();
}

class _PaymentMethodListModalState extends State<PaymentMethodListModal> {
  var bankAccounts = supportedBanks.where((e) => e['account_type'] == "bank_account").toList();
  var virtualAccounts = supportedBanks.where((e) => e['account_type'] == "virtual_account").toList();
  var eWalletAccounts = supportedBanks.where((e) => e['account_type'] == "wallet_account").toList();

  Map<String, dynamic>? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    // TODO GET BANK LIST FROM API
    // final navigator = Navigator.of(context);
    // final accountViewModel = locator<AccountViewModel>();

    // accountViewModel.getSupportedBanks(navigator);

    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                transfer(bankAccounts),
                virtualAccount(virtualAccounts),
                ewallet(eWalletAccounts),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        AppButton(
          onTap: () {
            Navigator.pop(context, selectedPaymentMethod);
          },
          enable: selectedPaymentMethod != null,
          text: 'Pilih',
        ),
      ],
    );
  }

  Widget transfer(List bankAccounts) {
    return Consumer<CheckoutViewModel>(builder: (context, model, _) {
      return AppExpansionListTile(
        title: 'Transfer Bank',
        icon: Icons.credit_card,
        expand: true,
        children: [
          // if (model.bankFindMany == null)
          //   const Padding(
          //     padding: EdgeInsets.all(32),
          //     child: AppProgressIndicator(),
          //   )
          // else if (model.bankFindMany!.isEmpty)
          //   Padding(
          //     padding: const EdgeInsets.all(32),
          //     child: Text(
          //       '(Kosong)',
          //       style: AppTextStyle.bold(context, color: AppColors.baseLv5),
          //     ),
          //   )
          // else
          ...List.generate(
            bankAccounts.length,
            (i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: selectedPaymentMethod,
                  groupValue: bankAccounts[i],
                  onChanged: (value) {
                    selectedPaymentMethod = bankAccounts[i];
                    setState(() {});
                  },
                  title: Row(
                    children: [
                      AppImage(
                        image: bankAccounts[i]['icon'],
                        width: 50,
                        imgProvider: ImgProvider.assetImage,
                        errorWidget: const Icon(
                          CupertinoIcons.building_2_fill,
                        ),
                      ),
                      const SizedBox(width: AppSizes.padding),
                      Text(
                        bankAccounts[i]['name'],
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
        ],
      );
    });
  }

  Widget virtualAccount(List virtualAccounts) {
    return Consumer<CheckoutViewModel>(builder: (context, model, _) {
      return AppExpansionListTile(
        title: 'Virtual Account',
        icon: Icons.credit_card,
        expand: true,
        children: [
          // if (model.bankFindMany == null)
          //   const Padding(
          //     padding: EdgeInsets.all(32),
          //     child: AppProgressIndicator(),
          //   )
          // else if (model.bankFindMany!.isEmpty)
          //   Padding(
          //     padding: const EdgeInsets.all(32),
          //     child: Text(
          //       '(Kosong)',
          //       style: AppTextStyle.bold(context, color: AppColors.baseLv5),
          //     ),
          //   )
          // else
          ...List.generate(
            virtualAccounts.length,
            (i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: selectedPaymentMethod,
                  groupValue: virtualAccounts[i],
                  onChanged: (value) {
                    selectedPaymentMethod = virtualAccounts[i];
                    setState(() {});
                  },
                  title: Row(
                    children: [
                      AppImage(
                        image: virtualAccounts[i]['icon'],
                        width: 50,
                        imgProvider: ImgProvider.assetImage,
                        errorWidget: const Icon(
                          CupertinoIcons.building_2_fill,
                        ),
                      ),
                      const SizedBox(width: AppSizes.padding),
                      Text(
                        virtualAccounts[i]['name'],
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
        ],
      );
    });
  }

  Widget ewallet(List eWalletAccounts) {
    return Consumer<CheckoutViewModel>(builder: (context, model, _) {
      return AppExpansionListTile(
        title: 'E-Wallet',
        icon: Icons.credit_card,
        expand: true,
        children: [
          // if (model.bankFindMany == null)
          //   const Padding(
          //     padding: EdgeInsets.all(32),
          //     child: AppProgressIndicator(),
          //   )
          // else if (model.bankFindMany!.isEmpty)
          //   Padding(
          //     padding: const EdgeInsets.all(32),
          //     child: Text(
          //       '(Kosong)',
          //       style: AppTextStyle.bold(context, color: AppColors.baseLv5),
          //     ),
          //   )
          // else
          ...List.generate(
            eWalletAccounts.length,
            (i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: selectedPaymentMethod,
                  groupValue: eWalletAccounts[i],
                  onChanged: (value) {
                    selectedPaymentMethod = eWalletAccounts[i];
                    setState(() {});
                  },
                  title: Row(
                    children: [
                      AppImage(
                        image: eWalletAccounts[i]['icon'],
                        width: 50,
                        imgProvider: ImgProvider.assetImage,
                        errorWidget: const Icon(
                          CupertinoIcons.building_2_fill,
                        ),
                      ),
                      const SizedBox(width: AppSizes.padding),
                      Text(
                        eWalletAccounts[i]['name'],
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
        ],
      );
    });
  }
}
