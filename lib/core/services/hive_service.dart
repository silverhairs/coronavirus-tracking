import 'package:covid/core/models/following.dart';
import 'package:hive/hive.dart';

class HiveService {
  //Following

  Set<Following> get followings => Hive.box<List<Following>>("following")
      .get("countries", defaultValue: [])
      .cast<Following>()
      .toSet();

  void saveFollowing(Following following) {
    try {
      followings.add(following);
      _update();
      print("Added ${following.country}");
    } catch (e) {
      print(e);
    }
  }

  void deleteFollowing(Following following) {
    try {
      followings.remove(
        followings.firstWhere((f) => f.country == following.country),
      );
      _update();
    } catch (e) {
      print(e);
    }
  }

  void _update() {
    Hive.box<List<Following>>("following").put(
      "countries",
      followings.toList(),
    );
  }
}
