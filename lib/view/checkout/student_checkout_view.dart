import 'package:countdown_widget/countdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/atom/app_gradient_text.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_modal.dart';
import '../../../widget/atom/app_widget_list_wrapper.dart';
import '../../app/service/locator/service_locator.dart';
import '../../view_model/checkout_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/organism/payment_method/payment_method_list_modal.dart';
import '../main/main_view.dart';

class StudentCheckoutView extends StatefulWidget {
  const StudentCheckoutView({Key? key}) : super(key: key);

  static const String routeName = '/student-checkout';

  @override
  State<StudentCheckoutView> createState() => _StudentCheckoutViewState();
}

class _StudentCheckoutViewState extends State<StudentCheckoutView> {
  final _checkoutViewModel = locator<CheckoutViewModel>();

  @override
  Widget build(BuildContext context) {
    // TODO ORDER DATA

    // final orderId = ModalRoute.of(context)?.settings.arguments as int?;

    // if (orderId != null) {
    //   _checkoutViewModel.getOrder(orderId);
    // } else {
    //   Navigator.pop(context);
    // }

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
                body: body(),
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

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          orderStatus(),
          orderInfo(),
          orderItems(),
          orderPricing(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget orderStatus() {
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
                    CountDownWidget(
                      // TODO
                      duration: Duration(hours: 24),
                      builder: (context, duration) {
                        return Text(
                          "${duration.inHours}:${duration.inMinutes}:${duration.inSeconds}",
                          style: AppTextStyle.bold(
                            context,
                            fontSize: 12,
                            color: AppColors.red,
                          ),
                        );
                      },
                      onDurationRemainChanged: (duration) {
                        print('duration:${duration.toString()}');
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

  Widget orderInfo() {
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
                    '#123456789',
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
                    '24 Agustus 2023',
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

  Widget orderItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppExpansionListTile(
        title: 'Item Order',
        icon: Icons.timelapse_rounded,
        expand: true,
        children: [
          ...List.generate(1, (i) {
            return orderItemCard(i);
          }),
        ],
      ),
    );
  }

  Widget orderItemCard(int i) {
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
                        i == 0 ? 'Registrasi Siswa' : 'Hotel Borobudur',
                        style: AppTextStyle.extraBold(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        i == 0 ? 'Kuantitas 14 Orang' : 'Kuantitas 14 Orang',
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
              i == 0 ? 'Rp. 1.000.000' : 'FREE',
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

  Widget orderPricing() {
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
          model.selectedPaymentMethod != null
              ? Padding(
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
                    ],
                  ),
                )
              : const SizedBox.shrink(),
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
}
