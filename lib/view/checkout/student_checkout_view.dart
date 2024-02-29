import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_gradient_text.dart';
import '../../../widget/atom/app_widget_list_wrapper.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/currency_formatter.dart';
import '../../app/utility/date_formatter.dart';
import '../../view_model/checkout_view_model.dart';
import '../../widget/atom/app_icon_button.dart';

class StudentCheckoutView extends StatefulWidget {
  const StudentCheckoutView({Key? key}) : super(key: key);

  static const String routeName = '/student-checkout';

  @override
  State<StudentCheckoutView> createState() => _StudentCheckoutViewState();
}

class _StudentCheckoutViewState extends State<StudentCheckoutView> {
  final _checkoutViewModel = locator<CheckoutViewModel>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkoutViewModel.getLatestOrder();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _checkoutViewModel,
        builder: (context, snapshot) {
          return Consumer<CheckoutViewModel>(builder: (context, model, _) {
            return Scaffold(
              body: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    sliverAppBarWidget(),
                  ];
                },
                body: body(model),
              ),
              bottomSheet: bottomButton(model),
            );
          });
        });
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 170,
      flexibleSpace: FlexibleSpaceBar(
        background: sliverBackground(),
        expandedTitleScale: 1,
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
      child: Column(
        children: [
          const AppGradientText(
            textTitle: 'Ringkasan Order',
            listColor: [
              AppColors.pink,
              AppColors.darkBlue,
            ],
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            "Lakukan pembayaran sebelum batas waktu berakhir",
            textAlign: TextAlign.center,
            style: AppTextStyle.regular(
              context,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget sliverBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSizes.padding * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icons.arrow_back_ios_rounded,
                iconSize: 22,
              ),
              AppIconButton(
                onPressed: () {
                  // TODO
                },
                icon: Icons.info_outline_rounded,
                iconSize: 22,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding * 2),
          title()
        ],
      ),
    );
  }

  Widget body(CheckoutViewModel model) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          orderStatus(model),
          orderInfo(model),
          orderItems(model),
          orderPricing(model),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget orderStatus(CheckoutViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        constraints: const BoxConstraints(maxWidth: 500),
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.red.withOpacity(0.18),
              offset: const Offset(1, 1),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
          color: AppColors.red,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.padding / 2,
                  horizontal: AppSizes.padding,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timelapse_rounded,
                      color: AppColors.red,
                      size: 12,
                    ),
                    const SizedBox(width: 6),
                    CountdownTimer(
                      // TODO DUE TIME
                      endTime: DateTime.now().add(const Duration(hours: 24)).millisecondsSinceEpoch,
                      widgetBuilder: (context, duration) {
                        return Text(
                          "${duration?.hours ?? 0}:${duration?.min ?? 0}:${duration?.sec ?? 0}",
                          style: AppTextStyle.bold(
                            context,
                            fontSize: 12,
                            color: AppColors.red,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Text(
                "Batas Bayar".toUpperCase(),
                style: AppTextStyle.bold(
                  context,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: AppSizes.padding / 4),
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderInfo(CheckoutViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppWidgetListWrapper(
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
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.flag_rounded,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: AppSizes.padding / 2),
                      Text(
                        'Order ID',
                        style: AppTextStyle.extraBold(context),
                      ),
                    ],
                  ),
                  Text(
                    '${model.latestOrder?.id ?? "-"}',
                    style: AppTextStyle.bold(context),
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
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: AppColors.sea,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.timer_rounded,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: AppSizes.padding / 2),
                      Text(
                        'Tanggal Order',
                        style: AppTextStyle.extraBold(context),
                      ),
                    ],
                  ),
                  Text(
                    DateFormatter.normal(model.latestOrder?.createdAt ?? ''),
                    style: AppTextStyle.bold(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderItems(CheckoutViewModel model) {
    if (model.latestOrder?.cart == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppExpansionListTile(
        title: 'Item Order',
        icon: Icons.timelapse_rounded,
        expand: true,
        children: model.latestOrder!.cart == null
            ? []
            : [
                ...List.generate(model.latestOrder!.cart!.length, (i) {
                  return orderItemCard(model, i);
                }),
              ],
      ),
    );
  }

  Widget orderItemCard(CheckoutViewModel model, int i) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.padding / 4),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.latestOrder!.cart?[i].membershipItem?.name ?? '-',
                        style: AppTextStyle.extraBold(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        'Kuantitas ${model.latestOrder!.cart?[i].quantity ?? '-'} Orang',
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
          ),
          const SizedBox(width: AppSizes.padding / 2),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding / 2,
              vertical: AppSizes.padding / 4,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              CurrencyFormatter.format(model.latestOrder!.cart?[i].membershipItem?.price ?? 0),
              style: AppTextStyle.bold(
                context,
                fontSize: 12,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderPricing(CheckoutViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppWidgetListWrapper(
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
                    '${model.latestOrder?.invoice.id ?? "-"}',
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
                    CurrencyFormatter.format(model.latestOrder?.invoice.amount ?? 0),
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
                    CurrencyFormatter.format(model.latestOrder?.invoice.adminFee ?? 0),
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
                    CurrencyFormatter.format(
                      (model.latestOrder?.invoice.amount ?? 0) + (model.latestOrder?.invoice.adminFee ?? 0),
                    ),
                    style: AppTextStyle.extraBold(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButton(CheckoutViewModel model) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      // height: 70,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.baseLv7,
            offset: Offset(0, -4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // model.selectedPaymentMethod != null
          //     ? Padding(
          //         padding: const EdgeInsets.only(bottom: AppSizes.padding),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Metode Pembayaran',
          //               style: AppTextStyle.semiBold(context),
          //             ),
          //             GestureDetector(
          //               onTap: () async {
          //                 var method = await AppModal.show(
          //                   context: context,
          //                   title: 'Pilih Metode Pembayaran',
          //                   child: const PaymentMethodListModal(),
          //                 );

          //                 if (method != null) {
          //                   model.onSelectPaymentMethod(method);
          //                 }
          //               },
          //               child: Row(
          //                 children: [
          //                   AppImage(
          //                     // image: model.selectedPaymentMethod!.logoUrl,
          //                     image: model.selectedPaymentMethod?['icon'] ?? "-",
          //                     imgProvider: ImgProvider.assetImage,
          //                     width: 32,
          //                     height: 24,
          //                     backgroundColor: AppColors.baseLv6,
          //                     borderRadius: 8,
          //                     errorWidget: const Icon(
          //                       CupertinoIcons.building_2_fill,
          //                       color: AppColors.baseLv4,
          //                       size: 12,
          //                     ),
          //                   ),
          //                   const SizedBox(width: AppSizes.padding / 2),
          //                   Text(
          //                     model.selectedPaymentMethod?['name'] ?? "-",
          //                     style: AppTextStyle.extraBold(context),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     : const SizedBox.shrink(),
          AppButton(
            onTap: () async {
              // if (model.selectedPaymentMethod == null) {
              //   var method = await AppModal.show(
              //     context: context,
              //     title: 'Pilih Metode Pembayaran',
              //     child: const PaymentMethodListModal(),
              //   );

              //   if (method != null) {
              //     model.onSelectPaymentMethod(method);
              //   }
              // } else {
              final navigator = Navigator.of(context);
              model.onTapPay(navigator);
              // TODO HANDLE ORDER SUMMARY
              // }
            },
            // buttonColor: model.selectedPaymentMethod == null ? AppColors.primary : AppColors.greenLv1,
            height: 54,
            padding: EdgeInsets.zero,
            // text: model.selectedPaymentMethod == null ? 'Pilih Metode Pembayaran' : 'Bayar',
            text: 'Bayar',
          ),
        ],
      ),
    );
  }
}
