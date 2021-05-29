import 'package:flutter/cupertino.dart';

/// App's Color palette
class AppColors {
  static const Color darkBlue = Color(0xff1c1b32);
  static const Color black = Color(0xff000000);
  static const Color dark = Color(0xff363636);
  static const Color light = Color(0xfff5f5f5);
  static const Color white = Color(0xffffffff);
  static const Color teal = Color(0xff00d1b2);
  static const Color blue = Color(0xff209cee);
  static const Color green = Color(0xff23d160);
  static const Color yellow = Color(0xffffdd57);
  static const Color red = Color(0xffff3860);
}

/// Default radius for app's rounded widgets.
final BorderRadius defaultRadius = BorderRadius.circular(10);

/// App's theme when the [Brightness] is set to dark.
const CupertinoThemeData darkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkBlue,
  primaryContrastingColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.dark,
);

/// App's theme when the [Brightness] is set to light.
const CupertinoThemeData lightTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.white,
  primaryContrastingColor: AppColors.black,
  scaffoldBackgroundColor: AppColors.light,
);

/// Returns the current device's Width
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// Returns the current device's Height
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
