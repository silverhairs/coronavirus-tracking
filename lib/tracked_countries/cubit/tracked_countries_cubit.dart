import 'package:bloc/bloc.dart';
import 'package:covid19_api/covid19_api.dart';

part 'tracked_countries_state.dart';

class TrackedCoutriesCubit extends Cubit<TrackedCountriesState> {
  TrackedCoutriesCubit() : super(const TrackedCountriesState(countries: []));

  void track(Country country) {
    final countries = state.countries..add(country);
    emit(state.copyWith(countries));
  }

  void untrack(Country country) {
    final countries = state.countries
      ..removeWhere((e) => e.country == country.country);
    emit(state.copyWith(countries));
  }
}
