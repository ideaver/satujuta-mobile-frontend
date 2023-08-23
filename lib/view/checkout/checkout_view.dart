import 'package:flutter/material.dart';

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
import '../../widget/atom/app_icon_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  bool isOrderItemsShowed = true;
  bool isOrderShipmentShowed = true;

  @override
  Widget build(BuildContext context) {
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
      bottomSheet: bottomButton(),
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
          orderShipment(),
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
                    Text(
                      "00:30:25",
                      style: AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.red,
                      ),
                    )
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
        title: '4 Item Order',
        icon: Icons.timelapse_rounded,
        expand: true,
        children: [
          ...List.generate(4, (i) {
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
                        i == 0 ? 'Paket PREMIUM SatuJuta Membership' : 'Hotel Borobudur',
                        style: AppTextStyle.extraBold(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        i == 0 ? 'Berlisensi PT Satu Juta Kampung Inggris ' : 'Pilihan Hotel Anda',
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

  Widget orderShipment() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding * 2),
      child: AppExpansionListTile(
        title: 'Info Pengiriman',
        icon: Icons.local_shipping_outlined,
        backgroundColor: AppColors.white,
        expand: true,
        children: [
          shipmentReceiver(),
          const SizedBox(height: AppSizes.padding / 4),
          shipmentService(),
          const SizedBox(height: AppSizes.padding / 2),
        ],
      ),
    );
  }

  Widget shipmentReceiver() {
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
                        'Anton Prabowo',
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
                    '+62811122223333',
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
                  'jln ambarawa no 1 Semarang - Jawa Timur, Indonesia',
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
                  '223344',
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

  Widget shipmentService() {
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
                        'JNE Reguler',
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
                    '2-3 Hari',
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
                  'Pengiriman Tanggal: -',
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
                        'No. Resi: - \n Paket akan dikirim setelah pembayaran',
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
                  'Biaya Ongkir: -',
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

  Widget bottomButton() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      height: 94,
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
      child: AppButton(
        text: 'Pilih Metode Pembayaran',
        onTap: () {
          AppModal.show(
            context: context,
            title: 'Pilih Metode Pembayaran',
            child: paymentMethodList(),
          );
        },
      ),
    );
  }

  Widget paymentMethodList() {
    return Column(
      children: [
        orderStatus(),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 280,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppExpansionListTile(
                  title: 'Transfer Bank',
                  icon: Icons.credit_card,
                  expand: true,
                  children: [
                    ...List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                        ),
                        child: RadioListTile(
                          value: null,
                          groupValue: null,
                          onChanged: (value) {},
                          title: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: AppImage(
                                  image: AppAssets.bankMandiriImgPath,
                                  imgProvider: ImgProvider.assetImage,
                                ),
                              ),
                              const SizedBox(width: AppSizes.padding),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bank Mandiri',
                                    style: AppTextStyle.bold(context),
                                  ),
                                  const SizedBox(height: AppSizes.padding / 2),
                                  Text(
                                    'Admin Fee Rp 2.500',
                                    style: AppTextStyle.regular(
                                      context,
                                      fontSize: 12,
                                      color: AppColors.baseLv4,
                                    ),
                                  ),
                                ],
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
                    })
                  ],
                ),
                const SizedBox(height: AppSizes.padding),
                AppExpansionListTile(
                  title: 'Virtual Account',
                  icon: Icons.credit_card,
                  expand: true,
                  children: [
                    ...List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                        ),
                        child: RadioListTile(
                          value: null,
                          groupValue: null,
                          onChanged: (value) {},
                          title: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: AppImage(
                                  image: AppAssets.bankMandiriImgPath,
                                  imgProvider: ImgProvider.assetImage,
                                ),
                              ),
                              const SizedBox(width: AppSizes.padding),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bank Mandiri',
                                    style: AppTextStyle.bold(context),
                                  ),
                                  const SizedBox(height: AppSizes.padding / 2),
                                  Text(
                                    'Admin Fee Rp 2.500',
                                    style: AppTextStyle.regular(
                                      context,
                                      fontSize: 12,
                                      color: AppColors.baseLv4,
                                    ),
                                  ),
                                ],
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
                    })
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        AppButton(
          onTap: () {
            // TODO
            Navigator.pop(context);
          },
          text: 'Pilih',
        ),
      ],
    );
  }
}
