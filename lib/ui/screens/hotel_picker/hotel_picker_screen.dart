import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_button.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_text.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

class HotelPickerScreen extends StatefulWidget {
  const HotelPickerScreen({super.key});

  @override
  State<HotelPickerScreen> createState() => _HotelPickerScreenState();
}

class _HotelPickerScreenState extends State<HotelPickerScreen> {
  List<Widget> listWidgetHotel = [ContentIsReady()];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoundationColor.bgColorGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: FoundationSize.sizeHeightDefault * 5,
              ),
              MyCustomText(
                text: "Pilih Hotel Menginap Anda",
                style: FoundationTyphography.darkFontBold
                    .copyWith(fontSize: FoundationTyphography.fontSizeH2),
              ),
              SizedBox(
                height: FoundationSize.sizeHeightDefault * 3 + 4,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(66, 181, 178, 178),
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.dashboard),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Semua",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = 0;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: i == 0
                                  ? Theme.of(context).primaryColor
                                  : FoundationColor.bgWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Jakarta",
                                  style: i == 0
                                      ? FoundationTyphography.lightFontBold
                                          .copyWith()
                                      : FoundationTyphography.darkFontBold
                                          .copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = 1;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: i == 1
                                  ? FoundationColor.bgPrimary
                                  : FoundationColor.bgWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(66, 181, 178, 178),
                                  offset: const Offset(
                                    1,
                                    1,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Bandung",
                                  style: i == 1
                                      ? FoundationTyphography.lightFontBold
                                      : FoundationTyphography.darkFontBold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(66, 181, 178, 178),
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Surabaya",
                                style: FoundationTyphography.darkFontBold,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: FoundationSize.sizeHeightDefault * 2 + 4,
              ),
              i == 1
                  ? Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      padding:
                          const EdgeInsets.all(FoundationSize.sizePadding * 2),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(FoundationLinks.linkEmptyEmoji),
                            SizedBox(
                              height: FoundationSize.sizeHeightDefault * 5,
                            ),
                            Text(
                              "Maaf, belum ada hotel di kota ini.",
                              style: FoundationTyphography.darkFontBold
                                  .copyWith(
                                      fontSize:
                                          FoundationTyphography.fontSizeH3),
                            ),
                            SizedBox(
                              height: FoundationSize.sizePadding,
                            ),
                            Text(
                              "Kami akan segera menambahkan daftar hotel yang kamu inginkan",
                              textAlign: TextAlign.center,
                              style: FoundationTyphography.darkFontRegular
                                  .copyWith(
                                      fontSize:
                                          FoundationTyphography.fontSizeH4),
                            )
                          ],
                        ),
                      ),
                    )
                  : listWidgetHotel[i]
            ],
          ),
        ),
      ),
    );
  }
}

class ContentIsReady extends StatefulWidget {
  const ContentIsReady({super.key});

  @override
  State<ContentIsReady> createState() => _ContentIsReadyState();
}

class _ContentIsReadyState extends State<ContentIsReady> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: FoundationSize.sizeHeightDefault * 2 + 2,
        right: FoundationSize.sizeHeightDefault * 2 + 2,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 5,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
          children: [
            sam(FoundationLinks.linkContactLogo, "Statistics",
                "Mr. Chaunarois Santo"),
            SizedBox(
              height: 10,
            ),
            sam(FoundationLinks.linkContactLogo, "Negative numbers",
                "Ms. Verra Mussies"),
            SizedBox(
              height: 10,
            ),
            sam(FoundationLinks.linkContactLogo, "Geometry",
                "Ms. Verra Mussies"),
            SizedBox(
              height: 10,
            ),
            sam(FoundationLinks.linkContactLogo, "Geometry",
                "Ms. Verra Mussies"),
            SizedBox(
              height: 10,
            ),
            sam(FoundationLinks.linkContactLogo, "Geometry",
                "Ms. Verra Mussies"),
            SizedBox(
              height: 10,
            ),
            sam(FoundationLinks.linkContactLogo, "Geometry",
                "Ms. Verra Mussies"),
            SizedBox(
              height: 10,
            ),
            sam(FoundationLinks.linkContactLogo, "Geometry",
                "Ms. Verra Mussies"),
          ],
        ),
      ),
    );
  }

  Widget sam(String img, String tex, String tex2) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => TaskDetailScreen(),
        //   ),
        // );
      },
      child: Container(
        height: 550,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
              color: FoundationColor.bgColorGrey,
              offset: Offset(
                1,
                1,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.all(FoundationSize.sizeHeightDefault * 2 + 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(FoundationLinks.linkLocationIconLogo),
                      const Text("Bandung, Jawa Barat")
                    ],
                  ),
                  Spacer(),
                  const Column(
                    children: [
                      Text("Kouta"),
                      Row(
                        children: [Text("03"), Text("/"), Text("10")],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: FoundationSize.sizePadding,
              ),
              SizedBox(
                height: 219,
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {
                    if (kDebugMode) {
                      print('Page changed: $value');
                    }
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      FoundationLinks.linkHotelImage,
                      width: double.infinity,
                      height: 50,
                    ),
                    Image.asset(
                      FoundationLinks.linkHotelImage,
                      width: double.infinity,
                      height: 50,
                    ),
                    Image.asset(
                      FoundationLinks.linkHotelImage,
                      width: double.infinity,
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: FoundationSize.sizePadding,
              ),
              Text(
                "Grand Cordela Hotel Bandung",
                style: FoundationTyphography.darkFontBold
                    .copyWith(fontSize: FoundationTyphography.fontSizeH3),
              ),
              SizedBox(
                height: FoundationSize.sizeHeightDefault,
              ),
              Container(
                height: FoundationSize.sizeIconStar,
                width: double.infinity,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  itemSize: FoundationSize.sizeIconStar,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(
                height: FoundationSize.sizeHeightDefault,
              ),
              Expanded(
                child: Text(
                  "If each interior angle is doubled of each exterior angle of a regular polygon with n sides, then the value of n is:",
                  style: FoundationTyphography.darkFontRegular
                      .copyWith(fontSize: FoundationTyphography.fontSizeH4),
                ),
              ),
              Expanded(
                  child: MyCustomButton(
                      text: "Pilih",
                      decoration: BoxDecoration(
                          color: FoundationColor.bgPrimary,
                          borderRadius: BorderRadius.circular(
                              FoundationSize.sizeHeightDefault * 5))))
            ],
          ),
        ),
      ),
    );
  }
}
