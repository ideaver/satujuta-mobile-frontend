import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_button_with_icon.dart';
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
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: MediaQuery.of(context).padding.top + 50,
            bottom: MediaQuery.of(context).padding.bottom + 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  FoundationLinks.linkLockIconLogo,
                  height: 30,
                ),
                const Spacer(),
                MyButtonWithIcon(
                    onPressed: () {}, text: "Login", buttonStyle: ButtonStyle())
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
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
                  Container(
                    height: 300,
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
                              color: Colors.red),
                          child: TabBar(
                            controller: tabController,
                            indicator: BoxDecoration(
                              color: Colors.red[800],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelColor: Colors.black,
                            dividerColor: Colors.black,
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              Tab(
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.black,
                                ),
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.video_call,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                              TabBarView(controller: tabController, children: [
                            MyTabOne(),
                            MyTabTwo(),
                          ]),
                        )
                      ],
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
          ],
        ),
      ),
    );
  }
}

class MyTabOne extends StatelessWidget {
  const MyTabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 370,
        width: double.infinity,
        decoration: BoxDecoration(
          color: FoundationColor.bgWhite,
          border: Border.all(color: Colors.black),
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
                    height: 25,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Your name',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    FoundationLinks.linkContactLogo,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
                click: () {},
                lableText: 'Email',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Image.asset(
                    FoundationLinks.linkContactLogo,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
                click: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          FoundationLinks.linkContactLogo,
                                          height: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    FoundationLinks.linkContactLogo,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "What grade are you in?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "or What grade is your child in?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 10,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Image.asset(
                                    FoundationLinks.linkContactLogo,
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (_) =>
                                        //         CreatePasswordScreen(),
                                        //   ),
                                        // );
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 225,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Continue",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
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
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(
                              //     color: HexColor("#EBEBF0")),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                lableText: 'Grade',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomForm(
                suffixIcon: IconButton(
                  icon: Icon(Icons.abc_outlined),
                  onPressed: () {},
                ),
                click: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Icon(Icons.abc),
                                    Column(
                                      children: [
                                        Text(
                                          "Choose your location",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Pick on map or select",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 10,
                                                color: Theme.of(context)
                                                    .disabledColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 61, 61, 61),
                                      border: Border.all(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: MyCustomForm(
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.abc),
                                              onPressed: () {},
                                            ),
                                            click: () {},
                                            lableText: 'Location',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                    height: 60,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Continue",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "Setup later",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: FoundationColor.bgColorGrey),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                lableText: 'Location',
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class MyTabTwo extends StatelessWidget {
  const MyTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("HAHAH");
    // return DefaultTabController(
    //   length: 2,
    //   child: Container(
    //     child: Column(
    //       // ignore: prefer_const_literals_to_create_immutables
    //       children: [
    //         // SwitcherButton(
    //         //   value: true,
    //         //   onChange: (value) {
    //         //     print(value);
    //         //   },
    //         // ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Container(
    //             height: 30,
    //             width: 150,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white),
    //             child: TabBar(
    //               indicator: BoxDecoration(
    //                 color: Colors.red[800],
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //               labelColor: Colors.black,
    //               dividerColor: Colors.black,
    //               // ignore: prefer_const_literals_to_create_immutables
    //               tabs: [
    //                 Tab(
    //                   text: "Live",
    //                 ),
    //                 Tab(
    //                   text: "Result",
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 10,
    //         ),
    //         Expanded(
    //           // ignore: prefer_const_literals_to_create_immutables
    //           child: TabBarView(children: [
    //             // MyLivePage(),
    //             // MyResultPage(),
    //           ]),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
