part of 'general_data_bloc.dart';

enum GeneralDataStatus { initial, success, failure }

class GeneralDataState extends Equatable {
  const GeneralDataState({
    this.data = GeneralData.empty,
    this.status = GeneralDataStatus.initial,
    this.updateID = 0,
  });

  final GeneralData data;
  final GeneralDataStatus status;
  final int updateID;

  GeneralDataState copyWith({
    GeneralData? data,
    GeneralDataStatus? status,
    int? updateID,
  }) =>
      GeneralDataState(
        data: data ?? this.data,
        status: status ?? this.status,
        updateID: updateID ?? this.updateID,
      );

  @override
  List<Object?> get props => [data, status, updateID];

  @override
  String toString() {
    return '''GeneralDataState: {status: $status, updateID: $updateID, data: $data}''';
  }
}
