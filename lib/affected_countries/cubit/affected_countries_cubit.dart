import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'affected_countries_state.dart';

class AffectedCountriesCubit extends Cubit<AffectedCountriesState> {
  AffectedCountriesCubit() : super(AffectedCountriesInitial());
}
