import 'package:flutter/material.dart';

import 'colors_constants.dart';

class AppTextStyle {
  static final appBarTitle =
      customTextStyle(FontWeight.w400, 14, AppColors.textAppbar);
  static final heading1Bold =
      customTextStyle(FontWeight.w700, 24, AppColors.textNormal);
  static final heading2Bold =
      customTextStyle(FontWeight.w700, 20, AppColors.textNormal);
  static final heading3 =
      customTextStyle(FontWeight.w500, 18, AppColors.textNormal);
  static final heading3Bold =
      customTextStyle(FontWeight.bold, 18, AppColors.textNormal);
  static final body1 =
      customTextStyle(FontWeight.w400, 16, AppColors.textNormal);
  static final body1Medium =
      customTextStyle(FontWeight.w600, 16, AppColors.textNormal);
  static final body1Bold =
      customTextStyle(FontWeight.w700, 16, AppColors.textNormal);
  static final caption1 =
      customTextStyle(FontWeight.w400, 14, AppColors.textNormal);
}

TextStyle customTextStyle(FontWeight fontWeight, double size, Color color,
    {double? lineHeight, bool hasUnderLine = false}) {
  TextStyle customTextStyle = TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      height: lineHeight,
      decoration: hasUnderLine ? TextDecoration.underline : null,
      color: color);
  return customTextStyle;
}
