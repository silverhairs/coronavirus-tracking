class Following {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int critical;
  bool isFollowed;
  Following({
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
