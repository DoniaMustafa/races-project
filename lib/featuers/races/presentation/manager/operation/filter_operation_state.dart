part of 'filter_operation_cubit.dart';

@immutable
abstract class FilterOperationState {}

class FilterOperationInitial extends FilterOperationState {}
class CheckState extends FilterOperationState {}
class ClearState extends FilterOperationState {}
class SearchState extends FilterOperationState {}
class ChangeFilterSelectColorState extends FilterOperationState {}
class ClearFilterState extends FilterOperationState {}
class SearchForRacesState extends FilterOperationState {}
