import 'package:covid/src/data/models/country/country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      // ignore: lines_longer_than_80_chars
      'Given a Map<String,dynamic> with the right structure, a non-empty Country object should be generated',
      () async {
    // ARRANGE
    const data = {
      'updated': 1622384794491,
      'country': 'Afghanistan',
      'countryInfo': {
        '_id': 12,
        'flag': 'https://disease.sh/assets/img/flags/af.png',
      },
      'cases': 71838,
      'todayCases': 1076,
      'deaths': 2944,
      'todayDeaths': 25,
      'recovered': 57450,
      'todayRecovered': 169,
      'active': 11444,
    };
    // ACT
    final country = Country.fromJson(data);
    //ASSERT
    expect(country.isEmpty, false);
  });
}
