import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

import '../../atoms/my_asset_image.dart';
import '../../atoms/my_custom_button.dart';
import '../../atoms/my_custom_form.dart';
import '../../atoms/my_custom_text.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoundationColor.bgColorGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: FoundationSize.sizePadding * 2,
              right: FoundationSize.sizePadding * 2,
              left: FoundationSize.sizePadding * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      FoundationLinks.linkWarningIcon,
                      width: FoundationSize.sizeIcon,
                    ),
                  ],
                ),
                Text(
                  "Daftarkan Siswa",
                  style: FoundationTyphography.darkFontBold
                      .copyWith(fontSize: FoundationTyphography.fontSizeH1 + 8),
                ),
                Text(
                  "Harap mengisi data siswa",
                  style: FoundationTyphography.darkFontRegular.copyWith(),
                ),
                const SizedBox(
                  height: FoundationSize.sizeHeightDefault * 4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.25,
                  child: ListView(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 1.1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FoundationColor.bgWhite,
                            border:
                                Border.all(color: FoundationColor.bgColorGrey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: MyCustomForm(
                                  suffixIcon: IconButton(
                                    icon: Image.asset(
                                      FoundationLinks.linkPersonIconLogo,
                                      height: FoundationSize.sizeIconMini,
                                    ),
                                    onPressed: () {},
                                  ),
                                  click: () {},
                                  lableText: 'Nama Lengkap siswa',
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
                                    modalBottom(
                                        context,
                                        contentModalBottom(context, "Kota", [
                                          "Bandung",
                                          "Surabaya",
                                          "Banten",
                                          "Jakarta",
                                          "Yogyakartao"
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
                                    modalBottom(
                                        context,
                                        contentModalBottom(
                                            context, "Kecamatan", [
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
                                    icon: Image.asset(
                                        FoundationLinks.linkPhoneIcon),
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
                                    icon: Image.asset(
                                      FoundationLinks.linkDropdownIconLogo,
                                      width: FoundationSize.sizeIconMini,
                                    ),
                                    onPressed: () {},
                                  ),
                                  click: () {},
                                  lableText: 'Email',
                                ),
                              ),
                              Divider(),
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
                              Divider(),
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
                                  lableText: 'Hotel',
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
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
                          Expanded(flex: 4, child: Text('Email telah valid'))
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
                          Expanded(flex: 4, child: Text('Nomor whatsapp salah'))
                        ],
                      ),
                      const SizedBox(
                        height: FoundationSize.sizeHeightDefault,
                      ),
                      const Row(
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
                          Expanded(flex: 4, child: Text('Email valid'))
                        ],
                      ),
                      const SizedBox(
                        height: FoundationSize.sizeHeightDefault * 4,
                      ),
                      InkWell(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Center(
                              child: Text("Daftar",
                                  style: FoundationTyphography.lightFontBold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: FoundationSize.sizeHeightDefault * 4,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
