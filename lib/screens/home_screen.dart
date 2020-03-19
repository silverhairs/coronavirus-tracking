import 'dart:convert';
import 'package:covid/components/country_monitoring_box.dart';
import 'package:covid/components/following_list.dart';
import 'package:covid/providers/following_data.dart';
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

  Future getCountries() async {
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

  @override
  void initState() {
    getData();
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Global',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      InfoBox(
                        title: 'Total cases',
                        number: totalCases,
                        color: Colors.blue,
                        icon: Icon(FontAwesomeIcons.globeAmericas,
                            color: Colors.white, size: 20),
                      ),
                      SizedBox(width: 25),
                      InfoBox(
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
                          title: 'Deaths',
                          color: Colors.red,
                          icon: Icon(FontAwesomeIcons.skull,
                              color: Colors.white, size: 20),
                          number: deaths),
                      SizedBox(width: 25),
                      InfoBox(
                        title: 'Recovered',
                        number: recovered,
                        color: Colors.green,
                        icon: Icon(Icons.check, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      'Countries I follow',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FollowingList()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
