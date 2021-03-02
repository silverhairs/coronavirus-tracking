import 'package:hive/hive.dart';

part 'country.g.dart';

@HiveType(typeId: 0)
class Country {
  @HiveField(0)
  String name;
  @HiveField(1)
  int totalCases;
  @HiveField(2)
  int todayCases;
  @HiveField(3)
  int totalDeaths;
  @HiveField(4)
  int todayDeaths;
  @HiveField(5)
  int recoveries;
  @HiveField(6)
  int critical;
  @HiveField(7)
  String flagURL;
  @HiveField(8)
  bool isFollowed;
  @HiveField(9)
  int activeCases;
  Country({
    this.flagURL,
    this.totalCases: 0,
    this.name,
    this.critical: 0,
    this.totalDeaths: 0,
    this.recoveries: 0,
    this.todayCases: 0,
    this.todayDeaths: 0,
    this.isFollowed = false,
    this.activeCases: 0,
  });
  static fromMap(Map<String, dynamic> data) => Country(
        name: data['country'],
        totalCases: data['cases'],
        totalDeaths: data['deaths'],
        critical: data['critical'],
        flagURL: data['countryInfo']['flag'],
        recoveries: data['recovered'],
        todayCases: data['todayCases'],
        todayDeaths: data['todayDeaths'],
        activeCases: data['active'],
      );
}
