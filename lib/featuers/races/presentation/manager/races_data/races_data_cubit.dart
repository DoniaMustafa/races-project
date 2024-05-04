import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/featuers/races/data/models/races_model.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

part 'races_data_state.dart';

class RacesDataCubit extends Cubit<RacesDataState> {
  RacesDataCubit() : super(RacesDataInitial());
  List<RacesResponseModel> list = [];
  List<RacesResponseModel> bufferList = [];

  String text = '';
  getRaceData() async {
    var data = await rootBundle.loadString(AppAssets.racesData);
    list = racesResponseModelFromJson(data);
    list.forEach((element) {
      bufferList.add(element);
    });

    emit(RacesDataLoaded());
  }

  getRacesDataFilter({String text = ''}) async {
    print("search $text");
    if(text!=this.text){
      if(text.isEmpty){
        print("empty");

        emit(RacesDataLoading());
        list.clear();
         for (var element in bufferList) {
          list.add(element);
        }
        emit(RacesDataLoaded());

      }else{
        print("start filtering");
        this.text = text;
        list.clear();

        list.addAll(bufferList.where((element) =>element.city!.toLowerCase().contains(text.toLowerCase())
            ||element.country!.toLowerCase().contains(text.toLowerCase())
            ||
            element.name!.toLowerCase().contains(text.toLowerCase())

        ));

        emit(RacesDataLoaded());
      }

    }

  }
}
