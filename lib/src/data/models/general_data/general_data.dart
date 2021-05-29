import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'general_data.g.dart';

@HiveType(typeId: 1)
class GeneralData extends Equatable {
  const GeneralData({
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
    this.casesPerMillion = 0.0,
    this.activePerMillion = 0.0,
    this.criticalPerMillion = 0.0,
    this.deathsPerMillion = 0.0,
    this.population = 0,
    this.recoveredPerMillion = 0.0,
    this.testsPerMilllion = 0.0,
  });

  @HiveField(0)
  final int updated;
  @HiveField(1)
  final int cases;
  @HiveField(2)
  final int todayCases;
  @HiveField(3)
  final int deaths;
  @HiveField(4)
  final int todayDeaths;
  @HiveField(5)
  final int recovered;
  @HiveField(6)
  final int todayRecovered;
  @HiveField(7)
  final int active;
  @HiveField(8)
  final int critical;
  @HiveField(9)
  final double casesPerMillion;
  @HiveField(10)
  final double deathsPerMillion;
  @HiveField(11)
  final int tests;
  @HiveField(12)
  final double testsPerMilllion;
  @HiveField(13)
  final int population;
  @HiveField(14)
  final double activePerMillion;
  @HiveField(15)
  final double recoveredPerMillion;
  @HiveField(16)
  final double criticalPerMillion;
  @HiveField(17)
  final int affectedCountries;

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
        casesPerMillion,
        activePerMillion,
        criticalPerMillion,
        deathsPerMillion,
        population,
        recoveredPerMillion,
        testsPerMilllion,
      ];

  static GeneralData fromJson(Map<String, dynamic> data) => GeneralData(
        updated: data['updated'],
        active: data['active'],
        affectedCountries: data['affectedCountries'],
        cases: data['cases'],
        critical: data['critical'],
        deaths: data['deaths'],
        population: data['population'],
        recovered: data['recovered'],
        tests: data['tests'],
        todayCases: data['todayCases'],
        todayDeaths: data['todayDeaths'],
        todayRecovered: data['todayRecovered'],
        // ignore: avoid_dynamic_calls
        activePerMillion: (data['activePerOneMillion']).toDouble(),
        // ignore: avoid_dynamic_calls
        casesPerMillion: (data['casesPerOneMillion']).toDouble(),
        // ignore: avoid_dynamic_calls
        criticalPerMillion: (data['criticalPerOneMillion']).toDouble(),
        // ignore: avoid_dynamic_calls
        deathsPerMillion: (data['deathsPerOneMillion']).toDouble(),
        // ignore: avoid_dynamic_calls
        recoveredPerMillion: (data['recoveredPerOneMillion']).toDouble(),
        // ignore: avoid_dynamic_calls
        testsPerMilllion: (data['testsPerOneMillion']).toDouble(),
      );

  static const empty = GeneralData(updated: 0);

  bool get isEmpty => this == GeneralData.empty;
  bool get isNotEmpty => this != GeneralData.empty;
}
