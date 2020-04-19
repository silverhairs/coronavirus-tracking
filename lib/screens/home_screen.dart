import 'dart:async';
import 'dart:convert';
import 'package:covid/providers/theme_changer.dart';
import 'package:covid/screens/who_advice.dart';
import 'package:covid/components/following_list.dart';
import 'package:covid/screens/countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid/constants.dart';
import 'package:covid/components/info_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalCases = 0;
  int deaths = 0;
  int recovered = 0;
  int numberOfCountries = 0;
  List countries = [];
  bool isDarkTheme = false;

  Future getData() async {
    http.Response response = await http.get(allCasesAPI);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        totalCases = data['cases'];
        deaths = data['deaths'];
        recovered = data['recovered'];
      });
    } else {
      print(response.statusCode);
    }
  }

  Future getCountriesData() async {
    http.Response response = await http.get(affectedCountriesAPI);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      setState(() {
        countries = jsonDecode(response.body);
        numberOfCountries = countries.length;
      });
    } else {
      print('Server Error:${response.statusCode}');
    }
  }

  Icon _themeSwitcherIcon(bool currentTheme) {
    Icon currentIcon =
        Icon(FontAwesomeIcons.sun, color: Colors.blueGrey, size: 20);
    if (currentTheme == true) {
      setState(() {
        currentIcon =
            Icon(FontAwesomeIcons.moon, color: Colors.blueGrey, size: 20);
      });
    } else {
      setState(() {
        currentIcon =
            Icon(FontAwesomeIcons.sun, color: Colors.blueGrey, size: 20);
      });
    }
    return currentIcon;
  }

  @override
  void initState() {
    getData();
    getCountriesData();
    Timer.periodic(Duration(hours: 3), (Timer t) => getCountriesData());
    Timer.periodic(Duration(hours: 3), (Timer t) => getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: _themeSwitcherIcon(isDarkTheme),
            onPressed: () {
              setState(() {
                isDarkTheme = !isDarkTheme;
                _themeChanger.setTheme(isDarkTheme ? kDarkTheme : kLightTheme);
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Global',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        InfoBox(
                          isDark: isDarkTheme,
                          title: 'Total cases',
                          number: totalCases,
                          color: Colors.blue,
                          icon: Icon(FontAwesomeIcons.globeAmericas,
                              color: Colors.white, size: 20),
                        ),
                        SizedBox(width: 25),
                        InfoBox(
                          isDark: isDarkTheme,
                          title: 'Countries',
                          color: Colors.orange,
                          icon: Icon(Icons.flag, color: Colors.white),
                          number: numberOfCountries,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Countries(
                                  countriesList: countries,
                                  isDark: isDarkTheme,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: <Widget>[
                        InfoBox(
                            isDark: isDarkTheme,
                            title: 'Deaths',
                            color: Colors.red,
                            icon: Icon(FontAwesomeIcons.skull,
                                color: Colors.white, size: 20),
                            number: deaths),
                        SizedBox(width: 25),
                        InfoBox(
                          isDark: isDarkTheme,
                          title: 'Recovered',
                          number: recovered,
                          color: Colors.green,
                          icon: Icon(Icons.check, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: isDarkTheme ? kBoxDarkColor : kBoxLightColor,
                        borderRadius: kBoxesRadius,
                      ),
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.readme,
                          color: Colors.blue,
                        ),
                        title: Text(
                          'Protective measures',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Protective measures against the coronavirus',
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WhoAdvice(isDarkTheme)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        'Countries I follow',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FollowingList(isDarkTheme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
