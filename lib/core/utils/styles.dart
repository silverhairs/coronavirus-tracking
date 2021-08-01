import 'dart:ui';

import 'package:flutter/material.dart';

/// Custom Colors created specifically for this app.
class AwesomeColors {
  const AwesomeColors._();

  static const ember = Color(0xffffdd57);
  static const dark = Color(0xff363636);
  static const light = Color(0xfff5f5f5);
  static const blue = Color(0xff209cee);
  static const red = Color(0xffff3860);
  static const green = Color(0xff23d160);
  static const teal = Color(0xff00d1b2);
}

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AwesomeColors.dark,
);

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AwesomeColors.light,
);
