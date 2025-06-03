import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:task_zen/core/utils/theme/custom_themes/chip_theme.dart';
import 'package:task_zen/core/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:task_zen/core/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_field_theme.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter', // Modern, professional font
    brightness: Brightness.light,
    primaryColor: ZColors.primary,
    scaffoldBackgroundColor: ZColors.backgroundLight,
    textTheme: ZTextTheme.lightTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ZOutLinedButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: ZCheckboxTheme.lightCheckboxTheme,
    chipTheme: ZChipTheme.lightChipTheme,
    inputDecorationTheme: ZTextFormFieldTheme.lightInputDecorationTheme,
    colorScheme: const ColorScheme.light(
      primary: ZColors.primary,
      secondary: ZColors.secondary,
      surface: ZColors.surfaceLight,
      error: ZColors.error,
      onPrimary: ZColors.textOnPrimary,
      onSecondary: ZColors.textOnSecondary,
      onSurface: ZColors.textPrimary,
      onError: ZColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ZColors.backgroundLight,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ZColors.textPrimary,
      ),
    ),
    cardTheme: CardTheme(
      elevation: ZSizes.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ZSizes.cardRadiusMd),
      ),
      color: ZColors.surfaceLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: ZColors.primary,
    scaffoldBackgroundColor: ZColors.backgroundDark,
    textTheme: ZTextTheme.darkTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ZOutLinedButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: ZCheckboxTheme.darkCheckboxTheme,
    chipTheme: ZChipTheme.darkChipTheme,
    inputDecorationTheme: ZTextFormFieldTheme.darkInputDecorationTheme,
    colorScheme: const ColorScheme.dark(
      primary: ZColors.primary,
      secondary: ZColors.secondary,
      surface: ZColors.surfaceDark,
      error: ZColors.error,
      onPrimary: ZColors.textOnPrimary,
      onSecondary: ZColors.textOnSecondary,
      onSurface: ZColors.textPrimary,
      onError: ZColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ZColors.backgroundDark,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ZColors.textOnPrimary,
      ),
    ),
    cardTheme: CardTheme(
      elevation: ZSizes.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ZSizes.cardRadiusMd),
      ),
      color: ZColors.surfaceDark,
    ),
  );
}
