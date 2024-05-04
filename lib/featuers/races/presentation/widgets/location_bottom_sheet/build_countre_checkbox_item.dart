import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildCountriesCheckBoxItem extends StatelessWidget {
  const BuildCountriesCheckBoxItem({super.key, this.index, this.title});
  final int? index;
  final     String? title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: context
          .read<FilterOperationCubit>()
          .list
          .contains(AppConstant.countries[index!])
          ? AppColors.selectedList
          : AppColors.transparent,
      child: CheckboxListTile(
        title: Text(
          title!,
          style: index == 0
              ? getBoldStyle(fontSize: 16, color: AppColors.primaryColor)
              : getRegularStyle(fontSize: 14, color: AppColors.primaryColor),
        ),
        value: context
            .read<FilterOperationCubit>()
            .list
            .contains(AppConstant.countries[index!]),
        onChanged: (v) => context
            .read<FilterOperationCubit>()
            .selectCheck(AppConstant.countries[index!], v!),
      ),
    );
  }
}
