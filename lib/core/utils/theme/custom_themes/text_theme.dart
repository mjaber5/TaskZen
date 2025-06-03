import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class ZTextTheme {
  ZTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    displayMedium: const TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    displaySmall: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    headlineLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    headlineMedium: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    headlineSmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    titleLarge: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    titleMedium: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    bodyLarge: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    bodyMedium: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    bodySmall: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    labelLarge: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    labelMedium: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    displayMedium: const TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    displaySmall: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    headlineLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    headlineMedium: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    headlineSmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    titleLarge: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    titleMedium: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    bodyLarge: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    bodyMedium: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    bodySmall: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    labelLarge: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    labelMedium: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
  );
}
