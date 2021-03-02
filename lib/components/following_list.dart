import 'package:covid/constants.dart';
import 'package:covid/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'watched_country_card.dart';

class FollowingList extends HookWidget {
  final bool isDark;
  FollowingList(this.isDark);
  @override
  Widget build(BuildContext context) {
    final _followings = useProvider(followingsNotifier);
    return Column(
      // var country = _followings.followings[index];

      children: _followings.followings.map((country) {
        return WatchedCountryCard(
          countryFlag: NetworkImage(country.flagURL),
          isDark: isDark,
          country: country.name,
          numberOfCases: country.totalCases,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryScreen(
                  country: country,
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
                    'Remove ${country.name.toUpperCase()} from the following list?'),
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
                      _followings.unfollow(country);
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
  }
}
