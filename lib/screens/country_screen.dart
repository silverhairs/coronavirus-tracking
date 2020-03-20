import 'package:covid/constants.dart';
import 'package:covid/providers/following.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Following country;
  final bool isDark;
  Country({@required this.isDark, @required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.country),
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
                  'Cases: ${country.cases}\nDeceased: ${country.deaths}\nHealed: ${country.recovered}\nCritical cases: ${country.critical}',
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
