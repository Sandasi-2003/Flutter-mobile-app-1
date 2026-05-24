import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color success;
  final Color warning;
  final Color info;
  final Color discount;
  final Color rating;
  final Color inStock;
  final Color outOfStock;
  final Color border;
  final Color shimmerBase;
  final Color shimmerHighlight;

  const AppThemeExtension({
    required this.success,
    required this.warning,
    required this.info,
    required this.discount,
    required this.rating,
    required this.inStock,
    required this.outOfStock,
    required this.border,
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  @override
  AppThemeExtension copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? discount,
    Color? rating,
    Color? inStock,
    Color? outOfStock,
    Color? border,
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) {
    return AppThemeExtension(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      inStock: inStock ?? this.inStock,
      outOfStock: outOfStock ?? this.outOfStock,
      border: border ?? this.border,
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      discount: Color.lerp(discount, other.discount, t)!,
      rating: Color.lerp(rating, other.rating, t)!,
      inStock: Color.lerp(inStock, other.inStock, t)!,
      outOfStock: Color.lerp(outOfStock, other.outOfStock, t)!,
      border: Color.lerp(border, other.border, t)!,
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t)!,
      shimmerHighlight: Color.lerp(
        shimmerHighlight,
        other.shimmerHighlight,
        t,
      )!,
    );
  }
}
