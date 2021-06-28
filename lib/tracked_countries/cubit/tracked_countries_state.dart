part of 'tracked_countries_cubit.dart';

class TrackedCountriesState {
  const TrackedCountriesState({required this.countries});

  /// Returns a new [TrackedCountriesState] from the previous one
  /// with a new value for [countries]
  TrackedCountriesState copyWith(List<Country> countries) =>
      TrackedCountriesState(countries: countries);

  final List<Country> countries;
}
