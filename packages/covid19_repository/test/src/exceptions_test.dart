import 'package:covid19_repository/covid19_repository.dart';
import 'package:test/test.dart';

void main() {
  group('CountryException', () {
    test('returns a constructor normally', () {
      expect(() => CountryException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        CountryException('Something very bad happened').toString(),
        equals('CountryException(Something very bad happened)'),
      );
    });
  });

  group('CountrySearchException', () {
    test('returns constructor normal', () {
      expect(() => CountrySearchException, returnsNormally);
    });

    test('has concise toString', () {
      expect(
        CountrySearchException('Something very bad').toString(),
        equals('CountrySearchException(Something very bad)'),
      );
    });
  });

  group('OverviewException', () {
    test('returns constructor nomally', () {
      expect(() => OverviewException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        OverviewException('Very very bad').toString(),
        equals('OverviewException(Very very bad)'),
      );
    });
  });
}
