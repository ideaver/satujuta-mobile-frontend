import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/theme/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle darkJakartaText = const TextStyle(
      fontFamily: 'Plus Jakarta Sans', color: AppColors.kColorBase);
  static TextStyle whiteJakartaText = const TextStyle(
      fontFamily: 'Plus Jakarta Sans', color: AppColors.kColorWhite);

  static const kFontSizeTitle = 20.0;
  static const kFontSizeNormal = 12.0;
  static const kFontSizeMedium = 14.0;
  static const kFontSizeMediumLarge = 16.0;
  static const kFontSizeTitleLarge = 24.0;

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}
