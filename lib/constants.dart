import 'package:covid/core/providers/followings_provider.dart';
import 'package:covid/core/providers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/models/country.dart';

Color kBoxDarkColor = Color(0xFF1C1B32);
Color kBoxLightColor = Colors.white;
BorderRadius kBoxesRadius = BorderRadius.circular(10);
String allCasesAPI = 'https://corona.lmao.ninja/v2/all';
String affectedCountriesAPI = 'https://corona.lmao.ninja/v2/countries';

ThemeData kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
);
ThemeData kLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey[100],
  scaffoldBackgroundColor: Colors.grey[100],
);

final countriesBox = Hive.box<Set<Country>>('following');

final themeNotifier = ChangeNotifierProvider<ThemeNotifier>(
  (ref) => ThemeNotifier(),
);
final followingsNotifier = ChangeNotifierProvider<FollowingsNotifier>(
  (ref) => FollowingsNotifier(),
);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
