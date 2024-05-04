import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/core/widgets/bottom_sheet_widget.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_botton.dart';
import 'package:optomatica_flutter_task/core/widgets/custon_divider.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildDistanceBottomSheetWidgets extends StatefulWidget {
  BuildDistanceBottomSheetWidgets({super.key});

  @override
  State<BuildDistanceBottomSheetWidgets> createState() =>
      _BuildDistanceBottomSheetWidgetsState();
}

class _BuildDistanceBottomSheetWidgetsState
    extends State<BuildDistanceBottomSheetWidgets> {
  RangeValues _values = const RangeValues(0, 45);
  late RangeLabels rang;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rang = RangeLabels(_values.start.toString(), _values.end.toString());
  }
 bool  isSelect=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildBottomSheetStableWidget(
          title: 'Race distance',
          subTitle: 'Reset',
          subTitleOnTap: () {},
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            '${_values.start.toInt()} - ${_values.end.toInt()} K',
            style: getRegularStyle(fontSize: 14, color: AppColors.primaryColor),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: RangeSlider(
            inactiveColor: AppColors.borderGray,
            activeColor: AppColors.yellow,
            values: _values,
            max: 150,
            divisions: 20,
            labels: rang,
            onChanged: (RangeValues values) {
              setState(() {
                _values = values;
              });
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CustomButton(onPressed: () {
           isSelect=true;

          context
            .read<FilterOperationCubit>()
            .changeFilterSelectColor(AppConstant.title[2],isSelect);
        },),
        Spacer(
          flex: 1,
        ),
        CustomDivider(
          width: 134,
          height: 5,
        ),
      ],
    );
  }

}
