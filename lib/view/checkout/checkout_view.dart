import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/order_find_one.graphql.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_gradient_text.dart';
import '../../../widget/atom/app_modal.dart';
import '../../../widget/atom/app_widget_list_wrapper.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/currency_formatter.dart';
import '../../app/utility/date_formatter.dart';
import '../../view_model/checkout_view_model.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/atom/app_progress_indicator.dart';
import '../../widget/organism/payment_method/payment_method_list_modal.dart';
import '../main/main_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final _checkoutViewModel = locator<CheckoutViewModel>();

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)?.settings.arguments as int?;

    if (orderId != null) {
      _checkoutViewModel.getOrder(orderId);
    } else {
      Navigator.pop(context);
    }

    return ChangeNotifierProvider.value(
      value: _checkoutViewModel,
      builder: (context, snapshot) {
        return Consumer<CheckoutViewModel>(
          builder: (context, model, _) {
            if (model.order == null) {
              return const Scaffold(body: AppProgressIndicator());
            }

            return Scaffold(
              body: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [sliverAppBarWidget()];
                },
                body: body(model),
              ),
              bottomSheet: bottomButton(model),
            );
          },
        );
      },
    );
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
            "Lakukan pembayaran sebelum batas waktu berakhir agar tidak kehilangan Peluang.",
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     AppIconButton(
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       icon: Icons.arrow_back_ios_rounded,
          //       iconSize: 22,
          //     ),
          //     AppIconButton(
          //       onPressed: () {
          //         // TODO
          //       },
          //       icon: Icons.info_outline_rounded,
          //       iconSize: 22,
          //     ),
          //   ],
          // ),
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
          orderShipment(model),
          orderPricing(model),
          const SizedBox(height: AppSizes.padding * 8),
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
                    model.order?.id.toString() ?? '-',
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
                    DateFormatter.normal(model.order!.createdAt),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppExpansionListTile(
        title: '${model.order!.cart?.length ?? 0} Item Order',
        icon: Icons.timelapse_rounded,
        expand: true,
        children: [
          ...List.generate(model.order!.cart!.length, (i) {
            return orderItemCard(model.order!.cart![i], i);
          }),
        ],
      ),
    );
  }

  Widget orderItemCard(Query$OrderFindOne$orderFindOne$cart cart, int i) {
    return Container(
      margin: EdgeInsets.only(bottom: i == 3 ? 0 : AppSizes.padding / 4),
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
                        cart.membershipItem?.name ?? '',
                        style: AppTextStyle.extraBold(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        cart.membershipItem?.description ?? '',
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
              CurrencyFormatter.format(cart.membershipItem?.price ?? 0),
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

  Widget orderShipment(CheckoutViewModel model) {
    if (model.order!.shipping == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppExpansionListTile(
        title: 'Info Pengiriman',
        icon: Icons.local_shipping_outlined,
        backgroundColor: AppColors.white,
        expand: true,
        children: [
          shipmentReceiver(model),
          const SizedBox(height: AppSizes.padding / 4),
          shipmentService(model),
          const SizedBox(height: AppSizes.padding / 2),
        ],
      ),
    );
  }

  Widget shipmentReceiver(CheckoutViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.padding / 8,
        horizontal: AppSizes.padding / 2,
      ),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.baseLv7,
        borderRadius: BorderRadius.circular(AppSizes.radius * 1.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person_outline_rounded,
                      size: 20,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Expanded(
                      child: Text(
                        '${model.order!.shipping?.address.user?.firstName ?? '-'} ${model.order!.shipping?.address.user?.lastName ?? ''}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.extraBold(context),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.padding / 4,
                  horizontal: AppSizes.padding / 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.baseLv5.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'PENERIMA',
                  style: AppTextStyle.bold(
                    context,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.call_outlined,
                    size: 20,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    '${model.order!.shipping?.address.user?.whatsappNumber ?? '-'}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.medium(context),
                  ),
                ],
              ),
              const Icon(
                Icons.edit_square,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 20,
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Expanded(
                child: Text(
                  '${model.order!.shipping?.address.name ?? '-'}, ${model.order!.shipping?.address.user?.address.subdistrict.district.city.name ?? '-'}, ${model.order!.shipping?.address.user?.address.subdistrict.district.city.province.name ?? '-'}, Indonesia',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.medium(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.mail_outline_rounded,
                size: 20,
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Expanded(
                child: Text(
                  model.order!.shipping?.address.user?.address.subdistrict.postalCode ?? '-',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.medium(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget shipmentService(CheckoutViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.padding / 8,
        horizontal: AppSizes.padding / 2,
      ),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.baseLv7,
        borderRadius: BorderRadius.circular(AppSizes.radius * 1.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person_outline_rounded,
                      size: 20,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Expanded(
                      child: Text(
                        model.order!.shipping?.courier ?? '-',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.extraBold(context),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.padding / 4,
                  horizontal: AppSizes.padding / 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.baseLv5.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'KURIR',
                  style: AppTextStyle.bold(
                    context,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timelapse_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    model.order!.shipping?.estimatedTime ?? '-',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.medium(context),
                  ),
                ],
              ),
              const Icon(
                Icons.edit_square,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 20,
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Expanded(
                child: Text(
                  'Pengiriman Tanggal: ${model.order!.shipping != null ? DateFormatter.normal(model.order!.shipping?.deliveryDate ?? '') : '-'}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.medium(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.receipt_long_rounded,
                      size: 20,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Expanded(
                      child: Text(
                        'No. Resi: ${model.order!.shipping?.trackingNo ?? '-'} \n Paket akan dikirim setelah pembayaran',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.medium(context),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.copy,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.monetization_on_outlined,
                size: 20,
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Expanded(
                child: Text(
                  // TODO BIAYA ONGKIR
                  'Biaya Ongkir:  ${model.order!.shipping?.trackingNo ?? '-'}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.medium(context),
                ),
              ),
            ],
          )
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
                    "${model.order!.invoice.id}",
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
                    CurrencyFormatter.format(model.order!.invoice.amount),
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
                    CurrencyFormatter.format(model.order!.invoice.adminFee),
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
                    CurrencyFormatter.format(model.order!.invoice.amount + model.order!.invoice.adminFee),
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
          model.selectedPaymentMethod != null ? paymentMethod(model) : const SizedBox.shrink(),
          AppButton(
            onTap: () async {
              if (model.selectedPaymentMethod == null) {
                var method = await AppModal.show(
                  context: context,
                  title: 'Pilih Metode Pembayaran',
                  child: const PaymentMethodListModal(),
                );

                if (method != null) {
                  model.onSelectPaymentMethod(method);
                }
              } else {
                // TODO HANDLE ORDER SUMMARY
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainView.routeName,
                  (route) => false,
                );
              }
            },
            buttonColor: model.selectedPaymentMethod == null ? AppColors.primary : AppColors.greenLv1,
            height: 54,
            padding: EdgeInsets.zero,
            text: model.selectedPaymentMethod == null ? 'Pilih Metode Pembayaran' : 'Bayar',
          ),
        ],
      ),
    );
  }

  Widget paymentMethod(CheckoutViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Metode Pembayaran',
            style: AppTextStyle.semiBold(context),
          ),
          GestureDetector(
            onTap: () async {
              var method = await AppModal.show(
                context: context,
                title: 'Pilih Metode Pembayaran',
                child: const PaymentMethodListModal(),
              );

              if (method != null) {
                model.onSelectPaymentMethod(method);
              }
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  AppImage(
                    image: model.selectedPaymentMethod!.logoUrl,
                    width: 32,
                    height: 24,
                    backgroundColor: AppColors.baseLv6,
                    borderRadius: 8,
                    errorWidget: const Icon(
                      CupertinoIcons.building_2_fill,
                      color: AppColors.baseLv4,
                      size: 12,
                    ),
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    model.selectedPaymentMethod?.name ?? "-",
                    style: AppTextStyle.extraBold(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
