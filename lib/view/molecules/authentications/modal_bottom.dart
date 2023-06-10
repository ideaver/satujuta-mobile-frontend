import 'package:flutter/material.dart';

import '../../atoms/my_asset_image.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';

class ModalBottom {
  static Future<void> modalBottom(BuildContext context, ListView list) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: FoundationColor.bgColorGrey,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: list,
        );
      },
    );
  }

  static Widget customRadioButton(
      String text, bool statement, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          vertical: FoundationSize.sizeHeightDefault / 2),
      child: ElevatedButton(
        onPressed: onPressed,
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
                  color: statement ? Colors.green : Colors.black,
                ),
              ),
              Container(
                width: FoundationSize.sizeIconMini / 2,
                height: FoundationSize.sizeIconMini / 2,
                decoration: BoxDecoration(
                    color: statement
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

  static Widget customRadioButtonBank(
      String text, String path, bool statement, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      color: FoundationColor.bgColorGrey,
      margin: const EdgeInsets.symmetric(
          vertical: FoundationSize.sizeHeightDefault / 2),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStatePropertyAll(FoundationColor.bgWhite)),
        child: Padding(
          padding: const EdgeInsets.all(FoundationSize.sizeHeightDefault * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyAssetImage(
                    path: path,
                    widthImage: FoundationSize.sizeIconMini,
                  ),
                  const SizedBox(
                    width: FoundationSize.sizeHeightDefault,
                  ),
                  Text(
                    text,
                    style: FoundationTyphography.darkFontBold.copyWith(
                      color: statement ? Colors.green : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: FoundationSize.sizeIconMini / 2,
                height: FoundationSize.sizeIconMini / 2,
                decoration: BoxDecoration(
                    color: statement
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
