import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country extends Equatable {
  const Country({
    required this.countryInfo,
    required this.updated,
    required this.country,
    this.isTracked = false,
    this.active = 0,
    this.cases = 0,
    this.deaths = 0,
    this.recovered = 0,
    this.todayCases = 0,
    this.todayDeaths = 0,
    this.todayRecovered = 0,
  });

  /// True is the user is tracking this country
  final bool isTracked;

  /// This country's details
  final CountryInfo countryInfo;

  /// The value of [updated] for this country
  final int updated;

  /// This country's name
  final String country;

  /// The total number of COVID-19 cases for this country
  final int cases;

  /// The number of COVID-19 cases found today for this country
  final int todayCases;

  /// The total number of COVID-19 deaths for this country
  final int deaths;

  /// The numbers of COVID-19 deaths found today for this country
  final int todayDeaths;

  /// The number people who recovered from COVID-19 deaths in this country
  final int recovered;

  /// The number of people who recovered from COVID-19 today in this country
  final int todayRecovered;

  /// The number of active COVID-19 cases in this country
  final int active;

  /// Converts a JSON [Map] into a [Country] instance.
  static Country fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  /// Converts this [Country] instance into a JSON [Map]./// Converts this [Country] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  String toString() => 'Country($country)';

  @override
  List<Object?> get props => [
        isTracked,
        countryInfo,
        updated,
        country,
        active,
        cases,
        deaths,
        recovered,
        todayCases,
        todayDeaths,
        todayRecovered,
      ];

  /// Creates an empty instance of [Country]
  static final empty = Country(
    countryInfo: CountryInfo(
      flag: '',
      lat: 0.0,
      long: 0.0,
      id: 0,
      iso2: '',
      iso3: '',
    ),
    updated: 0,
    country: '',
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;
}

@JsonSerializable()
class CountryInfo extends Equatable {
  const CountryInfo({
    this.iso2,
    this.iso3,
    required this.lat,
    required this.long,
    required this.flag,
    this.id = 0,
  });

  /// The ID of this country
  final int id;

  /// This country's ISO 3166-2
  final String? iso2;

  /// This country's ISO 3166-3
  final String? iso3;

  /// This country's latitude on the map
  final double lat;

  /// This country's longitude on the map
  final double long;

  /// URL to this country's flag
  final String flag;

  @override
  String toString() => 'CountryInfo($iso2, $iso3)';

  @override
  List<Object?> get props => [id, iso2, iso3, lat, long, flag];

  /// Converts this [CountryInfo] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);

  /// Converts a JSON [Map] into a [CountryInfo] instance.
  static CountryInfo fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);

  /// Generate an empty instance of [CountryInfo]
  static final empty = CountryInfo(lat: 0.0, long: 0.0, flag: '');
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;
}
