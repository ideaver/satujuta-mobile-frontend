import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/app/const/app_consts.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/transaction_find_many_by_user_point_from_user_id.graphql.dart';

import '../../../app/asset/app_icons.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/utility/date_formatter.dart';
import '../../../view_model/user_view_model.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_progress_indicator.dart';

class PointTransactionsList extends StatefulWidget {
  const PointTransactionsList({super.key});

  @override
  State<PointTransactionsList> createState() => _PointTransactionsListState();
}

class _PointTransactionsListState extends State<PointTransactionsList> {
  int lastSkip = 0;
  int skip = 0;
  bool isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (context, model, _) {
      if (model.userPointTransactions == null) {
        return const Padding(
          padding: EdgeInsets.all(AppSizes.padding * 2),
          child: AppProgressIndicator(),
        );
      }

      if (model.userPointTransactions!.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.padding * 2),
          child: Text(
            '(Riwayat poin Kosong)',
            style: AppTextStyle.bold(context, color: AppColors.baseLv4),
          ),
        );
      }

      skip = model.userPointTransactions!.length - 1;

      return Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
        child: AppExpansionListTile(
          title: 'Riwayat Poin',
          icon: Icons.access_time_sharp,
          expand: true,
          children: [
            ...List.generate(model.userPointTransactions!.length, (i) {
              // return poinItemCard(model.userPointTransactions![i]);
              return poinItemCard(model.userPointTransactions![i]);
            }),
            lastSkip == skip
                ? const SizedBox.shrink()
                : loadMoreButton(
                    onTap: () async {
                      isLoadingMore = true;
                      setState(() {});

                      var currSkip = model.userPointTransactions!.length;
                      await model.getUserPointTransactions(skip: skip);

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

  Widget poinItemCard(
    Query$TransactionFindManyByUserPointFromUserId$transactionFindManyByUserPointFromUserId point,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.padding / 4),
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
                        color: AppColors.yellow,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: AppColors.baseLv8,
                        ),
                      ),
                      child: const Icon(
                        CustomIcon.coin_icon,
                        color: AppColors.white,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Text(
                      "${point.amount}",
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
          Container(
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      DateFormatter.slashDate(point.createdAt),
                      // DateFormatter.slashDate(DateTime.now().toIso8601String()),
                      style: AppTextStyle.regular(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.padding / 2,
                    vertical: AppSizes.padding / 4,
                  ),
                  decoration: BoxDecoration(
                    color: pointTransactionCategorySymbol(point.transactionCategory) == "+"
                        ? AppColors.secondary
                        : AppColors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '${pointTransactionCategorySymbol(point.transactionCategory)}${point.amount} Point',
                    style: AppTextStyle.bold(
                      context,
                      fontSize: 12,
                      color: AppColors.white,
                    ),
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
            isLoadingMore
                ? const AppProgressIndicator(
                    showMessage: false,
                    size: 18,
                    color: AppColors.primary,
                  )
                : const Icon(
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
