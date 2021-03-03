import 'package:covid/constants.dart';
import 'package:covid/core/models/country.dart';
import 'package:flutter/material.dart';

class CountriesNotifier extends ChangeNotifier {
  List<Country> _countries = _getCountries();
  List<Country> get countries => _countries;

  void save(Country country) {
    if (!_countries.contains(country)) {
      _countries.add(country);
      _save(_countries);
      notifyListeners();
    }
  }
}

List<Country> _getCountries() {
  return countriesBox
      .get(
        'all',
        defaultValue: [],
      )
      .toList()
      .cast<Country>();
}

void _save(List<Country> countries) {
  countriesBox.put('all', countries);
}
