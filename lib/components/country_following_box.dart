import 'package:covid/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryMonitoringBox extends StatelessWidget {
  final String country;
  final int numberOfCases;
  final Function onPressed;
  final Function onLongPress;
  final bool isDark;
  CountryMonitoringBox({
    @required this.isDark,
    @required this.country,
    this.numberOfCases = 0,
    @required this.onPressed,
    @required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isDark ? kBoxDarkColor : kBoxLightColor,
          borderRadius: kBoxesRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: isDark ? Colors.black : Colors.grey[100],
                  child: Icon(FontAwesomeIcons.thumbtack,
                      color: Colors.blue, size: 20),
                ),
                SizedBox(width: 15),
                Text(
                  country,
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
            Text(
              '$numberOfCases',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
