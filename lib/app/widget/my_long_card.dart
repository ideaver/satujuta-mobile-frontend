import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
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
      margin: const EdgeInsets.symmetric(vertical: AppSizes.height * 3),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.baseLv4,
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
        padding: const EdgeInsets.all(AppSizes.height * 2 + 4),
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
                    Image.asset(AppAssets.locationFormIconPath),
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
                          style: AppTextStyle.bold(
                            context,
                            color: AppColors.base,
                          ),
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
              height: AppSizes.padding,
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
              height: AppSizes.padding,
            ),
            Text(
              title,
              style: AppTextStyle.bold(
                context,
                fontSize: 16,
                color: AppColors.base,
              ),
            ),
            const SizedBox(
              height: AppSizes.height,
            ),
            SizedBox(
              height: AppSizes.height + 5,
              width: double.infinity,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                allowHalfRating: true,
                itemSize: AppSizes.height + 5,
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
              height: AppSizes.height,
            ),
            Expanded(
              child: Text(
                description,
                style: AppTextStyle.regular(
                  context,
                  fontSize: 14,
                  color: AppColors.base,
                ),
              ),
            ),
            Expanded(
              child: MyCustomButton(
                text: "Pilih",
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(
                    AppSizes.height * 5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
