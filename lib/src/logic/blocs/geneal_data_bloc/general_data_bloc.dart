import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'package:covid/src/utils/constants.dart';
import 'package:covid/src/logic/exceptions.dart';
import 'package:covid/src/data/models/general_data/general_data.dart';

part 'general_data_event.dart';
part 'general_data_state.dart';

class GeneralDataBloc extends Bloc<GeneralDataEvent, GeneralDataState> {
  GeneralDataBloc({required this.httpClient}) : super(_fetchSavedState());

  final http.Client httpClient;

  @override
  Stream<GeneralDataState> mapEventToState(GeneralDataEvent event) async* {
    if (event is GeneralDataFetched) {
      yield await _applyStateChange(state);
    }
  }

  @override
  void onTransition(transition) async {
    await _saveLocally(transition.nextState.data);
    super.onTransition(transition);
  }

  @override
  Stream<Transition<GeneralDataEvent, GeneralDataState>> transformEvents(
    events,
    transitionFn,
  ) =>
      super.transformEvents(
        events.debounceTime(const Duration(seconds: 1)),
        transitionFn,
      );

  Future<GeneralDataState> _applyStateChange(GeneralDataState state) async {
    try {
      final data = await _fetchGeneralData();
      return state.copyWith(
        status: GeneralDataStatus.success,
        data: data,
        updateID: data.updated,
      );
    } on Exception {
      return state.copyWith(status: GeneralDataStatus.failure);
    }
  }

  Future<GeneralData> _fetchGeneralData() async {
    final res = await httpClient.get(Uri.https(dataSource, generalDataPath));
    if (res.statusCode == 200) {
      final Map<String, dynamic> rawData = jsonDecode(res.body);
      return GeneralData.fromJson(rawData);
    }
    throw const FetchIngException('Failed to fetch general data');
  }
}

var _generalDataBox = Hive.box<GeneralData>('general-data');

/// Generates a new [GeneralDataState] object from the [GeneralData]
/// saved in local Storage.
GeneralDataState _fetchSavedState() {
  var data = _generalDataBox.get('data', defaultValue: GeneralData.empty);
  return GeneralDataState(
    data: data!,
    status: GeneralDataStatus.initial,
    updateID: data.updated,
  );
}

/// Saves the data from the current [GeneralDataState] to the local Storage.
Future<void> _saveLocally(GeneralData data) async {
  await _generalDataBox.put('data', data);
}
