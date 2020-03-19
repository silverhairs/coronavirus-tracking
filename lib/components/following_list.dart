import 'package:flutter/material.dart';
import 'package:covid/providers/following_data.dart';
import 'package:provider/provider.dart';
import 'country_monitoring_box.dart';

class FollowingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FollowingData>(builder: (context, followingData, child) {
      var followings = followingData.followings;
      return Column(
        children: followings.map((following) {
          return CountryMonitoringBox(
              country: following.country, numberOfCases: following.cases);
        }).toList(),
      );
    });
  }
}
