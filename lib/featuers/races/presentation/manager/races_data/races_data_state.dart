part of 'races_data_cubit.dart';

@immutable
abstract class RacesDataState {}

class RacesDataInitial extends RacesDataState {}
class RacesDataLoading extends RacesDataState {}

class RacesDataLoaded extends RacesDataState {}
class RacesDataError extends RacesDataState {}
