import 'package:flutter/material.dart';

import 'colors_constants.dart';

const extra = 2.0;

class AppTextStyle {
  static final appBarTitle =
      customTextStyle(FontWeight.w400, 12 + extra, textAppbar);
  static final heading1Bold =
      customTextStyle(FontWeight.w700, 16 + extra, textNormal);
  static final heading2Bold =
      customTextStyle(FontWeight.w700, 14 + extra, textNormal);
  static final heading3 = customTextStyle(FontWeight.w500, 12 + extra, textNormal);
  static final heading3Bold = customTextStyle(FontWeight.bold, 12 + extra, textNormal);
  static final body1 = customTextStyle(FontWeight.w400, 10 + extra, textNormal);
  static final body1Medium = customTextStyle(FontWeight.w600, 10 + extra, textNormal);
  static final body1Bold = customTextStyle(FontWeight.w700, 10 + extra, textNormal);
  static final caption1 = customTextStyle(FontWeight.w400, 10 + extra, textNormal);
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
