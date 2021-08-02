import 'package:bloc/bloc.dart';
import 'package:covid19_api/covid19_api.dart';
import 'package:covid19_repository/covid19_repository.dart';
import 'package:equatable/equatable.dart';

part 'countries_stats_state.dart';

class CountriesStatsCubit extends Cubit<CountriesStatsState> {
  CountriesStatsCubit({required this.covid19repository})
      : super(const CountriesStatsState());

  final Covid19Repository covid19repository;
  Future<void> getCountries() async {
    emit(
      CountriesStatsState(
        status: CountriesStatsStatus.loading,
        countries: state.countries,
      ),
    );
    try {
      final countries = await covid19repository.getAffectedCountriesList();
      emit(
        CountriesStatsState(
          status: CountriesStatsStatus.success,
          countries: countries,
        ),
      );
    } on Exception {
      emit(
        CountriesStatsState(
          status: CountriesStatsStatus.failure,
          countries: state.countries,
        ),
      );
    }
  }
}
