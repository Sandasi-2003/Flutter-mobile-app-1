import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_text_theme.dart';
import 'app_theme_extension.dart';

class LightTheme {
  LightTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTextTheme.fontFamily,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.lightTextPrimary,
      onError: AppColors.white,
    ),

    textTheme: AppTextTheme.lightTextTheme,

    extensions: const [
      AppThemeExtension(
        success: AppColors.success,
        warning: AppColors.warning,
        info: AppColors.info,
        discount: AppColors.discount,
        rating: AppColors.rating,
        inStock: AppColors.inStock,
        outOfStock: AppColors.outOfStock,
        border: AppColors.lightBorder,
        shimmerBase: Color(0xFFE5E7EB),
        shimmerHighlight: Color(0xFFF3F4F6),
      ),
    ],

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightTextPrimary,
      titleTextStyle: AppTextTheme.lightTextTheme.titleLarge,
      iconTheme: const IconThemeData(
        color: AppColors.lightTextPrimary,
        size: AppSizes.iconMd,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: AppValues.cardElevation,
      color: AppColors.lightCard,
      surfaceTintColor: AppColors.transparent,
      shadowColor: AppColors.black.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: AppSizes.borderThin,
      space: AppSpacing.md,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(AppSizes.buttonMinWidth, AppSizes.buttonHeight),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.lightTextDisabled,
        disabledForegroundColor: AppColors.white,
        elevation: 0,
        textStyle: AppTextTheme.lightTextTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(AppSizes.buttonMinWidth, AppSizes.buttonHeight),
        foregroundColor: AppColors.primary,
        side: const BorderSide(
          color: AppColors.primary,
          width: AppSizes.borderThin,
        ),
        textStyle: AppTextTheme.lightTextTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextTheme.lightTextTheme.labelLarge,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      hintStyle: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
        color: AppColors.lightTextDisabled,
      ),
      labelStyle: AppTextTheme.lightTextTheme.bodyMedium,
      errorStyle: AppTextTheme.lightTextTheme.bodySmall?.copyWith(
        color: AppColors.error,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: _inputBorder(AppColors.lightBorder),
      enabledBorder: _inputBorder(AppColors.lightBorder),
      focusedBorder: _inputBorder(AppColors.primary),
      errorBorder: _inputBorder(AppColors.error),
      focusedErrorBorder: _inputBorder(AppColors.error),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.lightSurface,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.bottomSheet),
        ),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightSurface,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightTextPrimary,
      contentTextStyle: AppTextTheme.darkTextTheme.bodyMedium,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    ),

    iconTheme: const IconThemeData(
      color: AppColors.lightTextPrimary,
      size: AppSizes.iconMd,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightTextDisabled,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextTheme.lightTextTheme.labelSmall,
      unselectedLabelStyle: AppTextTheme.lightTextTheme.labelSmall,
      elevation: AppValues.modalElevation,
    ),
  );

  static OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: color, width: AppSizes.borderThin),
    );
  }
}
