import 'package:bloc/bloc.dart';
import 'package:covid19_api/covid19_api.dart';
import 'package:covid19_repository/covid19_repository.dart';
import 'package:equatable/equatable.dart';

part 'global_stats_state.dart';

class GlobalStatsCubit extends Cubit<GlobalStatsState> {
  GlobalStatsCubit({required this.covid19repository})
      : super(const GlobalStatsState());
  final Covid19Repository covid19repository;

  Future<void> getOverview() async {
    emit(
      GlobalStatsState(status: GlobalStatsStatus.loading, data: state.data),
    );
    try {
      final data = await covid19repository.getCovid19overview();
      emit(
        GlobalStatsState(status: GlobalStatsStatus.success, data: data),
      );
    } on Exception {
      emit(
        GlobalStatsState(status: GlobalStatsStatus.failure, data: state.data),
      );
    }
  }
}
