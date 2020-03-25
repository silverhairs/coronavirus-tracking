import 'package:covid/constants.dart';
import 'package:covid/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid/providers/following_data.dart';
import 'package:provider/provider.dart';
import 'country_following_box.dart';

class FollowingList extends StatelessWidget {
  final bool isDark;
  FollowingList(this.isDark);
  @override
  Widget build(BuildContext context) {
    return Consumer<FollowingData>(builder: (context, followingData, child) {
      var followings = followingData.followings;
      return Column(
        children: followings.map((following) {
          return CountryMonitoringBox(
            countryFlag: following.flag,
            isDark: isDark,
            country: following.country,
            numberOfCases: following.cases,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Country(
                    country: following,
                    isDark: isDark,
                  ),
                ),
              );
            },
            onLongPress: () => showDialog<void>(
              context: context,
              barrierDismissible: true, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: kBoxesRadius),
                  backgroundColor: isDark ? Colors.blueGrey[900] : Colors.white,
                  title: Text('Unfollow'),
                  content: Text(
                      'Remove ${following.country.toUpperCase()} from the following list?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        followingData.unfollow(following);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            ),
          );
        }).toList(),
      );
    });
  }
}
