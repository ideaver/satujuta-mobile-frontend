import 'package:flutter/material.dart';

import '../../atoms/my_long_card.dart';
import '../../foundations/foundation_links.dart';

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
        child: const MyLongCard(
          description:
              "If each interior angle is doubled of each exterior angle of a regular polygon with n sides, then the value of n is:",
          location: "Bandung, Jawa Barat",
          pathImages: [
            FoundationLinks.linkHotelImage,
            FoundationLinks.linkHotelImage,
            FoundationLinks.linkHotelImage,
            FoundationLinks.linkHotelImage,
            FoundationLinks.linkHotelImage
          ],
          rating: 3.5,
          sizeKuota: "10",
          sizeReady: "03",
          title: "Grand Cordela Hotel Bandung",
        ));
  }
}
