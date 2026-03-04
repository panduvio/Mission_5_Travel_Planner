import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class AppThemes {
  AppThemes._();

  // === Light theme ===
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.perrywinkle,
      secondary: AppColors.white,
      tertiary: AppColors.yankeesBlue,
      surface: AppColors.white,
      error: AppColors.glowingBrakeDisc,
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.h1.copyWith(color: AppColors.yankeesBlue),
      headlineMedium: AppTextStyles.h2.copyWith(color: AppColors.yankeesBlue),
      headlineSmall: AppTextStyles.h3.copyWith(color: AppColors.yankeesBlue),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.yankeesBlue),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.yankeesBlue,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.yankeesBlue),
      labelMedium: AppTextStyles.labelMedium.copyWith(
        color: AppColors.yankeesBlue,
      ),
    ),

    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.yankeesBlue,
        onPrimary: AppColors.white,
        secondary: AppColors.yankeesBlue,
        onSecondary: AppColors.white,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      rangeSelectionBackgroundColor: AppColors.perrywinkle.withAlpha(50),
      rangeSelectionOverlayColor: WidgetStateProperty.all(
        AppColors.perrywinkle.withAlpha(50),
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.perrywinkle;
        }
        return null;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.lunarRock;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        }
        return AppColors.yankeesBlue;
      }),
    ),

    scaffoldBackgroundColor: AppColors.white,
  );

  // === Dark theme ===
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.yankeesBlue,
      secondary: AppColors.midnightEscapade,
      tertiary: AppColors.white,
      surface: AppColors.midnightEscapade,
      error: AppColors.glowingBrakeDisc,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: AppColors.white),
      selectedItemColor: AppColors.white,
      selectedLabelStyle: TextStyle(color: AppColors.white),
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.h1.copyWith(color: AppColors.white),
      headlineMedium: AppTextStyles.h2.copyWith(color: AppColors.white),
      headlineSmall: AppTextStyles.h3.copyWith(color: AppColors.white),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
    ),

    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.yankeesBlue,
        onPrimary: AppColors.white,
        secondary: AppColors.white,
        onSecondary: AppColors.yankeesBlue,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      rangeSelectionBackgroundColor: AppColors.yankeesBlue.withAlpha(50),
      rangeSelectionOverlayColor: WidgetStateProperty.all(
        AppColors.yankeesBlue.withAlpha(50),
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        }
        return null;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.midnightEscapade;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.yankeesBlue;
        }
        return AppColors.white;
      }),
    ),

    scaffoldBackgroundColor: AppColors.midnightEscapade,
  );
}
