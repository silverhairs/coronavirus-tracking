import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'covid_overview.g.dart';

@HiveType(typeId: 3)
class CovidOverview extends Equatable {
  const CovidOverview({
    required this.updated,
    this.cases,
    this.active,
    this.activePerOneMillion,
    this.affectedCountries,
    this.casesPerOneMillion,
    this.critical,
    this.criticalPerOneMillion,
    this.deaths,
    this.deathsPerOneMillion,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.population,
    this.recovered,
    this.recoveredPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.todayCases,
    this.todayDeaths,
    this.todayRecovered,
  });

  factory CovidOverview.fromMap(Map<String, dynamic> data) {
    return CovidOverview(
      updated: data['updated'],
      cases: data['cases'],
      active: data['active'],
      critical: data['critical'],
      deaths: data['deaths'],
      population: data['population'],
      tests: data['tests'],
      recovered: data['recovered'],
      todayCases: data['todayCases'],
      todayDeaths: data['todayDeaths'],
      todayRecovered: data['todayRecovered'],
      activePerOneMillion: data['activePerOneMillion'],
      affectedCountries: data['affectedCountries'],
      casesPerOneMillion: data['casesPerOneMillion'],
      criticalPerOneMillion: data['criticalPerOneMillion'],
      deathsPerOneMillion: data['deathsPerOneMillion'],
      oneCasePerPeople: data['oneCasePerPeople'],
      oneDeathPerPeople: data['oneDeathPerPeople'],
      oneTestPerPeople: data['oneTestPerPeople'],
      recoveredPerOneMillion: data['recoveredPerOneMillion'],
      testsPerOneMillion: data['testsPerOneMillion'],
    );
  }
  @HiveField(0)
  final int updated;
  @HiveField(1)
  final int? cases;
  @HiveField(2)
  final int? todayCases;
  @HiveField(3)
  final int? deaths;
  @HiveField(4)
  final int? todayDeaths;
  @HiveField(5)
  final int? recovered;
  @HiveField(6)
  final int? todayRecovered;
  @HiveField(7)
  final int? active;
  @HiveField(8)
  final int? critical;
  @HiveField(9)
  final double? casesPerOneMillion;
  @HiveField(10)
  final double? deathsPerOneMillion;
  @HiveField(11)
  final int? tests;
  @HiveField(12)
  final double? testsPerOneMillion;
  @HiveField(13)
  final int? population;
  @HiveField(14)
  final double? oneCasePerPeople;
  @HiveField(15)
  final double? oneDeathPerPeople;
  @HiveField(16)
  final double? oneTestPerPeople;
  @HiveField(17)
  final double? activePerOneMillion;
  @HiveField(18)
  final double? recoveredPerOneMillion;
  @HiveField(19)
  final double? criticalPerOneMillion;
  @HiveField(20)
  final int? affectedCountries;

  @override
  String toString() => 'CovidOverview($updated, $cases)';

  @override
  List<Object?> get props => [
        updated,
        cases,
        todayCases,
        deaths,
        todayDeaths,
        recovered,
        todayRecovered,
        active,
        critical,
        casesPerOneMillion,
        deathsPerOneMillion,
        tests,
        testsPerOneMillion,
        population,
        oneCasePerPeople,
        oneDeathPerPeople,
        oneTestPerPeople,
        activePerOneMillion,
        recoveredPerOneMillion,
        criticalPerOneMillion,
        affectedCountries,
      ];

  Map<String, dynamic> toMap() => {
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
        'affectedCountries': affectedCountries,
      };
}
