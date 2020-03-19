import 'package:covid/extensions/string_extension.dart';
import 'package:covid/providers/following.dart';
import 'package:covid/providers/following_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/constants.dart';
import 'package:provider/provider.dart';

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

  GestureDetector searchBarCollapse() {
    GestureDetector displayedIcon;
    if (isSearching) {
      displayedIcon = GestureDetector(
        child: Icon(
          Icons.cancel,
          color: Colors.white,
        ),
        onTap: () {
          setState(() {
            isSearching = !isSearching;
            filteredCountries = widget.countriesList;
          });
        },
      );
    } else {
      displayedIcon = GestureDetector(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onTap: () {
          setState(() {
            isSearching = !isSearching;
          });
        },
      );
    }
    return displayedIcon;
  }

  Icon followIconHandler(String country) {
    Icon followIcon;
    for (var following in Provider.of<FollowingData>(context).followings) {
      if (country == following.country) {
        followIcon = Icon(Icons.check, color: Colors.blue);
      } else {
        followIcon =
            Icon(FontAwesomeIcons.thumbtack, color: Colors.white, size: 20);
      }
    }
    return followIcon;
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
                        autofocus: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search country...',
                        ),
                        onChanged: (value) {
                          setState(() {
                            value == ''
                                ? filteredCountries = widget.countriesList
                                : findCountry(
                                    (value.toLowerCase()).capitalize());
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
            child: searchBarCollapse(),
          )
        ],
      ),
      body: Column(
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
                            icon: Icon(Icons.add),
                            onPressed: () {
                              var newFollow = Following(
                                  cases: country['cases'],
                                  country: country['country']);

                              Provider.of<FollowingData>(context, listen: false)
                                  .follow(newFollow);
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
