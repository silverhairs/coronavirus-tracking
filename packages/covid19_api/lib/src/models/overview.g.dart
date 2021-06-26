// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Overview _$OverviewFromJson(Map<String, dynamic> json) {
  return Overview(
    updated: json['updated'] as int,
    affectedCountries: json['affectedCountries'] as int,
    cases: json['cases'] as int,
    tests: json['tests'] as int,
    active: json['active'] as int,
    recovered: json['recovered'] as int,
    critical: json['critical'] as int,
    deaths: json['deaths'] as int,
    todayCases: json['todayCases'] as int,
    todayRecovered: json['todayRecovered'] as int,
    todayDeaths: json['todayDeaths'] as int,
    casesPerOneMillion: (json['casesPerOneMillion'] as num).toDouble(),
    activePerOneMillion: (json['activePerOneMillion'] as num).toDouble(),
    criticalPerOneMillion: (json['criticalPerOneMillion'] as num).toDouble(),
    deathsPerOneMillion: (json['deathsPerOneMillion'] as num).toDouble(),
    population: json['population'] as int,
    recoveredPerOneMillion: (json['recoveredPerOneMillion'] as num).toDouble(),
    testsPerOneMilllion: (json['testsPerOneMilllion'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OverviewToJson(Overview instance) => <String, dynamic>{
      'updated': instance.updated,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'todayRecovered': instance.todayRecovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'tests': instance.tests,
      'testsPerOneMilllion': instance.testsPerOneMilllion,
      'population': instance.population,
      'activePerOneMillion': instance.activePerOneMillion,
      'recoveredPerOneMillion': instance.recoveredPerOneMillion,
      'criticalPerOneMillion': instance.criticalPerOneMillion,
      'affectedCountries': instance.affectedCountries,
    };
