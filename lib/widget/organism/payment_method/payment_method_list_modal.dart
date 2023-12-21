import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../app/service/locator/service_locator.dart';
import '../../../view_model/account_view_model.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_image.dart';
import '../../atom/app_progress_indicator.dart';

class PaymentMethodListModal extends StatefulWidget {
  const PaymentMethodListModal({
    super.key,
  });

  @override
  State<PaymentMethodListModal> createState() => _PaymentMethodListModalState();
}

class _PaymentMethodListModalState extends State<PaymentMethodListModal> {
  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  transfer(model),
                  virtualAccount(model),
                ],
              ),
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

  Widget transfer(AccountViewModel model) {
    return AppExpansionListTile(
      title: 'Transfer Bank',
      icon: Icons.credit_card,
      expand: true,
      children: [
        if (model.bankFindMany == null)
          const Padding(
            padding: EdgeInsets.all(32),
            child: AppProgressIndicator(),
          )
        else if (model.bankFindMany!.isEmpty)
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              '(Kosong)',
              style: AppTextStyle.bold(context, color: AppColors.baseLv5),
            ),
          )
        else
          ...List.generate(
            model.bankFindMany!.length,
            (i) {
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
      ],
    );
  }

  Widget virtualAccount(AccountViewModel model) {
    return AppExpansionListTile(
      title: 'Virtual Account',
      icon: Icons.credit_card,
      expand: true,
      children: [
        if (model.bankFindMany == null)
          const Padding(
            padding: EdgeInsets.all(32),
            child: AppProgressIndicator(),
          )
        else if (model.bankFindMany!.isEmpty)
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              '(Kosong)',
              style: AppTextStyle.bold(context, color: AppColors.baseLv5),
            ),
          )
        else
          ...List.generate(
            // model.bankFindMany!.length,
            0,
            (i) {
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
      ],
    );
  }
}
