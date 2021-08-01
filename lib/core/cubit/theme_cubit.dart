import 'package:bloc/bloc.dart';
import 'package:covid_tracker/core/utils/styles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: lightTheme));

  void toDark() {
    emit(ThemeState(status: ThemeStatus.dark, themeData: darkTheme));
  }

  void toLight() {
    emit(ThemeState(status: ThemeStatus.light, themeData: lightTheme));
  }
}
