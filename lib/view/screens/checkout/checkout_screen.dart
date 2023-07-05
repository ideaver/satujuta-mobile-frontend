import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../organisms/authentication/auth_top_bar_register.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopbarCheckOut(),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(66, 231, 59, 99),
                      offset: const Offset(
                        1,
                        1,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                  ],
                  color: AppColors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.clockIconPath,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "00: 30 : 25",
                              style: AppTextStyle.bold(context).copyWith(
                                fontSize: 12,
                                color: AppColors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Batas Bayar".toUpperCase(),
                        style: AppTextStyle.bold(context).copyWith(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        AppAssets.arrowForwardIconPath,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 3000,
              child: ListView(
                padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: MediaQuery.of(context).padding.bottom,
                  top: 8,
                ),
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(66, 181, 178, 178),
                          offset: const Offset(
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Create date",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Spacer(),
                          Text(
                            "25 Mar 2022",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(66, 181, 178, 178),
                          offset: const Offset(
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Deadline",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Spacer(),
                          Text(
                            "31 Dec 2022",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(66, 181, 178, 178),
                          offset: const Offset(
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "History testing (25)",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Spacer(),
                          SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  com("84 minutes", "80"),
                  SizedBox(
                    height: 10,
                  ),
                  com("25 minutes", "80"),
                  SizedBox(
                    height: 10,
                  ),
                  com("Practices", "60"),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String tex, String tex2) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(66, 181, 178, 178),
            offset: const Offset(
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
            SizedBox(
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
                SizedBox(
                  height: 5,
                ),
                Text(
                  "18:20, 22/10/2021",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 10, color: Theme.of(context).disabledColor),
                ),
              ],
            ),
            Spacer(),
            Text(
              tex2,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
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
