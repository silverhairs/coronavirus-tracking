import 'package:flutter/foundation.dart';
import 'following.dart';

class FollowingData extends ChangeNotifier {
  List<Following> _followings = [];

  List<Following> get followings => _followings;
  int get totalFollowings => _followings.length;

  void follow(Following country) {
    _followings.add(country);
    notifyListeners();
  }

  void unfollow(Following country) {
    _followings.remove(country);
    notifyListeners();
  }
}
