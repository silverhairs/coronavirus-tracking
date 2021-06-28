import 'package:covid19_repository/covid19_repository.dart';
import 'package:covid_tracker/home/view/home_page.dart';
import 'package:covid_tracker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';

class App extends StatelessWidget {
  const App({Key? key, required Covid19Repository covid19repository})
      : _covid19repository = covid19repository,
        super(key: key);

  final Covid19Repository _covid19repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryProvider.value(value: _covid19repository),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: FutureBuilder<void>(
        future: _openBoxes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const HomePage();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<void> _openBoxes() async {
  await Hive.openBox('tracking-list');
  await Hive.openBox('overview');
  await Hive.openBox('countries');
}
