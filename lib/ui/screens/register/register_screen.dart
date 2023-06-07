import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_form_custom.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  FoundationLinks.linkContactLogo,
                  height: 30,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => LoginScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 244, 248, 1),
                      borderRadius: BorderRadius.circular(30),
                      // border: Border.all(
                      //   color: Theme.of(context).buttonTheme.colorScheme!.primary,
                      // ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          FoundationLinks.linkContactLogo,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    "Registration",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Please fill your infomation to register",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 370,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 61, 61, 61),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: MyFormCustom(
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
                          child: MyFormCustom(
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
                          child: MyFormCustom(
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Image.asset(
                                                      FoundationLinks
                                                          .linkContactLogo,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Continue",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
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
                                            topLeft:
                                                const Radius.circular(25.0),
                                            topRight:
                                                const Radius.circular(25.0),
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
                          child: MyFormCustom(
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
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                            color: Theme.of(
                                                                    context)
                                                                .disabledColor,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                  color: Color.fromARGB(
                                                      255, 61, 61, 61),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: MyFormCustom(
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
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .primaryColor),
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
                                              color:
                                                  FoundationColor.bgColorGrey),
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(25.0),
                                            topRight:
                                                const Radius.circular(25.0),
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
