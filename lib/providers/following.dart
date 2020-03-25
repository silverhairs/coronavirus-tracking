import 'package:flutter/rendering.dart';

class Following {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int critical;
  NetworkImage flag;
  bool isFollowed;
  Following({
    this.flag,
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
