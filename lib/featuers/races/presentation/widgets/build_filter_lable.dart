import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_svg.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildFilterLabel extends StatelessWidget {
  const BuildFilterLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 8),
      padding:
      EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color:   AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(color: AppColors.primaryColor, width: 1.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSVGImage(
            asset: AppAssets.filter,
          ),SizedBox(width: 4,),
          CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.lightYellow,
            child: Text(context
                .read<FilterOperationCubit>()
                .selectedFilterLabel
                .length
                .toString()),
          )
        ],
      ),
    );
  }
}
