/// Thrown whenever an error occurs while looking up
/// a country covid-19 data.
class CountryException implements Exception {
  const CountryException([this.message]);

  final String? message;

  @override
  String toString() => 'CountryException($message)';
}

/// Thrown whenever an error occurs while performing a search in countries.
class CountrySearchException implements Exception {
  const CountrySearchException([this.message]);

  final String? message;

  @override
  String toString() => 'CountrySearchException($message)';
}

/// Thrown whenever an error occurs while looking up
/// the covid-19 overview data.
class OverviewException implements Exception {
  const OverviewException([this.message]);

  final String? message;

  @override
  String toString() => 'OverviewException($message)';
}
