import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/tokens/color.dart';

class FoundationColor {
  FoundationColor._();
  static const Color primaryApp = AppColors.kColorBase;
  static Color bgWhite = AppColors.kColorWhite;

  static Color bgRectangleSplashScreen = AppColors.kColorWhite.withAlpha(10);
  static const Color bgSplashScreen = AppColors.kColorPrimary;

  // ONBOARDING
  static const Color btnElevatedColorOnboarding = AppColors.kColorBase;
  static const Color markedColorOnboarding = AppColors.kColorPrimary;
  static const Color unmarkedColorOnboarding = AppColors.kColorWhite;
  static const Color bgColorBtnGetstarted = AppColors.kColorPrimary;
  static const Color bgColorGrey = AppColors.kColorGrey;
}
