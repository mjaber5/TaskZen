import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

abstract class Styles {
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );
  static TextStyle textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: ZColors.textPrimary,
  );

  // Dark theme variants
  static TextStyle textStyle12Dark = textStyle12.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle14Dark = textStyle14.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle16Dark = textStyle16.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle18Dark = textStyle18.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle20Dark = textStyle20.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle24Dark = textStyle24.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle28Dark = textStyle28.copyWith(
    color: ZColors.textOnPrimary,
  );
  static TextStyle textStyle32Dark = textStyle32.copyWith(
    color: ZColors.textOnPrimary,
  );
}
