import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';

class ZOutLinedButtonTheme {
  ZOutLinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ZColors.textPrimary,
      side: BorderSide(color: ZColors.borderFocus, width: 1.5),
      textStyle: TextStyle(
        fontSize: ZSizes.fontSizeMd,
        color: ZColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      padding: EdgeInsets.symmetric(
        vertical: ZSizes.buttonHeight * 0.5,
        horizontal: ZSizes.lg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ZSizes.buttonRadius),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ZColors.textOnPrimary,
      side: BorderSide(color: ZColors.borderFocus, width: 1.5),
      textStyle: TextStyle(
        fontSize: ZSizes.fontSizeMd,
        color: ZColors.textOnPrimary,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      padding: EdgeInsets.symmetric(
        vertical: ZSizes.buttonHeight * 0.5,
        horizontal: ZSizes.lg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ZSizes.buttonRadius),
      ),
    ),
  );
}
