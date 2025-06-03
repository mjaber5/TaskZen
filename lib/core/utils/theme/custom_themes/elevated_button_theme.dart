import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';

class ZElevatedButtonTheme {
  ZElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: ZSizes.buttonElevation,
      foregroundColor: ZColors.buttonText,
      backgroundColor: ZColors.buttonPrimary,
      disabledBackgroundColor: ZColors.buttonDisabled,
      disabledForegroundColor: ZColors.greyMedium,
      side: BorderSide(color: ZColors.buttonPrimary),
      padding: EdgeInsets.symmetric(vertical: ZSizes.buttonHeight * 0.5),
      textStyle: TextStyle(
        fontSize: ZSizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ZSizes.buttonRadius),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: ZSizes.buttonElevation,
      foregroundColor: ZColors.buttonText,
      backgroundColor: ZColors.buttonPrimary,
      disabledBackgroundColor: ZColors.buttonDisabled,
      disabledForegroundColor: ZColors.greyMedium,
      side: BorderSide(color: ZColors.buttonPrimary),
      padding: EdgeInsets.symmetric(vertical: ZSizes.buttonHeight * 0.5),
      textStyle: TextStyle(
        fontSize: ZSizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ZSizes.buttonRadius),
      ),
    ),
  );
}
