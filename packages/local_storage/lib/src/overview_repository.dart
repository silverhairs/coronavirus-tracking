import 'package:hive/hive.dart';
import 'package:stats_api/stats_api.dart';

import 'hive_repository.dart';

class OverviewRepository implements HiveRepository<CovidOverview> {
  const OverviewRepository({required this.box});

  final Box<CovidOverview> box;

  @override
  Future<void> clean() async {
    await box.clear();
  }

  @override
  List<CovidOverview> readAll() {
    return box.values.toList();
  }

  @override
  Future<void> write(CovidOverview overview) async {
    if (box.isEmpty) {
      await box.add(overview);
    } else {
      await box.clear().then((_) => box.add(overview));
    }
  }
}
