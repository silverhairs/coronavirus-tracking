import 'package:covid/src/utils/styles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(_fetchSavedState());

  void toggle(CupertinoThemeData theme) async {
    emit(state.copyWith(themeData: theme));
    await _saveStateLocally(state);
  }
}

final _themeBox = Hive.box<String>('theme');

ThemeState _fetchSavedState() {
  switch (_themeBox.get('brightness', defaultValue: 'light')) {
    case 'dark':
      return const ThemeState(themeData: darkTheme);
    default:
      return const ThemeState(themeData: lightTheme);
  }
}

Future<void> _saveStateLocally(ThemeState state) async {
  if (state.themeData.brightness == Brightness.dark) {
    await _themeBox.put('brightness', 'dark');
  } else if (state.themeData.brightness == Brightness.light) {
    await _themeBox.put('brightness', 'light');
  }
}
