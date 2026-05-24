import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = 'Inter';

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _style(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
    ),
    displayMedium: _style(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
    ),
    displaySmall: _style(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
    ),

    headlineLarge: _style(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
    ),
    headlineMedium: _style(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),
    headlineSmall: _style(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),

    titleLarge: _style(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),
    titleMedium: _style(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),
    titleSmall: _style(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),

    bodyLarge: _style(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextPrimary,
    ),
    bodyMedium: _style(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextSecondary,
    ),
    bodySmall: _style(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextSecondary,
    ),

    labelLarge: _style(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),
    labelMedium: _style(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextSecondary,
    ),
    labelSmall: _style(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextSecondary,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _style(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
    ),
    displayMedium: _style(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
    ),
    displaySmall: _style(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
    ),

    headlineLarge: _style(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
    ),
    headlineMedium: _style(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),
    headlineSmall: _style(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),

    titleLarge: _style(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),
    titleMedium: _style(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),
    titleSmall: _style(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),

    bodyLarge: _style(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextPrimary,
    ),
    bodyMedium: _style(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextSecondary,
    ),
    bodySmall: _style(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextSecondary,
    ),

    labelLarge: _style(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),
    labelMedium: _style(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextSecondary,
    ),
    labelSmall: _style(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextSecondary,
    ),
  );

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double height = 1.4,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }
}
