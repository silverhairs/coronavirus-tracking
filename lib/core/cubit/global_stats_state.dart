part of 'global_stats_cubit.dart';

enum GlobalStatsStatus { initial, loading, success, failure }

class GlobalStatsState extends Equatable {
  const GlobalStatsState({
    this.status = GlobalStatsStatus.initial,
    this.data = Overview.empty,
  });

  final Overview data;
  final GlobalStatsStatus status;

  @override
  List<Object> get props => [data, status];
}
