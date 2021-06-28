import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:covid19_repository/covid19_repository.dart';
import 'package:flutter/widgets.dart';

import 'package:covid_tracker/app/app.dart';
import 'package:covid_tracker/app/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final _covid19Repository = Covid19Repository();

  runZonedGuarded(
    () => runApp(App(covid19repository: _covid19Repository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
