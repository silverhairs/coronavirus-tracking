import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid/core/models/country.dart';
import 'package:flutter/material.dart';
import 'package:covid/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

bool isPinned = false;
bool isSearching = false;

class CountriesScreen extends HookWidget {
  final bool isDark;
  const CountriesScreen({this.isDark});

  Stream<Response> _getCountriesList() async* {
    yield* Stream.periodic(Duration(seconds: 3), (_) {
      return get(affectedCountriesAPI);
    }).asyncMap(
      (event) async => await event,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _searchBarIsVisible = useState<bool>(false);
    final _searchInputController = useTextEditingController.fromValue(
      TextEditingValue.empty,
    );
    final _countries = useProvider(countriesNotifier);
    final _followingsProvider = useProvider(followingsNotifier);
    final _filteredCountriesList = useState<List<Country>>([]);

    void _searchCountry(String value) {
      if (value.isNotEmpty) {
        _filteredCountriesList.value = _filteredCountriesList.value
            .where(
              (country) =>
                  country.name.toLowerCase().contains(value.toLowerCase()),
            )
            .toList();
      }
      _filteredCountriesList.value = _countries.countries;
    }

    return Scaffold(
      appBar: AppBar(
        title: _searchBarIsVisible.value
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: this.isDark ? kBoxDarkColor : Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        controller: _searchInputController,
                        autofocus: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search country...',
                        ),
                        onChanged: _searchCountry,
                      ),
                    )
                  ],
                ),
              )
            : Text('Affected Countries'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(_searchBarIsVisible.value ? Icons.cancel : Icons.search),
            onPressed: () {
              _searchBarIsVisible.value = !_searchBarIsVisible.value;
              if (!_searchBarIsVisible.value) {
                _filteredCountriesList.value = _countries.countries;
                _searchInputController.text = '';
              }
            },
          )
        ],
      ),
      body: StreamBuilder<Response>(
        stream: _getCountriesList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            json.decode(snapshot.data.body).forEach((country) {
              if (!_countries.countries.contains(country))
                _countries.save(Country.fromMap(country));
            });
            return ListView.builder(
              itemCount: _searchBarIsVisible.value
                  ? _filteredCountriesList.value.length
                  : _countries.countries.length,
              itemBuilder: (context, index) {
                var country = _searchBarIsVisible.value
                    ? _filteredCountriesList.value[index]
                    : _countries.countries[index];
                return CountryDetails(
                  isDark: this.isDark,
                  country: country,
                  onFollow: () => _followingsProvider.follow(country),
                );
              },
            );
          }
          return Center(
            child: Container(
              width: double.infinity,
              height: 300,
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class CountryDetails extends StatelessWidget {
  final Country country;
  final bool isDark;
  final VoidCallback onFollow;

  const CountryDetails({
    @required this.country,
    @required this.isDark,
    @required this.onFollow,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? kBoxDarkColor : kBoxLightColor,
        borderRadius: kBoxesRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: this.country.flagURL,
                height: 20,
                width: 25,
                errorWidget: (_, __, ___) => Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
              ),
              Flexible(
                child: Text(
                  country.name.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: !country.isFollowed
                    ? Icon(Icons.add)
                    : Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                onPressed: this.onFollow,
              )
            ],
          ),
          SizedBox(height: 5),
          Divider(color: Colors.blueGrey[200], thickness: .5),
          SizedBox(height: 15),
          Text('Total cases: ${country.totalCases}',
              style: TextStyle(fontSize: 18)),
          Text('Today cases: ${country.todayCases}',
              style: TextStyle(fontSize: 18)),
          Text('Total deaths: ${country.totalDeaths}',
              style: TextStyle(fontSize: 18)),
          Text('Today deaths: ${country.todayDeaths}',
              style: TextStyle(fontSize: 18)),
          Text('Recovered: ${country.recoveries}',
              style: TextStyle(fontSize: 18)),
          Text('In critical state: ${country.critical}',
              style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
