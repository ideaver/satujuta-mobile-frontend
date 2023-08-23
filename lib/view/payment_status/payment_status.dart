import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_widget_list_wrapper.dart';

class PaymentStatusView extends StatefulWidget {
  final bool isSucess;

  const PaymentStatusView({Key? key, required this.isSucess}) : super(key: key);

  static const String successRouteName = '/payment-status-success';
  static const String failedRouteName = '/payment-status-failed';

  const PaymentStatusView.success({super.key, this.isSucess = true});
  const PaymentStatusView.failed({super.key, this.isSucess = false});

  @override
  State<PaymentStatusView> createState() => _PaymentStatusViewState();
}

class _PaymentStatusViewState extends State<PaymentStatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(AppSizes.padding / 1.5),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.baseLv7,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              color: AppColors.base,
              size: 14,
            ),
          ),
        ),
      ),
      title: Text(
        'Payment Status',
        style: AppTextStyle.bold(context, fontSize: 16),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: AppImage(
              image: widget.isSucess ? AppAssets.successIlusPath : AppAssets.failedIlusPath,
              imgProvider: ImgProvider.assetImage,
            ),
          ),
          Text(
            widget.isSucess ? 'Berhasil' : 'Gagal',
            style: AppTextStyle.bold(context, fontSize: 20),
          ),
          const SizedBox(height: AppSizes.padding / 1.5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.arrow_circle_down_rounded,
                color: AppColors.baseLv4,
                size: 12,
              ),
              const SizedBox(width: 6),
              Text(
                'Detail Information',
                style: AppTextStyle.semiBold(
                  context,
                  fontSize: 12,
                  color: AppColors.baseLv4,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding * 2),
          orderPricing(),
          const SizedBox(height: AppSizes.padding * 2),
          AppButton(
            onTap: () {
              //TODO
            },
            text: widget.isSucess ? 'Lihat Ringkasan' : 'Ulangi',
          ),
          const SizedBox(height: AppSizes.padding * 2),
        ],
      ),
    );
  }

  Widget orderPricing() {
    return AppWidgetListWrapper(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.padding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.receipt_outlined,
                      size: 20,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Text(
                      'ID Transaksi',
                      style: AppTextStyle.extraBold(context),
                    ),
                  ],
                ),
                Text(
                  '#22112211',
                  style: AppTextStyle.extraBold(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Container(
            padding: const EdgeInsets.all(AppSizes.padding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya',
                  style: AppTextStyle.regular(context),
                ),
                Text(
                  'Rp. 1.000.000',
                  style: AppTextStyle.regular(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Container(
            padding: const EdgeInsets.all(AppSizes.padding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya Admin',
                  style: AppTextStyle.regular(context),
                ),
                Text(
                  'Rp. 5000',
                  style: AppTextStyle.regular(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Container(
            padding: const EdgeInsets.all(AppSizes.padding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Bayar',
                  style: AppTextStyle.extraBold(context),
                ),
                Text(
                  'Rp. 1.000.5000',
                  style: AppTextStyle.extraBold(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
