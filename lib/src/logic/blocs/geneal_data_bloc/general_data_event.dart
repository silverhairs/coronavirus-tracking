part of 'general_data_bloc.dart';

abstract class GeneralDataEvent extends Equatable {
  const GeneralDataEvent();

  @override
  List<Object> get props => [];
}

class GeneralDataFetched extends GeneralDataEvent {}
