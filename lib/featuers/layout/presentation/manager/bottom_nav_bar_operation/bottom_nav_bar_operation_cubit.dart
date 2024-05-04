import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_operation_state.dart';

class BottomNavBarOperationCubit extends Cubit<BottomNavBarOperationState> {
  BottomNavBarOperationCubit() : super(BottomNavBarOperationInitial());

  int selectedIndex = 2;

  changeIndex(int index) {
    selectedIndex = index;
    print(selectedIndex);
    emit(ChangeIndexState());
  }
}
