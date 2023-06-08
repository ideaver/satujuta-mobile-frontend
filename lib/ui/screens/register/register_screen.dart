import 'package:flutter/material.dart';
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
        child: Padding(
            padding: EdgeInsets.only(
              left: 18,
              right: 18,
              top: MediaQuery.of(context).padding.top + 50,
            ),
            child: Column(
              children: [
                Row(
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Registrasi",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Bergabung menjadi anggota SatuJuta!",
                  style: FoundationTyphography.darkFontRegular
                      .copyWith(fontSize: FoundationTyphography.fontSizeH5),
                ),
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
                                      FoundationSize.sizeHeightDefault * 5)),
                              child: Icon(
                                Icons.abc,
                                color: FoundationColor.bgWhite,
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
                              color: FoundationColor.bgColorBase,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelColor: Colors.white,
                            indicatorColor: Colors.white,
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              const Tab(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_box,
                                      color: Colors.black,
                                    ),
                                    Text("Data Diri")
                                  ],
                                ),
                              ),
                              Tab(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.add_box,
                                    color: Colors.black,
                                  ),
                                  Text("Akun")
                                ],
                              )),
                              Tab(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_box,
                                      color: Colors.black,
                                    ),
                                    Text("Komisi")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: FoundationSize.sizeHeightDefault,
                      ),
                      Expanded(
                        flex: 5,
                        child: TabBarView(
                            controller: tabController,
                            children: const [
                              BiodataSection(),
                              AccountSection(),
                              AccountSection(),
                            ]),
                      )
                    ],
                  ),
                ),
              ],
            )),
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
        height: 700,
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
                lableText: 'Alamat',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: FoundationSize.sizeIconMini,
                  ),
                  onPressed: () {},
                ),
                click: () {
                  modalBottom(
                    context,
                    [
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
                                        text: "Kota",
                                        style: FoundationTyphography
                                            .darkFontBold
                                            .copyWith(
                                                fontSize: FoundationTyphography
                                                    .fontSizeH3,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                        top: 12,
                                        right: 10,
                                        child: GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pop(context),
                                            child: Icon(Icons.close)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: FoundationSize.sizeHeightDefault,
                              ),
                              customRadioButton("Bandung", 0),
                              customRadioButton("Surabaya", 1),
                              customRadioButton("Banten", 2),
                              customRadioButton("Jakarta", 3),
                              customRadioButton("Yogyakarta", 4),
                              SizedBox(
                                height: FoundationSize.sizeHeightDefault,
                              ),
                              Container(
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
                      ),
                    ],
                  );
                },
                lableText: 'Kota',
              ),
            ),
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
                    [
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
                                        text: "Kecamatan",
                                        style: FoundationTyphography
                                            .darkFontBold
                                            .copyWith(
                                                fontSize: FoundationTyphography
                                                    .fontSizeH3,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                        top: 12,
                                        right: 10,
                                        child: GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pop(context),
                                            child: Icon(Icons.close)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: FoundationSize.sizeHeightDefault,
                              ),
                              customRadioButton("Tambaksari", 0),
                              customRadioButton("Lidah Wetan", 1),
                              customRadioButton("Benowo", 2),
                              customRadioButton("Kaliasin", 3),
                              customRadioButton("Gubeng", 4),
                              SizedBox(
                                height: FoundationSize.sizeHeightDefault,
                              ),
                              Container(
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
                      ),
                    ],
                  );
                },
                lableText: 'Kecamatan',
              ),
            ),
            Divider(),
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
            Divider(),
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
                    [
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
                                        text: "Role",
                                        style: FoundationTyphography
                                            .darkFontBold
                                            .copyWith(
                                                fontSize: FoundationTyphography
                                                    .fontSizeH3,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                        top: 12,
                                        right: 10,
                                        child: GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pop(context),
                                            child: Icon(Icons.close)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: FoundationSize.sizeHeightDefault,
                              ),
                              customRadioButton("Siswa", 0),
                              customRadioButton("Guru", 1),
                              customRadioButton("Kepala Sekolah", 2),
                              customRadioButton("Orang Tua", 3),
                              customRadioButton("Lainnya", 4),
                              SizedBox(
                                height: FoundationSize.sizeHeightDefault,
                              ),
                              Container(
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
                      ),
                    ],
                  );
                },
                lableText: 'Role',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.school),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Sekolah',
              ),
            ),
          ],
        ),
      ),
      SizedBox(
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
            width: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Center(
              child: Text(
                "Continue",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ]);
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

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("HAHAH");
  }
}
