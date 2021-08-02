import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'overview.g.dart';

@JsonSerializable()
class Overview extends Equatable {
  const Overview({
    required this.updated,
    this.affectedCountries = 0,
    this.cases = 0,
    this.tests = 0,
    this.active = 0,
    this.recovered = 0,
    this.critical = 0,
    this.deaths = 0,
    this.todayCases = 0,
    this.todayRecovered = 0,
    this.todayDeaths = 0,
    this.casesPerOneMillion = 0.0,
    this.activePerOneMillion = 0.0,
    this.criticalPerOneMillion = 0.0,
    this.deathsPerOneMillion = 0.0,
    this.population = 0,
    this.recoveredPerOneMillion = 0.0,
    this.testsPerOneMilllion = 0.0,
  });
  final int updated;

  /// Total number of COVID-19 cases globally
  final int? cases;

  /// Number of COVID-19 cases today globally
  final int? todayCases;

  /// Total number of COVID-19 deaths globally
  final int? deaths;

  /// Number of COVID-19 deaths today
  final int? todayDeaths;

  /// Total number of people who recovered from COVID-19 globally
  final int? recovered;

  /// Number of people who recovered from COVID-19 today globally
  final int? todayRecovered;

  /// Total number of active COVID-19 cases globally
  final int? active;

  /// Number of COVID-19 cases in citical state globally
  final int? critical;

  /// Number of COVID-19 cases for every 1 million people
  final double? casesPerOneMillion;

  /// Number of COVID-19 deaths for every 1 million people
  final double? deathsPerOneMillion;

  /// Number of people tested globally
  final int? tests;

  /// Number of people tested for every 1 million people
  final double? testsPerOneMilllion;

  /// Total number of people on earth
  final int? population;

  /// Active cases for every 1 million people
  final double? activePerOneMillion;

  /// Number of recovered people for every 1 million people
  final double? recoveredPerOneMillion;

  /// Number of people people on critical stated for every 1 million people.
  final double? criticalPerOneMillion;

  /// Number of countries affected by the COVID-19 pandemic
  final int? affectedCountries;

  @override
  String toString() => 'Overview($updated)';

  @override
  List<Object?> get props => [
        updated,
        affectedCountries,
        cases,
        tests,
        active,
        recovered,
        critical,
        deaths,
        todayCases,
        todayRecovered,
        todayDeaths,
        casesPerOneMillion,
        activePerOneMillion,
        criticalPerOneMillion,
        deathsPerOneMillion,
        population,
        recoveredPerOneMillion,
        testsPerOneMilllion,
      ];

  /// Converts a JSON [Map] into an instance of [Overview].
  static Overview fromJson(Map<String, dynamic> json) =>
      _$OverviewFromJson(json);

  /// Converts this [Overview] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$OverviewToJson(this);

  /// Create an empty instance of [Overview]
  static const empty = Overview(updated: 0);

  /// True if this [Overview] is empty
  bool get isEmpty => this == empty;

  /// True if this [Overview] is not empty
  bool get isNotEmpty => this != empty;
}
