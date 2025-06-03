import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';

class ZChipTheme {
  ZChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ZColors.greyMedium.withOpacity(0.4),
    labelStyle: TextStyle(
      color: ZColors.textPrimary,
      fontSize: ZSizes.fontSizeSm,
      fontFamily: 'Inter',
    ),
    selectedColor: ZColors.secondary,
    padding: EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.xs),
    checkmarkColor: ZColors.textOnPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZSizes.borderRadiusSm),
    ),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ZColors.greyDark.withOpacity(0.4),
    labelStyle: TextStyle(
      color: ZColors.textOnPrimary,
      fontSize: ZSizes.fontSizeSm,
      fontFamily: 'Inter',
    ),
    selectedColor: ZColors.secondary,
    padding: EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.xs),
    checkmarkColor: ZColors.textOnPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZSizes.borderRadiusSm),
    ),
  );
}
