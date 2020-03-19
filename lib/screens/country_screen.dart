import 'package:covid/constants.dart';
import 'package:covid/providers/following.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Following country;
  Country({@required this.country});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(country.country),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kBoxColor,
              borderRadius: kBoxesRadius,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'General',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.grey, thickness: .3),
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
                Divider(color: Colors.grey, thickness: .1),
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
