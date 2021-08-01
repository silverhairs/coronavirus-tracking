import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'country.g.dart';

@HiveType(typeId: 2)
class Country extends Equatable {
  const Country({
    this.updated,
    required this.name,
    required this.info,
    this.active,
    this.activePerOneMillion,
    this.cases,
    this.casesPerOneMillion,
    this.continent = Continent.unknown,
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

  factory Country.fromMap(Map<String, dynamic> data) {
    return Country(
      name: data['country'],
      info: CountryInfo.fromMap(data['countryInfo']),
      active: data['active'],
      activePerOneMillion: data['activePerOneMillion'],
      cases: data['cases'],
      casesPerOneMillion: data['casesPerOneMillion'],
      continent: toContinent(data['continent']),
      critical: data['critical'],
      criticalPerOneMillion: data['criticalPerOneMillion'],
      deaths: data['deaths'],
      deathsPerOneMillion: data['deathsPerOneMillion'],
      oneCasePerPeople: data['oneCasePerPeople'],
      oneDeathPerPeople: data['oneDeathPerPeople'],
      oneTestPerPeople: data['oneTestPerPeople'],
      population: data['population'],
      recovered: data['recovered'],
      recoveredPerOneMillion: data['recoveredPerOneMillion'],
      tests: data['tests'],
      testsPerOneMillion: data['testsPerOneMillion'],
      todayCases: data['todayCases'],
      todayDeaths: data['todayDeaths'],
      updated: data['updated'],
      todayRecovered: data['todayRecovered'],
    );
  }

  @HiveField(0)
  final int? updated;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final CountryInfo info;
  @HiveField(3)
  final int? cases;
  @HiveField(4)
  final int? todayCases;
  @HiveField(5)
  final int? deaths;
  @HiveField(6)
  final int? todayDeaths;
  @HiveField(7)
  final int? recovered;
  @HiveField(8)
  final int? todayRecovered;
  @HiveField(9)
  final int? active;
  @HiveField(10)
  final int? critical;
  @HiveField(11)
  final double? casesPerOneMillion;
  @HiveField(12)
  final double? deathsPerOneMillion;
  @HiveField(13)
  final int? tests;
  @HiveField(14)
  final double? testsPerOneMillion;
  @HiveField(15)
  final int? population;
  @HiveField(16)
  final Continent continent;
  @HiveField(17)
  final double? oneCasePerPeople;
  @HiveField(18)
  final double? oneDeathPerPeople;
  @HiveField(19)
  final double? oneTestPerPeople;
  @HiveField(20)
  final double? activePerOneMillion;
  @HiveField(21)
  final double? recoveredPerOneMillion;
  @HiveField(22)
  final double? criticalPerOneMillion;

  @override
  String toString() => 'Country($updated, $name)';

  @override
  List<Object?> get props => [
        updated,
        name,
        info,
        cases,
        todayCases,
        deaths,
        todayDeaths,
        recovered,
        active,
        critical,
        casesPerOneMillion,
        deathsPerOneMillion,
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
        todayRecovered,
      ];

  Map<String, dynamic> toMap() => {
        'updated': updated,
        'country': name,
        'countryInfo': info.toMap(),
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
        'continent': continent.stringValue,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
      };
}

@HiveType(typeId: 1)
class CountryInfo extends Equatable {
  const CountryInfo({
    required this.id,
    this.iso2,
    this.iso3,
    this.latitute,
    this.longitude,
    this.flagURL,
  });

  factory CountryInfo.fromMap(Map<String, dynamic> data) {
    return CountryInfo(
      id: data['_id'],
      iso2: data['iso2'],
      iso3: data['iso3'],
      latitute: data['lat'],
      longitude: data['long'],
      flagURL: data['flag'],
    );
  }
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? iso2;
  @HiveField(2)
  final String? iso3;
  @HiveField(3)
  final double? latitute;
  @HiveField(4)
  final double? longitude;
  @HiveField(5)
  final String? flagURL;

  @override
  List<Object?> get props => [id, iso2, iso3, latitute, longitude, flagURL];

  Map<String, dynamic> toMap() => {
        '_id': id,
        'iso2': iso2,
        'iso3': iso3,
        'lat': latitute,
        'long': longitude,
        'flag': flagURL,
      };
}

@HiveType(typeId: 0)
enum Continent {
  @HiveField(0)
  asia,
  @HiveField(1)
  europe,
  @HiveField(2)
  africa,
  @HiveField(3)
  northAmerica,
  @HiveField(4)
  southAmerica,
  @HiveField(5)
  australiaOceania,
  @HiveField(6)
  unknown,
}

extension ContinentX on Continent {
  /// Get the value as a string without the prefix.
  String? get stringValue {
    switch (this) {
      case Continent.africa:
        return 'Africa';
      case Continent.asia:
        return 'Asia';
      case Continent.europe:
        return 'Europe';
      case Continent.northAmerica:
        return 'North America';
      case Continent.southAmerica:
        return 'South America';
      case Continent.australiaOceania:
        return 'Australia-Oceania';
      default:
        return null;
    }
  }
}

/// Parse a string into a value of [Continent]
Continent toContinent(String? value) {
  if (value == 'Asia') {
    return Continent.asia;
  } else if (value == 'Europe') {
    return Continent.europe;
  } else if (value == 'Africa') {
    return Continent.africa;
  } else if (value == 'North America') {
    return Continent.northAmerica;
  } else if (value == 'South America') {
    return Continent.southAmerica;
  } else if (value == 'Australia-Oceania') {
    return Continent.australiaOceania;
  }

  return Continent.unknown;
}
