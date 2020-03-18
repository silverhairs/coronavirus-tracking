import 'package:covid/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/constants.dart';

bool isPinned = false;
bool isSearching = false;

class Countries extends StatefulWidget {
  Countries({this.countriesList});
  final List countriesList;

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List filteredCountries = [];

  void findCountry(value) {
    filteredCountries = widget.countriesList
        .where(
          (country) => country['country'] == value,
        )
        .toList();
  }

  @override
  void initState() {
    filteredCountries = widget.countriesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: isSearching
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: kBoxColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search country...',
                        ),
                        onChanged: (value) {
                          setState(() {
                            value == ''
                                ? filteredCountries = widget.countriesList
                                : findCountry(value);
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            : Text('Affected Countries'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Hero(
                child: Icon(isSearching ? Icons.cancel : Icons.search,
                    color: Colors.white),
                tag: 'search',
              ),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
            ),
          )
        ],
      ),
      body: widget.countriesList == null
          ? SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      var country = filteredCountries[index];
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: kBoxColor, borderRadius: kBoxesRadius),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  country['country'].toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.thumbtack,
                                    color: isPinned ? Colors.blue : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPinned = !isPinned;
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(color: Colors.white, thickness: .5),
                            SizedBox(height: 15),
                            Text('Total cases: ${country['cases']}',
                                style: TextStyle(fontSize: 18)),
                            Text('Today cases: ${country['todayCases']}',
                                style: TextStyle(fontSize: 18)),
                            Text('Total deaths: ${country['deaths']}',
                                style: TextStyle(fontSize: 18)),
                            Text('Today deaths: ${country['todayDeaths']}',
                                style: TextStyle(fontSize: 18)),
                            Text('Recovered: ${country['recovered']}',
                                style: TextStyle(fontSize: 18)),
                            Text('In critical state: ${country['critical']}',
                                style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
