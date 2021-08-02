import 'package:bloc/bloc.dart';
import 'package:covid19_api/covid19_api.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'tracked_countries_state.dart';

class TrackedCoutriesCubit extends Cubit<TrackedCountriesState> {
  TrackedCoutriesCubit()
      : super(
          TrackedCountriesState(countries: _getCountriesFromLocalStorage()),
        );

  void track(Country country) {
    _saveCountryToLocalStorage(country);
    final countries = _getCountriesFromLocalStorage();
    emit(state.copyWith(countries));
  }

  void untrack(Country country) {
    _deleteFromLocalStorage(country);
    final countries = _getCountriesFromLocalStorage();
    emit(state.copyWith(countries));
  }
}

final _trackedCountriesBox =
    Hive.box<Map<String, dynamic>>('tracked-countries');

List<Country> _getCountriesFromLocalStorage() {
  var trackingList = _trackedCountriesBox.values.toList();
  if (trackingList.isNotEmpty) {
    return trackingList.map(Country.fromJson).toList();
  }
  return <Country>[];
}

void _saveCountryToLocalStorage(Country country) {
  if (!_trackedCountriesBox.keys.contains(country.country)) {
    _trackedCountriesBox.put(country.country, country.toJson());
  }
}

void _deleteFromLocalStorage(Country country) {
  if (_trackedCountriesBox.keys.contains(country.country)) {
    _trackedCountriesBox.delete(country.country);
  }
}
