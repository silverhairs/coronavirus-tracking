import 'package:covid/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CountryMonitoringBox extends StatelessWidget {
  final String country;
  final int numberOfCases;
  CountryMonitoringBox({@required this.country, this.numberOfCases = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: kBoxColor, borderRadius: kBoxesRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(FontAwesomeIcons.thumbtack, color: Colors.white),
              ),
              SizedBox(width:15),
              Text(
                country,
                style: TextStyle(color: Colors.grey, fontSize: 22),
              ),
            ],
          ),
          Text(
            '$numberOfCases',
            style: TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      ),
    );
  }
}
