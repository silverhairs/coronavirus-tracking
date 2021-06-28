import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'overviewstats_state.dart';

class OverviewstatsCubit extends Cubit<OverviewstatsState> {
  OverviewstatsCubit() : super(OverviewstatsInitial());
}
