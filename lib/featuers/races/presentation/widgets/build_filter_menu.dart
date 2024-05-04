import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/app_service.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/core/utils/helper/app_helper.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/build_filter_lable.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/clear_filter/build_clear_filter.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/date_bottom/build_date_bottom_sheet_widgets.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/distance_bottom/build_destance_bottom_sheet_widgets.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/location_bottom_sheet/build_buttom_sheet_widgets.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/type_bottom/build_type_bottom_sheet_widgets.dart';

class BuildFilterMenu extends StatefulWidget {
  BuildFilterMenu({super.key});

  @override
  State<BuildFilterMenu> createState() => _BuildFilterMenuState();
}

class _BuildFilterMenuState extends State<BuildFilterMenu> {
  double height = MediaQuery.of(AppService.getContext).size.height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<FilterOperationCubit, FilterOperationState>(
        builder: (context, state) {
          if (context
              .read<FilterOperationCubit>()
              .selectedFilterLabel
              .isNotEmpty) {
            return ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              children: [
                GestureDetector(
                    onTap: (){
                      AppHelper.bottomSheet(
                        height:height/3.7,child:BuildClearFilter()
                      );
                    },
                    child: BuildFilterLabel()),
                Row(
                  children: List.generate(
                      AppConstant.title.length,
                      (index) => buildFilterItem(

                          txt: AppConstant.title[index],
                          onTap: () => raceBottomSheet(index))),
                )
              ],
            );
          } else {
            return ListView(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  AppConstant.title.length,
                  (index) => buildFilterItem(

                      txt: AppConstant.title[index],
                      onTap: () => raceBottomSheet(index))),
            );
          }
        },
      ),
    );
  }

  buildFilterItem({required String txt, void Function()? onTap, }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.only(right: 13, left: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
              color: context
                      .read<FilterOperationCubit>()
                      .selectedFilterLabel
                      .contains(txt)
                  ? AppColors.primaryColor
                  : AppColors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryColor, width: 1.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                txt,
                style:
                    getMediumStyle(fontSize: 14, color:context
                        .read<FilterOperationCubit>()
                        .selectedFilterLabel
                        .contains(txt)?AppColors.white: AppColors.primaryColor),
              ),
              const SizedBox(
                width: 9,
              ),
              Icon(Icons.keyboard_arrow_down_outlined,
                  color:context
                      .read<FilterOperationCubit>()
                      .selectedFilterLabel
                      .contains(txt)?AppColors.white:AppColors.primaryColor)
            ],
          ),
        ),
      );

  void raceBottomSheet(int index) => AppHelper.bottomSheet(
      height: index == 0
          ? height / 2.3
          : index == 1
              ? height / 1.35
              : index == 2
                  ? height / 2.8
                  : height / 2.1,
      child: BlocBuilder<FilterOperationCubit, FilterOperationState>(
        builder: (context, state) {
          print(index);

          switch (index) {
            case 0:
              return BuildTypeBottomSheetWidgets();
            case 1:
              return BuildLocationBottomSheetWidgets();
            case 2:
              return BuildDistanceBottomSheetWidgets();
            default:
              return BuildDateBottomSheetWidgets();
          }
        },
      ));
}
