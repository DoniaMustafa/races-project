import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';

part 'search_location_state.dart';

class SearchLocationCubit extends Cubit<SearchLocationState> {
  SearchLocationCubit() : super(SearchLocationInitial());

  List<String> resultCountry = AppConstant.countries;

  searchForListCountries(
    String text,
  ) {
    final finalResult = AppConstant.countries.where((element) {
      final searchList = element.toLowerCase();
      final input = text.toLowerCase();
      return searchList.contains(input);
    }).toList();
    resultCountry = finalResult;

    print('countries????${AppConstant.countries}');
    print('finalResult>>>>$finalResult');

    emit(SearchState());
  }
}
