import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../atom/app_custom_button.dart';
import '../../../atom/app_custom_text.dart';
import '../../../atom/app_text_field.dart';
import '../../../molecule/authentications/modal_bottom.dart';

class KomisiSection extends StatefulWidget {
  const KomisiSection({super.key});

  @override
  State<KomisiSection> createState() => _KomisiSectionState();
}

class _KomisiSectionState extends State<KomisiSection> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 290,
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
              child: AppTextField(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    AppAssets.somePersonFormIconPath,
                    height: AppSizes.padding * 2,
                  ),
                  onPressed: () {},
                ),
                onTap: () {},
                lableText: 'Kode Referral',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: AppTextField(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: AppSizes.padding * 2,
                  ),
                  onPressed: () {},
                ),
                onTap: () {
                  ModalBottom.modalBottom(
                    context,
                    contentModalBottom(
                      context,
                      "Kota",
                      ["Bandung", "Surabaya", "Banten", "Jakarta", "Yogyakarta"],
                    ),
                  );
                },
                lableText: 'Bank',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: AppTextField(
                suffixIcon: IconButton(
                  icon: const Text(""),
                  onPressed: () {},
                ),
                onTap: () {},
                lableText: 'No Rekening',
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: AppSizes.height * 4,
      ),
      Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => CreatePasswordScreen(),
                //   ),
                // );
              },
              child: Center(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(40),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      "Sebelumnya",
                      style: AppTextStyle.bold(context).copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSizes.height / 2,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => CreatePasswordScreen(),
                //   ),
                // );
              },
              child: Center(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(30)),
                  ),
                  child: Center(
                    child: Text("Daftar", style: AppTextStyle.bold(context)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }

  ListView contentModalBottom(BuildContext context, String title, List<String> listOption) {
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(
            //     color: HexColor("#EBEBF0")),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.padding * 3,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: AppCustomText(
                          text: title,
                          style: AppTextStyle.bold(
                            context,
                            color: AppColors.base,
                          ).copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 12,
                          right: 10,
                          child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(context), child: const Icon(Icons.close)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSizes.height,
                ),
                ModalBottom.customRadioButtonBank(context, listOption[0], AppAssets.bankBCAImgPath, value == 0, () {
                  setState(() {
                    value = 0;
                  });
                }),
                ModalBottom.customRadioButtonBank(context, listOption[1], AppAssets.bankBNIImgPath, value == 1, () {
                  setState(() {
                    value = 1;
                  });
                }),
                ModalBottom.customRadioButtonBank(context, listOption[2], AppAssets.bankMandiriImgPath, value == 2, () {
                  setState(() {
                    value = 2;
                  });
                }),
                ModalBottom.customRadioButtonBank(context, listOption[3], AppAssets.bankMegaImgPath, value == 3, () {
                  setState(() {
                    value = 3;
                  });
                }),
                const SizedBox(
                  height: AppSizes.height,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                        AppSizes.padding,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
