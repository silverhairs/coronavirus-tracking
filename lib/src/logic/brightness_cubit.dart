import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class BrightnessCubit extends Cubit<Brightness> {
  BrightnessCubit() : super(_fetchSavedBrightness());

  void toggle(Brightness brightness) {
    if (brightness == Brightness.dark) {
      emit(Brightness.dark);
    } else {
      emit(Brightness.light);
    }
    _saveBrightnessLocally(brightness);
  }
}

final _themeBox = Hive.box<String>('theme');

Brightness _fetchSavedBrightness() {
  switch (_themeBox.get('brightness', defaultValue: 'light')) {
    case 'dark':
      return Brightness.dark;
    default:
      return Brightness.light;
  }
}

void _saveBrightnessLocally(Brightness brightness) {
  switch (brightness) {
    case Brightness.dark:
      _themeBox.put('brightness', 'dark');
      break;
    case Brightness.light:
      _themeBox.put('brightness', 'light');
      break;
  }
}
