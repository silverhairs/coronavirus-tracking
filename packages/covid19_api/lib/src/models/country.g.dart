// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    countryInfo:
        CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
    updated: json['updated'] as int,
    country: json['country'] as String,
    isTracked: json['isTracked'] as bool,
    active: json['active'] as int,
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recovered: json['recovered'] as int,
    todayCases: json['todayCases'] as int,
    todayDeaths: json['todayDeaths'] as int,
    todayRecovered: json['todayRecovered'] as int,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'isTracked': instance.isTracked,
      'countryInfo': instance.countryInfo,
      'updated': instance.updated,
      'country': instance.country,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'todayRecovered': instance.todayRecovered,
      'active': instance.active,
    };

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    iso2: json['iso2'] as String?,
    iso3: json['iso3'] as String?,
    lat: (json['lat'] as num).toDouble(),
    long: (json['long'] as num).toDouble(),
    flag: json['flag'] as String,
    id: json['_id'] as int,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };
