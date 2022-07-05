import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors_constants.dart';
import '../../constants/dimens_constants.dart';

ThemeData getAppTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    base.apply(
      //fontFamily: "NotoSansCJKJP",
      bodyColor: Colors.white,
      displayColor: Colors.white,
    );
    return base;
  }

  final ThemeData base = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    //fontFamily: "NotoSansCJKJP",
  );
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: AppDimens.buttonSize,
    ),
  );
}
