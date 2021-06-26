import 'package:covid19_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Country', () {
    test('supports value comparisons', () {
      expect(Country.empty, Country.empty);
    });

    test('has concise toString', () {
      expect(
        Country(
          countryInfo: CountryInfo.empty,
          updated: 0,
          country: 'Rwanda',
        ).toString(),
        equals('Country(Rwanda)'),
      );
    });

    group('CountryInfo', () {
      test('supports value comparise', () {
        expect(CountryInfo.empty, CountryInfo.empty);
      });

      test('has concise toString', () {
        expect(
          CountryInfo(flag: '', iso2: 'AB', iso3: 'ABC', lat: 0, long: 0)
              .toString(),
          equals('CountryInfo(AB, ABC)'),
        );
      });
    });
  });
}
