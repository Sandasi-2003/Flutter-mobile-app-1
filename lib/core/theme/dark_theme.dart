import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_text_theme.dart';
import 'app_theme_extension.dart';

class DarkTheme {
  DarkTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppTextTheme.fontFamily,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryLight,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.darkSurface,
      error: AppColors.error,
      onPrimary: AppColors.black,
      onSecondary: AppColors.black,
      onSurface: AppColors.darkTextPrimary,
      onError: AppColors.white,
    ),

    textTheme: AppTextTheme.darkTextTheme,

    extensions: const [
      AppThemeExtension(
        success: AppColors.success,
        warning: AppColors.warning,
        info: AppColors.info,
        discount: AppColors.discount,
        rating: AppColors.rating,
        inStock: AppColors.inStock,
        outOfStock: AppColors.outOfStock,
        border: AppColors.darkBorder,
        shimmerBase: Color(0xFF1E293B),
        shimmerHighlight: Color(0xFF334155),
      ),
    ],

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      titleTextStyle: AppTextTheme.darkTextTheme.titleLarge,
      iconTheme: const IconThemeData(
        color: AppColors.darkTextPrimary,
        size: AppSizes.iconMd,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: AppValues.cardElevation,
      color: AppColors.darkCard,
      surfaceTintColor: AppColors.transparent,
      shadowColor: AppColors.black.withValues(alpha: 0.24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
      thickness: AppSizes.borderThin,
      space: AppSpacing.md,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(AppSizes.buttonMinWidth, AppSizes.buttonHeight),
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.black,
        disabledBackgroundColor: AppColors.darkTextDisabled,
        disabledForegroundColor: AppColors.darkTextSecondary,
        elevation: 0,
        textStyle: AppTextTheme.darkTextTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(AppSizes.buttonMinWidth, AppSizes.buttonHeight),
        foregroundColor: AppColors.primaryLight,
        side: const BorderSide(
          color: AppColors.primaryLight,
          width: AppSizes.borderThin,
        ),
        textStyle: AppTextTheme.darkTextTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        textStyle: AppTextTheme.darkTextTheme.labelLarge,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      hintStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
        color: AppColors.darkTextDisabled,
      ),
      labelStyle: AppTextTheme.darkTextTheme.bodyMedium,
      errorStyle: AppTextTheme.darkTextTheme.bodySmall?.copyWith(
        color: AppColors.error,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: _inputBorder(AppColors.darkBorder),
      enabledBorder: _inputBorder(AppColors.darkBorder),
      focusedBorder: _inputBorder(AppColors.primaryLight),
      errorBorder: _inputBorder(AppColors.error),
      focusedErrorBorder: _inputBorder(AppColors.error),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkSurface,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.bottomSheet),
        ),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurface,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkTextPrimary,
      contentTextStyle: AppTextTheme.lightTextTheme.bodyMedium,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    ),

    iconTheme: const IconThemeData(
      color: AppColors.darkTextPrimary,
      size: AppSizes.iconMd,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.darkTextDisabled,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextTheme.darkTextTheme.labelSmall,
      unselectedLabelStyle: AppTextTheme.darkTextTheme.labelSmall,
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
