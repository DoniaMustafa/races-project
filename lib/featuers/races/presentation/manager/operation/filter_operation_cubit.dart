import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:optomatica_flutter_task/app_service.dart';
import 'package:optomatica_flutter_task/featuers/races/data/models/races_model.dart';
import '../../../../../core/utils/app_config/constant.dart';

part 'filter_operation_state.dart';

class FilterOperationCubit extends Cubit<FilterOperationState> {
  FilterOperationCubit() : super(FilterOperationInitial());
  List<String> list = [];
  List<String> bufferedList = [];
  List<RacesResponseModel> resultRaces = [];

  String searchedText = '';

  selectCheck(String item, bool isSelect) {
    if (isSelect) {
      list.add(item);
    } else {
      list.remove(item);
    }
    emit(CheckState());
  }

  clearList() {
    list.clear();
    emit(ClearState());
  }

  List<String> selectedFilterLabel = [];
  changeFilterSelectColor(String item, bool isSelect) {
    if (isSelect) {
      selectedFilterLabel.add(item);
    } else {
      // resultCountry.isEmpty;

      selectedFilterLabel.remove(item);
    }
    print('index >>> $item');
    print('selectedIndexes >>> $selectedFilterLabel');
    emit(ChangeFilterSelectColorState());
  }

  clearFilterLabel() {
    selectedFilterLabel.clear();
    Navigator.pop(AppService.getContext);
    // emit(ClearFilterState());
  }


}
