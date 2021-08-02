import 'package:covid19_api/covid19_api.dart';
import 'package:covid19_repository/covid19_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCovid19Client extends Mock implements Covid19Client {}

void main() {
  group('Covid19Repository', () {
    late Covid19Client covid19client;
    late Covid19Repository repository;

    final countries = List.generate(
      5,
      (index) => Country(
        countryInfo: CountryInfo.empty,
        updated: index * 5,
        country: 'Country-$index',
      ),
    );

    const overview = Overview(
      updated: 045435,
      active: 323,
      activePerOneMillion: 23423,
      affectedCountries: 234,
      cases: 2234523434,
      casesPerOneMillion: 2343,
      critical: 234323,
      criticalPerOneMillion: 2345,
      deaths: 2345,
      deathsPerOneMillion: 235,
    );

    setUp(() {
      covid19client = MockCovid19Client();
      repository = Covid19Repository(covid19client: covid19client);
    });

    test('creates constructor normally', () {
      expect(() => Covid19Repository(), returnsNormally);
    });

    group('getCovid19overview', () {
      setUp(() {
        when(() => covid19client.getOverview())
            .thenAnswer((invocation) async => overview);
      });

      test('throws an OverviewException when api throws an exception', () {
        when(() => covid19client.getOverview()).thenThrow(Exception());
        expect(
          () => repository.getCovid19overview(),
          throwsA(isA<OverviewException>()),
        );
      });

      test('makes a correct request', () async {
        await repository.getCovid19overview();
        verify(() => covid19client.getOverview()).called(1);
      });
    });

    group('getAffectedCountriesList', () {
      setUp(() {
        when(() => covid19client.getCountries())
            .thenAnswer((invocation) async => countries);
      });
      test('throws a CoutryException when the api throws an exception', () {
        when(() => covid19client.getCountries()).thenThrow(Exception());
        expect(
          () => repository.getAffectedCountriesList(),
          throwsA(isA<CountryException>()),
        );
      });
    });
  });
}
