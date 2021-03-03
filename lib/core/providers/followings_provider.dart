import 'package:covid/constants.dart';
import 'package:covid/core/models/country.dart';
import 'package:flutter/material.dart';

class FollowingsNotifier extends ChangeNotifier {
  List<Country> _followings = _getFollowings();
  List<Country> get followings => _followings;

  void follow(Country country) {
    if (!_followings.contains(country)) {
      _followings.add(country);
      _save(_followings);
    }
    notifyListeners();
  }

  void unfollow(Country country) {
    _followings.remove(country);
    _save(_followings);
    notifyListeners();
  }
}

List<Country> _getFollowings() {
  return countriesBox
      .get('followings', defaultValue: [])
      .cast<Country>()
      .toList();
}

void _save(List<Country> folowings) {
  countriesBox.put('followings', folowings);
}