import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_asset_image.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_button_with_icon.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_button.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_form.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_text.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          FoundationLinks.linkbackgroundAestheticFourth),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: FoundationSize.sizeHeightDefault * 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: FoundationSize.sizePadding * 2),
                    child: Row(
                      children: [
                        Image.asset(
                          FoundationLinks.linkLockIconLogo,
                          height: 30,
                        ),
                        const Spacer(),
                        MyButtonWithIcon(
                            onPressed: () {},
                            text: "Login",
                            buttonStyle: ButtonStyle())
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: FoundationSize.sizePadding * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Registrasi",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bergabung menjadi anggota SatuJuta!",
                          style: FoundationTyphography.darkFontRegular.copyWith(
                              fontSize: FoundationTyphography.fontSizeH4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: FoundationSize.sizeHeightDefault * 5,
                    ),
                    Center(
                      child: MyCustomText(
                          text: 'Upload Foto Profile Anda',
                          style: FoundationTyphography.darkFontBold.copyWith(
                              fontSize: FoundationTyphography.fontSizeH3)),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: FoundationSize.sizeHeightDefault * 5),
                        width: MediaQuery.of(context).size.width * .5,
                        height: 150,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                child: const CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 20,
                                child: Container(
                                  width: FoundationSize.sizeIcon,
                                  height: FoundationSize.sizeIcon,
                                  decoration: BoxDecoration(
                                      color: FoundationColor.bgPrimary,
                                      borderRadius: BorderRadius.circular(
                                          FoundationSize.sizeHeightDefault *
                                              5)),
                                  child: Image.asset(
                                    FoundationLinks.linkEditIconLogo,
                                    width: FoundationSize.sizeIconMini,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 600,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_literals_to_create_immutables
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: FoundationColor.bgColorGrey),
                            child: Container(
                              width: double.infinity,
                              child: TabBar(
                                controller: tabController,
                                indicator: BoxDecoration(
                                  color: FoundationColor.bgWhite,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelColor: FoundationColor.bgColorBase,
                                indicatorColor: Colors.white,
                                // ignore: prefer_const_literals_to_create_immutables
                                tabs: [
                                  Tab(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image.asset(FoundationLinks
                                                .linkPersonIconLogo),
                                          ),
                                          Expanded(
                                              child: Text(
                                            "Data Diri",
                                            style: TextStyle(
                                              fontSize: FoundationTyphography
                                                  .fontSizeH5,
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            FoundationLinks.linkLockIconLogo),
                                        SizedBox(
                                          width:
                                              FoundationSize.sizeHeightDefault /
                                                  2,
                                        ),
                                        Text("Akun")
                                      ],
                                    ),
                                  )),
                                  Tab(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              FoundationLinks.linkCoinIconLogo),
                                          SizedBox(
                                            width: FoundationSize
                                                    .sizeHeightDefault /
                                                2,
                                          ),
                                          Text("Komisi")
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 5,
                            child: TabBarView(
                                controller: tabController,
                                children: const [
                                  BiodataSection(),
                                  AccountSection(),
                                  KomisiSection(),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class BiodataSection extends StatefulWidget {
  const BiodataSection({super.key});

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
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  onPressed: () {},
                ),
                click: () {
                  modalBottom(
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
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Center(
              child: Text("Berikutnya",
                  style: FoundationTyphography.lightFontBold),
            ),
          ),
        ),
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
                    FoundationLinks.linkContactLogo,
                    height: FoundationSize.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'No Whatsapp',
              ),
            ),
            Divider(),
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
                lableText: 'Email',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    FoundationLinks.linkPasswordIconLogo,
                    width: FoundationSize.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Kata Sandi',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    FoundationLinks.linkPasswordIconLogo,
                    width: FoundationSize.sizeIconMini,
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
      SizedBox(
        height: FoundationSize.sizeHeightDefault * 4,
      ),
      Row(
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
      SizedBox(
        height: FoundationSize.sizeHeightDefault,
      ),
      Row(
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
            Divider(),
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
                click: () {},
                lableText: 'Bank',
              ),
            ),
            Divider(),
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
                    child: Text("Daftar",
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
      margin: const EdgeInsets.symmetric(
          vertical: FoundationSize.sizeHeightDefault / 2),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            value = index;
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
