import 'dart:convert';

import 'package:covid19_api/src/covid19_api_client.dart';
import 'package:covid19_api/src/exceptions.dart';
import 'package:covid19_api/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('Covid19Client', () {
    late http.Client httpClient;
    late Covid19Client covid19Client;

    final overview = const Overview(
      updated: 0,
      active: 2,
      activePerOneMillion: 4,
      affectedCountries: 222,
      cases: 242353534,
      casesPerOneMillion: 234,
      critical: 23523534,
      criticalPerOneMillion: 12,
      deaths: 1352352345,
      deathsPerOneMillion: 132,
      population: 1234123412341,
      recovered: 234123423,
      recoveredPerOneMillion: 234,
      tests: 23141234,
      testsPerOneMilllion: 242,
      todayCases: 2354,
      todayDeaths: 1234234,
      todayRecovered: 234531,
    );

    final countries = List.generate(
      12,
      (index) => Country(
        countryInfo: CountryInfo(
          lat: index * 2.0,
          flag: 'https://example.com/flag',
          long: index * -1.5,
          id: index,
          iso2: 'A$index',
          iso3: 'AB$index',
        ),
        updated: index * 15,
        country: 'Konoha',
        active: index * 100,
        cases: index * 1200,
        deaths: index * 50,
        isTracked: false,
        recovered: index,
        todayCases: index * 5,
        todayDeaths: index * 5,
        todayRecovered: index * 12,
      ),
    );

    setUp(() {
      httpClient = MockHttpClient();
      covid19Client = Covid19Client(httpClient: httpClient);
    });
    setUpAll(() {
      registerFallbackValue<Uri>(Uri());
    });
    test('constructor returns normally', () {
      expect(() => Covid19Client(), returnsNormally);
    });

    group('getOverview()', () {
      setUp(() {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response(jsonEncode(overview), 200),
        );
      });

      test('throws a HttpException when request fails', () {
        when(() => httpClient.get(any())).thenThrow(Exception());
        expect(
          () => covid19Client.getOverview(),
          throwsA(isA<HttpException>()),
        );
      });

      test('throws a HttpRequestFailure when status code is not 200', () {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response('{"msg":"failed"}', 404),
        );
        expect(
          () => covid19Client.getOverview(),
          throwsA(isA<HttpRequestFailure>()),
        );
      });

      test('throws a JsonDecodeException when fails to decode response body',
          () {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response('You are in the matrix!', 200),
        );
        expect(
          () => covid19Client.getOverview(),
          throwsA(isA<JsonDecodeException>()),
        );
      });

      test(
          'throws a JsonDeserializeException when failed to deserialize response body',
          () {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response('{"neo":"Gimme the red pill!"}', 200),
        );
        expect(
          () => covid19Client.getOverview(),
          throwsA(isA<JsonDeserializeException>()),
        );
      });

      test('makes a successful request', () async {
        await covid19Client.getOverview();

        verify(
          () => httpClient.get(
            Uri.https(Covid19Client.authority, '/v3/covid-19/all'),
          ),
        ).called(1);
      });
      test('returns overview data', () {
        expect(covid19Client.getOverview(), completion(equals(overview)));
      });
    });

    group('getCountries()', () {
      setUp(() {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response(jsonEncode(countries), 200),
        );
      });

      test('throws a HttpException when request fails', () {
        when(() => httpClient.get(any())).thenThrow(Exception());
        expect(
          () => covid19Client.getCountries(),
          throwsA(isA<HttpException>()),
        );
      });

      test('throws a HttpRequestFailure when the status code is not 200', () {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response('{"status":"not found"}', 404),
        );
        expect(
          () => covid19Client.getCountries(),
          throwsA(isA<HttpRequestFailure>()),
        );
      });

      test('throws a JsonDecodeException when failed to decode response body',
          () {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response('not in the matrix', 200),
        );
        expect(
          () => covid19Client.getCountries(),
          throwsA(isA<JsonDecodeException>()),
        );
      });

      test(
          'throws a JsonDeserializeException when failed to deserialize response body',
          () {
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => http.Response('{"trinity":"Gimme the blue pill!"}', 200),
        );
        expect(
          () => covid19Client.getOverview(),
          throwsA(isA<JsonDeserializeException>()),
        );
      });

      test('makes a successful request', () async {
        await covid19Client.getCountries();
        verify(
          () => httpClient.get(
              Uri.https(Covid19Client.authority, '/v3/covid-19/countries')),
        ).called(1);
      });

      test('returns a list of countries', () {
        expect(covid19Client.getCountries(), completion(equals(countries)));
      });
    });
  });
}
