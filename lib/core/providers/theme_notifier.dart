import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = _getThemeFromDB();

  ThemeData get getTheme => _themeData;
  void setTheme(ThemeData theme) {
    _saveTheme(theme);
    _themeData = _getThemeFromDB();
    notifyListeners();
  }
}

final _themeBox = Hive.box<String>('appTheme');

ThemeData _getThemeFromDB() {
  String themeData = _themeBox.get('theme');
  if (themeData == 'dark') return ThemeData.dark();
  return ThemeData.light();
}

void _saveTheme(ThemeData themeData) {
  if (themeData == ThemeData.dark())
    _themeBox.put('theme', 'dark');
  else
    _themeBox.put('theme', 'light');
}
