import 'package:covid/extensions/string_extension.dart';
import 'package:covid/providers/following_data.dart';
import 'package:flutter/material.dart';
import 'package:covid/constants.dart';
import 'package:provider/provider.dart';
import 'package:covid/providers/following.dart';

bool isPinned = false;
bool isSearching = false;

class Countries extends StatefulWidget {
  Countries({this.countriesList, this.isDark});
  final List countriesList;
  final bool isDark;
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List filteredCountries = [];
  final searchInputController = TextEditingController();

  void findCountry(value) {
    filteredCountries = widget.countriesList
        .where(
          (country) =>
              (country['country'].toLowerCase()).contains(value.toLowerCase()),
        )
        .toList();
    // assign filteredCountries to a list of all the countries containing the entered query
  }

// toggle appbar icon
  GestureDetector toggleAppBarIcon() {
    GestureDetector displayedIcon;
    if (isSearching) {
      displayedIcon = GestureDetector(
        child: Icon(
          Icons.cancel,
        ),
        onTap: () {
          setState(() {
            isSearching = !isSearching;
            filteredCountries = widget.countriesList;
            // reassign filteredCountries to the initial value when the searchbar is collapsed
          });
        },
      );
    } else {
      displayedIcon = GestureDetector(
        child: Icon(
          Icons.search,
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

  @override
  void initState() {
    filteredCountries = widget.countriesList;
    // assign countriesList to a mutable variable so that I can edit it when changing states
    filteredCountries.forEach((country) {
      country['isFollowed'] = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: widget.isDark ? kBoxDarkColor : Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        controller: searchInputController,
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: toggleAppBarIcon(),
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
                return CountryDetails(
                  isDark: widget.isDark,
                  country: country,
                  follow: () {
                    setState(() {
                      country['isFollowed'] = !country['isFollowed'];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CountryDetails extends StatelessWidget {
  CountryDetails(
      {@required this.country, @required this.follow, @required this.isDark});

  final Map country;
  final Function follow;
  final bool isDark;

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
              Image(
                image: NetworkImage(country['countryInfo']['flag']),
                height: 20,
                width: 25,
              ),
              Flexible(
                child: Text(
                  country['country'].toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: !country['isFollowed']
                    ? Icon(Icons.add)
                    : Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                onPressed: () {
                  follow();
                  var newFollow = Following(
                      cases: country['cases'],
                      country: country['country'],
                      critical: country['critical'],
                      deaths: country['deaths'],
                      recovered: country['recovered'],
                      todayCases: country['todayCases'],
                      todayDeaths: country['todayDeaths'],
                      isFollowed: country['isFollowed'],
                      flag: NetworkImage(country['countryInfo']['flag']));
                  if (country['isFollowed']) {
                    Provider.of<FollowingData>(context, listen: false)
                        .follow(newFollow);
                  }
                },
              )
            ],
          ),
          SizedBox(height: 5),
          Divider(color: Colors.blueGrey[200], thickness: .5),
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
  }
}
