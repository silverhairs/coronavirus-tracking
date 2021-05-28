import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:covid/src/logic/exceptions.dart';
import 'package:covid/src/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'package:equatable/equatable.dart';
import 'package:covid/src/data/models/country/country.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.httpClient}) : super(_fetchSavedState());

  final http.Client httpClient;

  @override
  Stream<CountriesState> mapEventToState(CountriesEvent event) async* {
    if (event is CountriesFetched) {
      yield await _applyStateChange(state);
    }
  }

  @override
  void onTransition(transition) async {
    await _saveStateLocally(transition.nextState);
    super.onTransition(transition);
  }

  @override
  Stream<Transition<CountriesEvent, CountriesState>> transformEvents(
    events,
    transitionFn,
  ) =>
      super.transformEvents(
        events.debounceTime(const Duration(seconds: 1)),
        transitionFn,
      );

  Future<CountriesState> _applyStateChange(CountriesState state) async {
    if (state.lastUpdate.difference(DateTime.now()).inHours > 6 &&
        state.countries.isNotEmpty) return state;
    try {
      final countriesList = await _fetchCountries();
      return state.copyWith(
        status: CountriesFetchingStatus.success,
        countries: countriesList,
        lastUpdate: DateTime.now(),
      );
    } on Exception {
      return state.copyWith(status: CountriesFetchingStatus.failure);
    }
  }

  Future<List<Country>> _fetchCountries() async {
    final res = await httpClient.get(Uri.https(dataSource, countriesPath));
    if (res.statusCode == 200) {
      final rawData = jsonDecode(res.body) as List;
      // ignore: unnecessary_lambdas
      return rawData.map((c) => Country.fromJson(c)).toList();
    }
    throw const FetchIngException('Failed to fetch countries');
  }
}

final _countriesBox = Hive.box<Object>('countries');

CountriesState _fetchSavedState() {
  final countries =
      _countriesBox.get('data', defaultValue: <Country>[]) as List<Country>;
  final lastUpdate = _countriesBox.get(
    'update-time',
    defaultValue: DateTime.now(),
  ) as DateTime;
  return CountriesState(lastUpdate: lastUpdate, countries: countries);
}

Future<void> _saveStateLocally(CountriesState state) async {
  await _countriesBox.put('update-time', state.lastUpdate);
  await _countriesBox.put('data', state.countries);
}
