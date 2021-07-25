import 'package:hive/hive.dart';
import 'package:stats_api/stats_api.dart';

import 'hive_repository.dart';

class TrackingRepository implements HiveRepository<Country> {
  const TrackingRepository({required this.box});

  final Box<Country> box;

  @override
  Future<void> clean() async {
    await box.clear();
  }

  @override
  List<Country> readAll() {
    return box.values.toList();
  }

  @override
  Future<void> write(country) async {
    final trackingList = box.values;

    if (trackingList.isNotEmpty) {
      final idList = trackingList.map((e) => e.info.id).toList();
      if (idList.contains(country.info.id)) {
        throw DuplicateItemException();
      } else {
        await box.add(country);
      }
    } else {
      await box.add(country);
    }
  }
}
