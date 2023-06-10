import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class FoundationTyphography {
  FoundationTyphography._();

  static const double fontSizeH1 = AppTextStyle.kFontSizeTitleLarge;
  static const double fontSizeH2 = AppTextStyle.kFontSizeTitle;
  static const double fontSizeH3 = AppTextStyle.kFontSizeMediumLarge;
  static const double fontSizeH4 = AppTextStyle.kFontSizeMedium;
  static const double fontSizeH5 = AppTextStyle.kFontSizeNormal;
  static TextStyle lightFontBold =
      AppTextStyle.whiteJakartaText.copyWith(fontWeight: AppTextStyle.bold);
  static TextStyle lightFontSemibold =
      AppTextStyle.whiteJakartaText.copyWith(fontWeight: AppTextStyle.semiBold);
  static TextStyle lightFontRegular =
      AppTextStyle.whiteJakartaText.copyWith(fontWeight: AppTextStyle.regular);
  static TextStyle lightFontMedium =
      AppTextStyle.whiteJakartaText.copyWith(fontWeight: AppTextStyle.medium);
  static TextStyle darkFontBold =
      AppTextStyle.darkJakartaText.copyWith(fontWeight: AppTextStyle.bold);
  static TextStyle darkFontMedium =
      AppTextStyle.darkJakartaText.copyWith(fontWeight: AppTextStyle.medium);
  static TextStyle darkFontRegular =
      AppTextStyle.darkJakartaText.copyWith(fontWeight: AppTextStyle.regular);
  static TextStyle darkFontSemibold =
      AppTextStyle.darkJakartaText.copyWith(fontWeight: AppTextStyle.semiBold);
}
