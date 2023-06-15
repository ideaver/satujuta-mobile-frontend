import 'package:flutter/material.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/widget/app_gradient_text.dart';
import '../../app/widget/my_icon_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
                  // TODO
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
          orderStatusWidget(),
          orderInfo(),
        ],
      ),
    );
  }

  Widget orderStatusWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Container(
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
    return Column(
      children: [
        const SizedBox(height: AppSizes.padding * 2),
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(66, 181, 178, 178),
                offset: Offset(
                  1,
                  1,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.coinFormIconPath,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Create date",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Text(
                  "25 Mar 2022",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(66, 181, 178, 178),
                offset: Offset(1, 1),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.coinFormIconPath,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Deadline",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Text(
                  "31 Dec 2022",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(66, 181, 178, 178),
                offset: Offset(
                  1,
                  1,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.bankBNIImgPath,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "History testing (25)",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  AppAssets.coinFormIconPath,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        com("84 minutes", "80"),
        const SizedBox(
          height: 10,
        ),
        com("25 minutes", "80"),
        const SizedBox(
          height: 10,
        ),
        com("Practices", "60"),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget com(String tex, String tex2) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(66, 181, 178, 178),
            offset: Offset(
              1,
              1,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.bankBCAImgPath,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tex,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "18:20, 22/10/2021",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 10, color: Theme.of(context).disabledColor),
                ),
              ],
            ),
            const Spacer(),
            Text(
              tex2,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 70,
              decoration: const BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                child: Text(
                  "Point",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
