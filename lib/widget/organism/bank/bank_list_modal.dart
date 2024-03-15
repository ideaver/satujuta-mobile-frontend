import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_button.dart';
import '../../../../widget/atom/app_image.dart';
import '../../../app/service/locator/service_locator.dart';
import '../../../view_model/account_view_model.dart';
import '../../../widget/atom/app_progress_indicator.dart';

class BankListModal extends StatefulWidget {
  const BankListModal({
    super.key,
  });

  @override
  State<BankListModal> createState() => _BankListModalState();
}

class _BankListModalState extends State<BankListModal> {
  final accountViewModel = locator<AccountViewModel>();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    accountViewModel.getSupportedBanks(navigator);

    return Consumer<AccountViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          bankList(model),
          const SizedBox(height: AppSizes.padding),
          chooseButton(model),
        ],
      );
    });
  }

  Widget bankList(AccountViewModel model) {
    if (model.bankFindMany == null) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: AppProgressIndicator(),
      );
    }

    if (model.bankFindMany!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          '(Kosong)',
          style: AppTextStyle.bold(context, color: AppColors.baseLv5),
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 200),
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 6),
        radius: const Radius.circular(100),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.bankFindMany!.length,
          itemBuilder: (context, i) {
            return bankListTile(model, i);
          },
        ),
      ),
    );
  }

  Widget bankListTile(AccountViewModel model, int i) {
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
            model.bankFindMany![i].logoUrl != null
                ? Padding(
                    padding: const EdgeInsets.only(right: AppSizes.padding),
                    child: AppImage(
                      image: model.bankFindMany![i].logoUrl!,
                      width: 50,
                      errorWidget: const Icon(
                        CupertinoIcons.building_2_fill,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Flexible(
              child: Text(
                model.bankFindMany![i].name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.bold(context),
              ),
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
  }

  Widget chooseButton(AccountViewModel model) {
    return AppButton(
      onTap: () {
        Navigator.pop(context, model.selectedBank);
      },
      enable: model.selectedBank != null,
      text: 'Pilih',
    );
  }
}
