import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'country.g.dart';

@HiveType(typeId: 0)
class Country extends Equatable {
  const Country({
    required this.id,
    required this.name,
    required this.updated,
    this.isTracked = false,
    this.flagURL,
    this.active = 0,
    this.cases = 0,
    this.deaths = 0,
    this.recovered = 0,
    this.todayCases = 0,
    this.todayDeaths = 0,
    this.todayRecovered = 0,
  });
  @HiveField(0)
  final bool? isTracked;
  @HiveField(1)
  final dynamic id;
  @HiveField(2)
  final int updated;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final int cases;
  @HiveField(5)
  final int todayCases;
  @HiveField(6)
  final int deaths;
  @HiveField(7)
  final int todayDeaths;
  @HiveField(8)
  final int recovered;
  @HiveField(9)
  final int todayRecovered;
  @HiveField(10)
  final String? flagURL;
  @HiveField(11)
  final int active;

  @override
  List<Object?> get props => [
        isTracked,
        id,
        updated,
        name,
        flagURL,
        active,
        cases,
        deaths,
        recovered,
        todayCases,
        todayDeaths,
        todayRecovered,
      ];

  Country copytWith({
    bool? isTracked,
    dynamic id,
    String? name,
    String? flagURL,
    int? active,
    int? cases,
    int? deaths,
    int? recovered,
    int? todayCases,
    int? todayDeaths,
    int? todayRecovered,
    int? updated,
  }) =>
      Country(
        id: id ?? this.id,
        name: name ?? this.name,
        updated: updated ?? this.updated,
        active: active ?? this.active,
        cases: cases ?? this.cases,
        deaths: deaths ?? this.deaths,
        flagURL: flagURL ?? this.flagURL,
        isTracked: isTracked ?? this.isTracked,
        recovered: recovered ?? this.recovered,
        todayCases: todayCases ?? this.todayCases,
        todayDeaths: todayDeaths ?? this.todayDeaths,
        todayRecovered: todayRecovered ?? this.todayRecovered,
      );

  static Country fromJson(Map<String, dynamic> data) => Country(
        // ignore: avoid_dynamic_calls
        id: data['countryInfo']['_id'],
        updated: data['updated'],
        name: data['country'],
        active: data['active'],
        cases: data['cases'],
        deaths: data['deaths'],
        // ignore: avoid_dynamic_calls
        flagURL: data['countryInfo']['flag'],
        recovered: data['recovered'],
        todayCases: data['recovered'],
        todayDeaths: data['todayDeaths'],
        todayRecovered: data['todayRecovered'],
      );

  /// Empty Country which represents a [Country] object without data.
  static const empty = Country(id: 0, name: '', updated: 0);

  /// Convenience getter to determine whether the current country is empty.
  bool get isEmpty => this == Country.empty;

  /// Convenience getter to determine whether the current country is not empty.
  bool get isNotEmpty => this != Country.empty;
}
