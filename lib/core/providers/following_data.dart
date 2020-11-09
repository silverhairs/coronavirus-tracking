import 'package:covid/core/services/hive_service.dart';
import 'package:flutter/foundation.dart';
import '../models/following.dart';

final _hiveService = HiveService();

class FollowingData extends ChangeNotifier {
  List<Following> _followings =
      _hiveService == null ? [] : _hiveService.followings.toList();

  List<Following> get followings => _followings;
  int get totalFollowings => _followings.length;

  void follow(Following country) {
    _followings.add(country);
    notifyListeners();
  }

  void unfollow(Following country) {
    _hiveService.deleteFollowing(country);
    notifyListeners();
  }
}
