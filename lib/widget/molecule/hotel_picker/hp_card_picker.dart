import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../atom/app_long_card.dart';

class HpCardPicker extends StatelessWidget {
  const HpCardPicker({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: const AppLongCard(
          description:
              "If each interior angle is doubled of each exterior angle of a regular polygon with n sides, then the value of n is:",
          location: "Bandung, Jawa Barat",
          pathImages: [
            AppAssets.imageHotelPath,
            AppAssets.imageHotelPath,
            AppAssets.imageHotelPath,
            AppAssets.imageHotelPath,
            AppAssets.imageHotelPath
          ],
          rating: 3.5,
          sizeKuota: "10",
          sizeReady: "03",
          title: "Grand Cordela Hotel Bandung",
        ));
  }
}
