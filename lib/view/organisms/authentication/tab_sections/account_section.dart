import 'package:flutter/material.dart';

import '../../../../app/const/app_assets.dart';
import '../../../../app/const/app_sizes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/widget/my_asset_image.dart';
import '../../../../app/widget/my_custom_form.dart';
import '../../../molecules/footer_double_button.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 370,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.baseLv4),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    AppAssets.phoneIconPath,
                    height: AppSizes.padding * 2,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'No Whatsapp',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const MyAssetImage(
                    path: AppAssets.dropdownRectangleFormIconPath,
                    widthImage: AppSizes.padding * 2,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Email',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const MyAssetImage(
                    path: AppAssets.passwordIconPath,
                    widthImage: AppSizes.padding * 2,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Kata Sandi',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const MyAssetImage(
                    path: AppAssets.passwordIconPath,
                    widthImage: AppSizes.padding * 2,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Konfirmasi Kata Sandi',
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: AppSizes.height * 4,
      ),
      const Row(
        children: [
          Expanded(
            child: MyAssetImage(
              path: AppAssets.successIconPath,
              widthImage: AppSizes.padding * 2,
            ),
          ),
          Expanded(flex: 4, child: Text('Besar atau kecil karakter'))
        ],
      ),
      const SizedBox(
        height: AppSizes.height,
      ),
      const Row(
        children: [
          Expanded(
            child: MyAssetImage(
              path: AppAssets.failedIconPath,
              widthImage: AppSizes.padding * 2,
            ),
          ),
          Expanded(flex: 4, child: Text('6 atau lebih karakter'))
        ],
      ),
      const SizedBox(
        height: AppSizes.height,
      ),
      const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: MyAssetImage(
              path: AppAssets.unsuccessIconPath,
              widthImage: AppSizes.padding * 2,
            ),
          ),
          Expanded(flex: 4, child: Text('Setidaknya 1 nomor'))
        ],
      ),
      const SizedBox(
        height: AppSizes.height * 4,
      ),
      FooterDoubleButton(
        textLeftButton: "Sebelumnya",
        textRightButton: "Lanjutkan",
        onPressedLeftButton: () {},
        onPressedRightButton: () {},
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }

  // List<Widget> contentModalBottom(
  //     BuildContext context, String title, List<String> listOption) {
  //   return [
  //     Container(
  //       decoration: const BoxDecoration(
  //         color: Colors.white,
  //         // border: Border.all(
  //         //     color: HexColor("#EBEBF0")),
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(25.0),
  //           topRight: Radius.circular(25.0),
  //         ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: AppSizes.kPadding * 3,
  //               width: double.infinity,
  //               child: Stack(
  //                 children: [
  //                   Center(
  //                     child: MyCustomText(
  //                       text: title,
  //                       style: AppTextStyle.bold(
  //   context,
  //   color: AppColors.kColorBase,
  // ),.copyWith(
  //                           fontSize: 14Large,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   Positioned(
  //                       top: 12,
  //                       right: 10,
  //                       child: GestureDetector(
  //                           onTap: () => Navigator.of(context).pop(context),
  //                           child: Icon(Icons.close)))
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(
  //               height: AppSizes.kHeight,
  //             ),
  //             ModalBottom.customRadioButton(listOption[0], value == 0, () {
  //               setState(() {
  //                 value = 0;
  //               });
  //             }),
  //             ModalBottom.customRadioButton(listOption[1], value == 1, () {
  //               setState(() {
  //                 value = 1;
  //               });
  //             }),
  //             ModalBottom.customRadioButton(listOption[2], value == 2, () {
  //               setState(() {
  //                 value = 2;
  //               });
  //             }),
  //             ModalBottom.customRadioButton(listOption[3], value == 3, () {
  //               setState(() {
  //                 value = 3;
  //               });
  //             }),
  //             const SizedBox(
  //               height: AppSizes.kHeight,
  //             ),
  //             SizedBox(
  //               width: double.infinity,
  //               child: MyCustomButton(
  //                   text: "Pilih",
  //                   decoration: BoxDecoration(
  //                       color: AppColors.kColorPrimary,
  //                       borderRadius:
  //                           BorderRadius.circular(AppSizes.kPadding))),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   ];
  // }

  // Future<void> modalBottom(BuildContext context, List<Widget> list) {
  //   return showModalBottomSheet<void>(
  //     context: context,
  //     backgroundColor: AppColors.kColorGrey,
  //     builder: (BuildContext context) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height / 1.2,
  //         child: ListView(children: list),
  //       );
  //     },
  //   );
  // }

  // Widget customRadioButton(String text, int index) {
  //   return Container(
  //     width: double.infinity,
  //     margin:
  //         EdgeInsets.symmetric(vertical: AppSizes.kHeight / 2),
  //     child: ElevatedButton(
  //       onPressed: () {
  //         setState(() {
  //           value = index;
  //           print(value);
  //           print("INDEX $index");
  //         });
  //       },
  //       style: ButtonStyle(
  //           shape: MaterialStatePropertyAll(RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10)))),
  //       child: Container(
  //         padding: const EdgeInsets.all(AppSizes.kHeight * 2),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               text,
  //               style: AppTextStyle.bold(
  //   context,
  //   color: AppColors.kColorBase,
  // ),.copyWith(
  //                 color: (value == index) ? Colors.green : Colors.black,
  //               ),
  //             ),
  //             Container(
  //               width: AppSizes.kPadding * 2 / 2,
  //               height: AppSizes.kPadding * 2 / 2,
  //               decoration: BoxDecoration(
  //                   color: index == value
  //                       ? AppColors.kColorPrimary
  //                       : AppColors.kColorWhite,
  //                   borderRadius: BorderRadius.circular(
  //                       AppSizes.kHeight * 5),
  //                   border: Border.all(
  //                       color: AppColors.kColorGrey,
  //                       style: BorderStyle.solid,
  //                       width: 2)),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
