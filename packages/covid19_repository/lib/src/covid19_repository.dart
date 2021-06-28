import 'package:covid19_api/covid19_api.dart';
import 'package:covid19_repository/src/exceptions.dart';

/// A class that exposes a bunch of functions to perform
/// operations with a Country
class Covid19Repository {
  Covid19Repository({Covid19Client? covid19client})
      : _covid19client = covid19client ?? Covid19Client();
  final Covid19Client _covid19client;

  /// Returns a list of countries affected by the covid-19 and their data.
  Future<List<Country>> getAffectedCountriesList() {
    try {
      return _covid19client.getCountries();
    } on Exception {
      throw CountryException();
    }
  }

  /// Returns an overview of covid-19 data.
  Future<Overview> getCovid19overview() {
    try {
      return _covid19client.getOverview();
    } on Exception {
      throw OverviewException();
    }
  }
}
