import 'package:flutter/material.dart';

import '../../../atoms/my_custom_button.dart';
import '../../../atoms/my_custom_form.dart';
import '../../../atoms/my_custom_text.dart';
import '../../../foundations/foundation_colors.dart';
import '../../../foundations/foundation_links.dart';
import '../../../foundations/foundation_size.dart';
import '../../../foundations/foundation_typhography.dart';
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
          color: FoundationColor.bgWhite,
          border: Border.all(color: FoundationColor.bgColorGrey),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    FoundationLinks.linkContactLogo,
                    height: FoundationSize.sizeIconMini,
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
                    size: FoundationSize.sizeIconMini,
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
                    size: FoundationSize.sizeIconMini,
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
                    size: FoundationSize.sizeIconMini,
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
                    FoundationLinks.linkDropdownIconLogo,
                    width: FoundationSize.sizeIconMini,
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
                    size: FoundationSize.sizeIconMini,
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
                    FoundationLinks.linkSchoolIconLogo,
                    width: FoundationSize.sizeIconMini,
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
              child: Text("Berikutnya",
                  style: FoundationTyphography.lightFontBold),
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
                  height: FoundationSize.sizeIcon,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: MyCustomText(
                          text: title,
                          style: FoundationTyphography.darkFontBold.copyWith(
                              fontSize: FoundationTyphography.fontSizeH3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                          top: 12,
                          right: 10,
                          child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(context),
                              child: const Icon(Icons.close)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: FoundationSize.sizeHeightDefault,
                ),
                ModalBottom.customRadioButton(listOption[0], value == 0, () {
                  setState(() {
                    value = 0;
                  });
                }),
                ModalBottom.customRadioButton(listOption[1], value == 1, () {
                  setState(() {
                    value = 1;
                  });
                }),
                ModalBottom.customRadioButton(listOption[2], value == 2, () {
                  setState(() {
                    value = 2;
                  });
                }),
                ModalBottom.customRadioButton(listOption[3], value == 3, () {
                  setState(() {
                    value = 3;
                  });
                }),
                ModalBottom.customRadioButton(listOption[4], value == 4, () {
                  setState(() {
                    value = 4;
                  });
                }),
                const SizedBox(
                  height: FoundationSize.sizeHeightDefault,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MyCustomButton(
                      text: "Pilih",
                      decoration: BoxDecoration(
                          color: FoundationColor.bgPrimary,
                          borderRadius: BorderRadius.circular(
                              FoundationSize.sizePadding))),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
