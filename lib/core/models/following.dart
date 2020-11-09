import 'package:hive/hive.dart';

part 'following.g.dart';

@HiveType(typeId: 0)
class Following {
  @HiveField(0)
  String country;
  @HiveField(1)
  int cases;
  @HiveField(2)
  int todayCases;
  @HiveField(3)
  int deaths;
  @HiveField(4)
  int todayDeaths;
  @HiveField(5)
  int recovered;
  @HiveField(6)
  int critical;
  @HiveField(7)
  String flagURL;
  @HiveField(8)
  bool isFollowed;
  Following({
    this.flagURL,
    this.cases,
    this.country,
    this.critical,
    this.deaths,
    this.recovered,
    this.todayCases,
    this.todayDeaths,
    this.isFollowed,
  });
}
