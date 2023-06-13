import 'package:flutter/material.dart';

import '../../../../app/const/app_assets.dart';
import '../../../../app/const/app_sizes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../atoms/my_custom_button.dart';
import '../../../atoms/my_custom_form.dart';
import '../../../atoms/my_custom_text.dart';
import '../../../molecules/authentications/modal_bottom.dart';

class BiodataSection extends StatefulWidget {
  const BiodataSection({super.key, required this.controller});
  final TabController controller;
  @override
  State<BiodataSection> createState() => _BiodataSectionState();
}

class _BiodataSectionState extends State<BiodataSection> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 660,
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
                    AppAssets.contactFormIconPath,
                    height: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Nama Lengkap',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.location_on_rounded,
                    size: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Alamat',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {
                  ModalBottom.modalBottom(
                      context,
                      contentModalBottom(context, "Kota", [
                        "Bandung",
                        "Surabaya",
                        "Banten",
                        "Jakarta",
                        "Yogyakarta"
                      ]));
                },
                lableText: 'Kota',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {
                  ModalBottom.modalBottom(
                      context,
                      contentModalBottom(context, "Kecamatan", [
                        "Tambak Sari",
                        "Lidah Wetan",
                        "Kaliasin",
                        "Benowo",
                        "Tambak boyo"
                      ]));
                },
                lableText: 'Kecamatan',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    AppAssets.dropdownRectangleFormIconPath,
                    width: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Kode Pos',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {
                  ModalBottom.modalBottom(
                    context,
                    contentModalBottom(context, "Role", [
                      "Siswa",
                      "Guru",
                      "Kepala Sekolah",
                      "Orang Tua",
                      "Lainnya"
                    ]),
                  );
                },
                lableText: 'Role',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    AppAssets.schoolIconPath,
                    width: AppSizes.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Sekolah',
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          widget.controller.animateTo(1);
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
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Center(
              child: Text("Berikutnya", style: AppTextStyle.bold(context)),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }

  ListView contentModalBottom(
      BuildContext context, String title, List<String> listOption) {
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
                  height: AppSizes.sizeIcon,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: MyCustomText(
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
                          onTap: () => Navigator.of(context).pop(context),
                          child: const Icon(
                            Icons.close,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSizes.sizeHeightDefault,
                ),
                ModalBottom.customRadioButton(
                    context, listOption[0], value == 0, () {
                  setState(() {
                    value = 0;
                  });
                }),
                ModalBottom.customRadioButton(
                    context, listOption[1], value == 1, () {
                  setState(() {
                    value = 1;
                  });
                }),
                ModalBottom.customRadioButton(
                    context, listOption[2], value == 2, () {
                  setState(() {
                    value = 2;
                  });
                }),
                ModalBottom.customRadioButton(
                    context, listOption[3], value == 3, () {
                  setState(() {
                    value = 3;
                  });
                }),
                ModalBottom.customRadioButton(
                    context, listOption[4], value == 4, () {
                  setState(() {
                    value = 4;
                  });
                }),
                const SizedBox(
                  height: AppSizes.sizeHeightDefault,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MyCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                        AppSizes.sizePadding,
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
