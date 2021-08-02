import 'dart:convert';

import 'package:covid19_api/src/exceptions.dart';
import 'package:covid19_api/src/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Covid19Client {
  Covid19Client({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  @visibleForTesting
  static const authority = 'disease.sh';

  final http.Client _httpClient;

  /// Get overview Covid-19 data from `https://disease.sh/v3/covid-19/all`
  Future<Overview> getOverview() async {
    final uri = Uri.https(authority, '/v3/covid-19/all');

    final http.Response res;
    try {
      res = await _httpClient.get(uri);
    } catch (_) {
      throw const HttpException('[overview]');
    }
    if (res.statusCode != 200) {
      throw HttpRequestFailure(res.statusCode, '[overview]');
    }
    Map<String, dynamic> data;
    try {
      data = jsonDecode(res.body) as Map<String, dynamic>;
    } catch (_) {
      throw const JsonDecodeException('[overview]');
    }
    try {
      return Overview.fromJson(data);
    } catch (_) {
      throw const JsonDeserializeException('[overview]');
    }
  }

  /// Get countries Covid-19 data from `https://disease.sh/v3/covid-19/countries`
  Future<List<Country>> getCountries() async {
    final uri = Uri.https(authority, '/v3/covid-19/countries');
    final http.Response res;
    try {
      res = await _httpClient.get(uri);
    } catch (_) {
      throw const HttpException('[countries]');
    }
    if (res.statusCode != 200) {
      throw HttpRequestFailure(res.statusCode, '[countries]');
    }
    List data;
    try {
      data = jsonDecode(res.body) as List;
    } catch (_) {
      throw const JsonDecodeException('[countries]');
    }
    try {
      // ignore: unnecessary_lambdas
      return data.map((e) => Country.fromJson(e)).toList();
    } catch (_) {
      throw const JsonDeserializeException('[countries]');
    }
  }
}
