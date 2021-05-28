import 'package:flutter/material.dart';

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
ThemeData darkTheme(BuildContext context) => Theme.of(context).copyWith(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkBlue,
      accentColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.dark,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.light,
            displayColor: AppColors.light,
          ),
    );

/// App's theme when the [Brightness] is set to light.
ThemeData lightTheme(BuildContext context) => Theme.of(context).copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.light,
      accentColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.light,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.black,
            displayColor: AppColors.black,
          ),
    );

/// Default theme for [TextField] and [TextFormField] widgets used in the app.
InputDecorationTheme defaultInputDecoration(
        BuildContext context, bool isDarkTheme) =>
    Theme.of(context).inputDecorationTheme.copyWith(
          border: OutlineInputBorder(borderRadius: defaultRadius * 2.5),
          fillColor: isDarkTheme ? AppColors.darkBlue : AppColors.white,
          filled: true,
        );
