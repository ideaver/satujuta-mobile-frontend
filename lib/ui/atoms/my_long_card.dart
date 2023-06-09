import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../foundations/foundation_colors.dart';
import '../foundations/foundation_links.dart';
import '../foundations/foundation_size.dart';
import '../foundations/foundation_typhography.dart';
import 'my_custom_button.dart';

class MyLongCard extends StatelessWidget {
  const MyLongCard(
      {super.key,
      required this.title,
      required this.pathImages,
      required this.location,
      required this.sizeReady,
      required this.sizeKuota,
      required this.rating,
      required this.description});

  final String title;
  final List<String> pathImages;
  final String location;
  final String sizeReady;
  final String sizeKuota;
  final double rating;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          vertical: FoundationSize.sizeHeightDefault * 3),
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
        padding: const EdgeInsets.all(FoundationSize.sizeHeightDefault * 2 + 4),
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
                    Image.asset(FoundationLinks.linkLocationImage),
                    Text(location)
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const Text("Kuota"),
                    Row(
                      children: [
                        Text(
                          sizeReady,
                          style: FoundationTyphography.darkFontBold,
                        ),
                        const Text("/"),
                        Text(sizeKuota)
                      ],
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
                    pathImages[0],
                    width: double.infinity,
                    height: 50,
                  ),
                  Image.asset(
                    pathImages[1],
                    width: double.infinity,
                    height: 50,
                  ),
                  Image.asset(
                    pathImages[2],
                    width: double.infinity,
                    height: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: FoundationSize.sizePadding,
            ),
            Text(
              title,
              style: FoundationTyphography.darkFontBold
                  .copyWith(fontSize: FoundationTyphography.fontSizeH3),
            ),
            const SizedBox(
              height: FoundationSize.sizeHeightDefault,
            ),
            SizedBox(
              height: FoundationSize.sizeIconStar,
              width: double.infinity,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                allowHalfRating: true,
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
            const SizedBox(
              height: FoundationSize.sizeHeightDefault,
            ),
            Expanded(
              child: Text(
                description,
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
    );
  }
}
