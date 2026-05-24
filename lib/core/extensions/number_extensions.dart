import '../utils/currency_formatter.dart';

extension NumExtensions on num {
  String get toCurrency {
    return CurrencyFormatter.format(this);
  }

  String get toLKR {
    return CurrencyFormatter.formatLKR(this);
  }

  String get toUSD {
    return CurrencyFormatter.formatUSD(this);
  }

  String get toPriceWithoutDecimals {
    return CurrencyFormatter.formatLKR(this, decimalDigits: 0);
  }

  String get toPercentage {
    return CurrencyFormatter.formatPercentage(this);
  }

  String get toDiscountText {
    return CurrencyFormatter.formatDiscountPercentage(this);
  }

  bool get isZero => this == 0;

  bool get isPositiveValue => this > 0;

  bool get isNegativeValue => this < 0;
}

extension IntExtensions on int {
  String get compactCount {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    }

    if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    }

    return toString();
  }

  bool get isEvenNumber => this % 2 == 0;

  bool get isOddNumber => this % 2 != 0;
}

extension DoubleExtensions on double {
  double roundToDecimals(int decimals) {
    final num factor = _pow(10, decimals);

    return (this * factor).round() / factor;
  }

  num _pow(num base, int exponent) {
    num result = 1;

    for (int i = 0; i < exponent; i++) {
      result *= base;
    }

    return result;
  }
}
