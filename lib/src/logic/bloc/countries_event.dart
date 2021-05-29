part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CountriesFetched extends CountriesEvent {}
