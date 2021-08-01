import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:stats_api/src/models/models.dart';

/// Thrown if the device is not connected to internet.
class InternetConnectionException implements Exception {}

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// {@template stats_api}
/// A Dart wrapper for the Covid19 stats API.
/// Learn more at https://disease.sh/
/// {@endtemplate}
class CovidStatsApi {
  /// {@macro stats_api}
  CovidStatsApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final _connectivity = Connectivity();

  static const authority = 'disease.sh';

  /// Fetches the list of countries affected by the COVID-19 and their stats
  ///
  /// REST call: `GET /v3/covid-19/countries`
  Future<List<Country>> fetchCountries() async {
    if (await _connectivity.checkConnectivity() == ConnectivityResult.none) {
      throw InternetConnectionException();
    }
    final uri = Uri.https(authority, '/v3/covid-19/countries');
    http.Response res;

    try {
      res = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }
    if (res.statusCode != 200) {
      throw HttpRequestFailure(res.statusCode);
    }
    List body;
    try {
      body = json.decode(res.body) as List;
    } catch (_) {
      throw JsonDecodeException();
    }

    try {
      return body
          .map((item) => Country.fromMap(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  /// Fetches the global stats of the COVID-19
  ///
  /// REST call: `GET /v3/covid-19/all`
  Future<CovidOverview> fetchOverview() async {
    final uri = Uri.https(authority, '/v3/covid-19/all');
    http.Response res;

    try {
      res = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }
    if (res.statusCode != 200) {
      throw HttpRequestFailure(res.statusCode);
    }
    Map body;
    try {
      body = json.decode(res.body) as Map;
    } catch (_) {
      throw JsonDecodeException();
    }
    try {
      return CovidOverview.fromMap(body as Map<String, dynamic>);
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
