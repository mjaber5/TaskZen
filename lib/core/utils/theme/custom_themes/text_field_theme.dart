import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';

class ZTextFormFieldTheme {
  ZTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ZColors.greyMedium,
    suffixIconColor: ZColors.greyMedium,
    labelStyle: TextStyle(
      fontSize: ZSizes.fontSizeSm,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    hintStyle: TextStyle(
      fontSize: ZSizes.fontSizeSm,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    errorStyle: TextStyle(
      fontSize: ZSizes.fontSizeXs,
      color: ZColors.error,
      fontFamily: 'Inter',
    ),
    floatingLabelStyle: TextStyle(
      fontSize: ZSizes.fontSizeSm,
      color: ZColors.textPrimary,
      fontFamily: 'Inter',
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: ZColors.borderPrimary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: ZColors.borderPrimary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1.5, color: ZColors.borderFocus),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: ZColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1.5, color: ZColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ZColors.greyMedium,
    suffixIconColor: ZColors.greyMedium,
    labelStyle: TextStyle(
      fontSize: ZSizes.fontSizeSm,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    hintStyle: TextStyle(
      fontSize: ZSizes.fontSizeSm,
      color: ZColors.textSecondary,
      fontFamily: 'Inter',
    ),
    errorStyle: TextStyle(
      fontSize: ZSizes.fontSizeXs,
      color: ZColors.error,
      fontFamily: 'Inter',
    ),
    floatingLabelStyle: TextStyle(
      fontSize: ZSizes.fontSizeSm,
      color: ZColors.textOnPrimary,
      fontFamily: 'Inter',
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: ZColors.borderDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: ZColors.borderDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1.5, color: ZColors.borderFocus),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: ZColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1.5, color: ZColors.warning),
    ),
  );
}
