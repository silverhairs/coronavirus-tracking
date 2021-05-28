import 'package:covid/app.dart';
import 'package:covid/src/data/models/country/country.dart';
import 'package:covid/src/data/models/general_data/general_data.dart';
import 'package:covid/src/logic/blocs/countries_bloc/countries_bloc.dart';
import 'package:covid/src/logic/blocs/geneal_data_bloc/general_data_bloc.dart';
import 'package:covid/src/logic/brightness_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  final appDocsDir = await path_provider.getApplicationDocumentsDirectory();
  final httpClient = http.Client();
  Hive
    ..init(appDocsDir.path)
    ..registerAdapter(CountryAdapter())
    ..registerAdapter(GeneralDataAdapter());
  await Hive.openBox<Object>('countries');
  await Hive.openBox<GeneralData>('general-data');
  await Hive.openBox<String>('theme');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BrightnessCubit()),
      BlocProvider(
        create: (context) => CountriesBloc(httpClient: httpClient)
          ..add(
            CountriesFetched(),
          ),
      ),
      BlocProvider(
        create: (context) => GeneralDataBloc(httpClient: httpClient)
          ..add(
            GeneralDataFetched(),
          ),
      ),
    ],
    child: CoronavirusApp(),
  ));
}
