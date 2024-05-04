import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/core/widgets/bottom_sheet_widget.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_botton.dart';
import 'package:optomatica_flutter_task/core/widgets/custon_divider.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildTypeBottomSheetWidgets extends StatefulWidget {
  BuildTypeBottomSheetWidgets({super.key});

  @override
  State<BuildTypeBottomSheetWidgets> createState() =>
      _BuildTypeBottomSheetWidgetsState();
}

class _BuildTypeBottomSheetWidgetsState
    extends State<BuildTypeBottomSheetWidgets> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildBottomSheetStableWidget(
          isSubTitle: false,
          title: 'Race Type',
          subTitleOnTap: () {},
        ),
        SizedBox(
          height: 16,
        ),
        Column(
            children: List.generate(AppConstant.types.length,
                (index) => _buildRadiobutton(AppConstant.types[index], index))),
        SizedBox(
          height: 16,
        ),
        CustomButton(
          onPressed: () {
            isSelect = true;
            setState(() {});
            context
                .read<FilterOperationCubit>()
                .changeFilterSelectColor(AppConstant.title[0], isSelect);
          },
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  String titles = '';
  Widget _buildRadiobutton(title, int i) => Padding(
        padding: const EdgeInsets.only(left: 15),
        child: RadioListTile(
            title: Text(title),
            controlAffinity: ListTileControlAffinity.trailing,
            value: title,
            groupValue: titles,
            onChanged: (val) {
              titles = val.toString();
              setState(() {});
            }),
      );
}
