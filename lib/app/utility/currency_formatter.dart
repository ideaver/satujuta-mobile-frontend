import 'package:intl/intl.dart';

import '../locale/app_locale.dart';

// App Currency Formatter
// v.1.0.0
// by Elriz Wiraswara

// Currency Formatter
// dependent on [AppLocale]
class CurrencyFormatter {
  CurrencyFormatter._();

  static const int defaultDecimalDigits = 0;

  static String format(num data, {int? decimalDigits}) {
    return NumberFormat.simpleCurrency(
      locale: AppLocale.defaultLocale.countryCode,
      decimalDigits: decimalDigits ?? defaultDecimalDigits,
    ).format(data);
  }

  static String compact(num data, {int? decimalDigits}) {
    return NumberFormat.compactSimpleCurrency(
      locale: AppLocale.defaultLocale.countryCode,
      decimalDigits: decimalDigits ?? defaultDecimalDigits,
    ).format(data);
  }

  static String withoutSymbol(num data, {int? decimalDigits}) {
    return NumberFormat.currency(
      locale: AppLocale.defaultLocale.countryCode,
      decimalDigits: decimalDigits ?? defaultDecimalDigits,
      symbol: "",
    ).format(data);
  }

  static String currencySymbol() {
    return NumberFormat.simpleCurrency(
      locale: AppLocale.defaultLocale.countryCode,
    ).currencySymbol;
  }
}
