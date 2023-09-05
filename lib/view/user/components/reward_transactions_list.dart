import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../view_model/user_view_model.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_progress_indicator.dart';

class RewardTransactionsList extends StatefulWidget {
  const RewardTransactionsList({super.key}) ;

  @override
  State<RewardTransactionsList> createState() => _RewardTransactionsListState();
}

class _RewardTransactionsListState extends State<RewardTransactionsList> {
  int lastSkip = 0;
  int skip = 0;
  bool isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (context, model, _) {
      if (model.userClaimedRewards == null) {
        return const Padding(
          padding: EdgeInsets.all(AppSizes.padding * 2),
          child: AppProgressIndicator(),
        );
      }

      if (model.userClaimedRewards!.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.padding * 2),
          child: Text(
            '(Riwayat klaim hadiah Kosong)',
            style: AppTextStyle.bold(context, color: AppColors.baseLv4),
          ),
        );
      }

      skip = model.userPointTransactions!.length - 1;

      return Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
        child: AppExpansionListTile(
          title: 'Riwayat Penerimaan Hadiah',
          icon: Icons.access_time_sharp,
          expand: true,
          children: [
            ...List.generate(model.userClaimedRewards!.length, (i) {
              return rewardItemCard(i);
            }),
            lastSkip == skip
                ? const SizedBox.shrink()
                : loadMoreButton(
                    onTap: () {
                      isLoadingMore = true;
                      setState(() {});

                      var currSkip = model.userPointTransactions!.length;
                      model.getUserClaimedRewards(skip: model.userClaimedRewards!.length - 1);

                      isLoadingMore = false;
                      lastSkip = currSkip;
                      setState(() {});
                    },
                  ),
          ],
        ),
      );
    });
  }

  Widget rewardItemCard(int i) {
    return Container(
      margin: EdgeInsets.only(bottom: i == 5 ? 0 : AppSizes.padding / 4),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: AppColors.baseLv8,
                        ),
                      ),
                      child: const Icon(
                        Icons.wallet_giftcard_rounded,
                        color: AppColors.white,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Text(
                      i == 0 ? 'Tiket Ke Singapore' : 'Tiket Ke Turkey',
                      style: AppTextStyle.extraBold(
                        context,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Container(
            padding: const EdgeInsets.all(AppSizes.padding / 2.7),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time_sharp,
                  size: 15,
                  color: AppColors.baseLv4,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '1 Tahun Yang lalu',
                  style: AppTextStyle.regular(
                    context,
                    fontSize: 12,
                    color: AppColors.baseLv4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadMoreButton({required Function() onTap}) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding / 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Muat lebih banyak ',
              style: AppTextStyle.bold(context, fontSize: 14, color: AppColors.primary),
            ),
            const SizedBox(
              width: AppSizes.height,
            ),
            const Icon(
              Icons.arrow_downward,
              size: AppSizes.height,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
