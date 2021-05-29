part of 'countries_bloc.dart';

enum CountriesFetchingStatus { initial, success, failure }

class CountriesState extends Equatable {
  const CountriesState({
    this.countries = const [],
    this.status = CountriesFetchingStatus.initial,
    required this.lastUpdate,
  });

  final CountriesFetchingStatus status;
  final List<Country> countries;
  final DateTime lastUpdate;

  CountriesState copyWith({
    CountriesFetchingStatus? status,
    List<Country>? countries,
    DateTime? lastUpdate,
  }) =>
      CountriesState(
        countries: countries ?? this.countries,
        status: status ?? this.status,
        lastUpdate: lastUpdate ?? this.lastUpdate,
      );

  @override
  String toString() {
    return '''CountriesState { status: $status, lastUpdated: $lastUpdate, countries: ${countries.length} }''';
  }

  @override
  List<Object> get props => [status, countries, lastUpdate];
}
