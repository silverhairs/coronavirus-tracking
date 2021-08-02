import 'package:covid19_repository/covid19_repository.dart';
import 'package:test/test.dart';

void main() {
  group('CountryException', () {
    test('returns a constructor normally', () {
      expect(() => const CountryException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        const CountryException('Something very bad happened').toString(),
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
        const CountrySearchException('Something very bad').toString(),
        equals('CountrySearchException(Something very bad)'),
      );
    });
  });

  group('OverviewException', () {
    test('returns constructor nomally', () {
      expect(() => const OverviewException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        const OverviewException('Very very bad').toString(),
        equals('OverviewException(Very very bad)'),
      );
    });
  });
}
