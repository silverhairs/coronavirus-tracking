import 'package:covid/constants.dart';
import 'package:covid/core/models/country.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  final Country country;
  final bool isDark;
  CountryScreen({@required this.isDark, @required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isDark ? kBoxDarkColor : kBoxLightColor,
              borderRadius: kBoxesRadius,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'General',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: .3, color: Colors.blueGrey[200]),
                SizedBox(height: 15),
                Text(
                  'Cases: ${country.totalCases}\nDeceased: ${country.totalDeaths}\nHealed: ${country.recoveries}\nCritical cases: ${country.critical}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Today',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: .1, color: Colors.blueGrey[200]),
                SizedBox(height: 15),
                Text(
                  'Cases: ${country.todayCases}\nDeceased: ${country.todayDeaths}',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
