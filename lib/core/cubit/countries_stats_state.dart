part of 'countries_stats_cubit.dart';

enum CountriesStatsStatus { initial, loading, success, failure }

class CountriesStatsState extends Equatable {
  const CountriesStatsState({
    this.status = CountriesStatsStatus.initial,
    this.countries = const [],
  });

  final List<Country> countries;
  final CountriesStatsStatus status;

  @override
  List<Object> get props => [countries, status];
}
