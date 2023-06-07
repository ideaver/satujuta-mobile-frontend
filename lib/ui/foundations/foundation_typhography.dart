import 'package:flutter/material.dart';

import '../../tokens/typography.dart';

class FoundationTyphography {
  FoundationTyphography._();

  static const double fontSizeH1 = AppTypography.kFontSizeTitleLarge;
  static const double fontSizeH2 = AppTypography.kFontSizeTitle;
  static const double fontSizeH3 = AppTypography.kFontSizeMediumLarge;
  static const double fontSizeH4 = AppTypography.kFontSizeMedium;
  static const double fontSizeH5 = AppTypography.kFontSizeNormal;
  static TextStyle lightFontBold =
      AppTypography.whiteJakartaText.copyWith(fontWeight: AppTypography.bold);
  static TextStyle lightFontSemibold = AppTypography.whiteJakartaText
      .copyWith(fontWeight: AppTypography.semiBold);
  static TextStyle lightFontRegular = AppTypography.whiteJakartaText
      .copyWith(fontWeight: AppTypography.regular);
  static TextStyle lightFontMedium =
      AppTypography.whiteJakartaText.copyWith(fontWeight: AppTypography.medium);
  static TextStyle darkFontBold =
      AppTypography.darkJakartaText.copyWith(fontWeight: AppTypography.bold);
  static TextStyle darkFontMedium =
      AppTypography.darkJakartaText.copyWith(fontWeight: AppTypography.medium);
  static TextStyle darkFontRegular =
      AppTypography.darkJakartaText.copyWith(fontWeight: AppTypography.regular);
  static TextStyle darkFontSemibold = AppTypography.darkJakartaText
      .copyWith(fontWeight: AppTypography.semiBold);
}
