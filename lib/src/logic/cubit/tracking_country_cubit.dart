import 'package:bloc/bloc.dart';
import 'package:covid/src/data/models/country/country.dart';
import 'package:covid/src/utils/exceptions.dart';
import 'package:hive/hive.dart';

class TrackingCountryCubit extends Cubit<List<Country>> {
  TrackingCountryCubit() : super(_trackingList);

  void track(Country country) {
    _addToTrackingList(country.copytWith(isTracked: true)).then(emit);
  }

  void untrack(Country country) {
    _removeFromTrackingList(country.copytWith(isTracked: false)).then(emit);
  }
}

final _trackingBox = Hive.box<Country>('tracking');

List<Country> _trackingList = HiveList(_trackingBox).cast<Country>();

Future<List<Country>> _addToTrackingList(Country country) async {
  if (!_trackingList.contains(country)) {
    await _trackingBox.add(country);
    return _trackingList;
  }
  throw const TrackingException('Cannot track a tracked element');
}

Future<List<Country>> _removeFromTrackingList(Country country) async {
  if (_trackingList.contains(country)) {
    await _trackingBox.deleteAt(_trackingList.indexOf(country));
    return _trackingList;
  }
  throw const TrackingException('Cannot untrack an untracked element');
}
