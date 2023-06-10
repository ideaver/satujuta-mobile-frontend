import 'package:flutter/material.dart';

import '../../../atoms/my_custom_button.dart';
import '../../../atoms/my_custom_form.dart';
import '../../../atoms/my_custom_text.dart';
import '../../../foundations/foundation_colors.dart';
import '../../../foundations/foundation_links.dart';
import '../../../foundations/foundation_size.dart';
import '../../../foundations/foundation_typhography.dart';
import '../../../molecules/authentications/modal_bottom.dart';

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
                    FoundationLinks.linkSomePersonIconLogo,
                    height: FoundationSize.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Kode Referral',
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
                lableText: 'Bank',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const Text(""),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'No Rekening',
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: FoundationSize.sizeHeightDefault * 4,
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
                    color: FoundationColor.bgPrimary.withAlpha(40),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      "Sebelumnya",
                      style: FoundationTyphography.lightFontBold
                          .copyWith(color: FoundationColor.bgSplashScreen),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: FoundationSize.sizeHeightDefault / 2,
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
                    child: Text("Daftar",
                        style: FoundationTyphography.lightFontBold),
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
                ModalBottom.customRadioButtonBank(
                    listOption[0], FoundationLinks.linkBankBCAImage, value == 0,
                    () {
                  setState(() {
                    value = 0;
                  });
                }),
                ModalBottom.customRadioButtonBank(
                    listOption[1], FoundationLinks.linkBankBNIImage, value == 1,
                    () {
                  setState(() {
                    value = 1;
                  });
                }),
                ModalBottom.customRadioButtonBank(listOption[2],
                    FoundationLinks.linkBankMandiriImage, value == 2, () {
                  setState(() {
                    value = 2;
                  });
                }),
                ModalBottom.customRadioButtonBank(listOption[3],
                    FoundationLinks.linkBankMegaImage, value == 3, () {
                  setState(() {
                    value = 3;
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
