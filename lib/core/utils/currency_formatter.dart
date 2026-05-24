import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static const String defaultLocale = 'en_US';
  static const String defaultSymbol = '\$';

  static String format(
    num amount, {
    String symbol = defaultSymbol,
    String locale = defaultLocale,
    int decimalDigits = 2,
  }) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );

    return formatter.format(amount);
  }

  static String formatCompact(num amount, {String locale = defaultLocale}) {
    final NumberFormat formatter = NumberFormat.compactCurrency(
      locale: locale,
      symbol: defaultSymbol,
    );

    return formatter.format(amount);
  }

  static String formatWithoutSymbol(
    num amount, {
    String locale = defaultLocale,
    int decimalDigits = 2,
  }) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: '',
      decimalDigits: decimalDigits,
    );

    return formatter.format(amount).trim();
  }

  static String formatLKR(num amount, {int decimalDigits = 2}) {
    return format(
      amount,
      symbol: 'Rs. ',
      locale: 'en_LK',
      decimalDigits: decimalDigits,
    );
  }

  static String formatUSD(num amount, {int decimalDigits = 2}) {
    return format(
      amount,
      symbol: '\$',
      locale: 'en_US',
      decimalDigits: decimalDigits,
    );
  }

  static String formatEUR(num amount, {int decimalDigits = 2}) {
    return format(
      amount,
      symbol: '€',
      locale: 'en_EU',
      decimalDigits: decimalDigits,
    );
  }

  static String formatDiscountPercentage(
    num percentage, {
    int decimalDigits = 0,
  }) {
    return '${percentage.toStringAsFixed(decimalDigits)}% OFF';
  }

  static String formatPercentage(num percentage, {int decimalDigits = 0}) {
    return '${percentage.toStringAsFixed(decimalDigits)}%';
  }

  static String formatPriceRange(
    num minPrice,
    num maxPrice, {
    String symbol = defaultSymbol,
    String locale = defaultLocale,
    int decimalDigits = 2,
  }) {
    return '${format(minPrice, symbol: symbol, locale: locale, decimalDigits: decimalDigits)} - ${format(maxPrice, symbol: symbol, locale: locale, decimalDigits: decimalDigits)}';
  }

  static String formatLKRRange(
    num minPrice,
    num maxPrice, {
    int decimalDigits = 2,
  }) {
    return formatPriceRange(
      minPrice,
      maxPrice,
      symbol: 'Rs. ',
      locale: 'en_LK',
      decimalDigits: decimalDigits,
    );
  }
}
