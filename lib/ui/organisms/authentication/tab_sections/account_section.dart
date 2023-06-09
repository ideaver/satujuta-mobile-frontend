import 'package:flutter/material.dart';

import '../../../atoms/my_asset_image.dart';
import '../../../atoms/my_custom_button.dart';
import '../../../atoms/my_custom_form.dart';
import '../../../atoms/my_custom_text.dart';
import '../../../foundations/foundation_colors.dart';
import '../../../foundations/foundation_links.dart';
import '../../../foundations/foundation_size.dart';
import '../../../foundations/foundation_typhography.dart';

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
                    FoundationLinks.linkPhoneIcon,
                    height: FoundationSize.sizeIconMini,
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
                    path: FoundationLinks.linkDropdownIconLogo,
                    widthImage: FoundationSize.sizeIconMini,
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
                    path: FoundationLinks.linkPasswordIconLogo,
                    widthImage: FoundationSize.sizeIconMini,
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
                    path: FoundationLinks.linkPasswordIconLogo,
                    widthImage: FoundationSize.sizeIconMini,
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
        height: FoundationSize.sizeHeightDefault * 4,
      ),
      const Row(
        children: [
          Expanded(
            child: MyAssetImage(
              path: FoundationLinks.linkSuccessIconLogo,
              widthImage: FoundationSize.sizeIconMini,
            ),
          ),
          Expanded(flex: 4, child: Text('Besar atau kecil karakter'))
        ],
      ),
      const SizedBox(
        height: FoundationSize.sizeHeightDefault,
      ),
      const Row(
        children: [
          Expanded(
            child: MyAssetImage(
              path: FoundationLinks.linkFailedIconLogo,
              widthImage: FoundationSize.sizeIconMini,
            ),
          ),
          Expanded(flex: 4, child: Text('6 atau lebih karakter'))
        ],
      ),
      SizedBox(
        height: FoundationSize.sizeHeightDefault,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: MyAssetImage(
              path: FoundationLinks.linkUnSuccessIconLogo,
              widthImage: FoundationSize.sizeIconMini,
            ),
          ),
          Expanded(flex: 4, child: Text('Setidaknya 1 nomor'))
        ],
      ),
      SizedBox(
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
                    borderRadius: BorderRadius.only(
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(30)),
                  ),
                  child: Center(
                    child: Text("Continue",
                        style: FoundationTyphography.lightFontBold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      )
    ]);
  }

  List<Widget> contentModalBottom(
      BuildContext context, String title, List<String> listOption) {
    return [
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
                            child: Icon(Icons.close)))
                  ],
                ),
              ),
              SizedBox(
                height: FoundationSize.sizeHeightDefault,
              ),
              customRadioButton(listOption[0], 0),
              customRadioButton(listOption[1], 1),
              customRadioButton(listOption[2], 2),
              customRadioButton(listOption[3], 3),
              customRadioButton(listOption[4], 4),
              SizedBox(
                height: FoundationSize.sizeHeightDefault,
              ),
              Container(
                width: double.infinity,
                child: MyCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                        color: FoundationColor.bgPrimary,
                        borderRadius:
                            BorderRadius.circular(FoundationSize.sizePadding))),
              )
            ],
          ),
        ),
      ),
    ];
  }

  Future<void> modalBottom(BuildContext context, List<Widget> list) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: FoundationColor.bgColorGrey,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.2,
          child: ListView(children: list),
        );
      },
    );
  }

  Widget customRadioButton(String text, int index) {
    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(vertical: FoundationSize.sizeHeightDefault / 2),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            value = index;
            print(value);
            print("INDEX $index");
          });
        },
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: Container(
          padding: const EdgeInsets.all(FoundationSize.sizeHeightDefault * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: FoundationTyphography.darkFontBold.copyWith(
                  color: (value == index) ? Colors.green : Colors.black,
                ),
              ),
              Container(
                width: FoundationSize.sizeIconMini / 2,
                height: FoundationSize.sizeIconMini / 2,
                decoration: BoxDecoration(
                    color: index == value
                        ? FoundationColor.bgPrimary
                        : FoundationColor.bgWhite,
                    borderRadius: BorderRadius.circular(
                        FoundationSize.sizeHeightDefault * 5),
                    border: Border.all(
                        color: FoundationColor.bgColorGrey,
                        style: BorderStyle.solid,
                        width: 2)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
