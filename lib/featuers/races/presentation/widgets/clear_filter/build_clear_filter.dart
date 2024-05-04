import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/widgets/bottom_sheet_widget.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_botton.dart';
import 'package:optomatica_flutter_task/core/widgets/custon_divider.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildClearFilter extends StatelessWidget {
  const BuildClearFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildBottomSheetStableWidget(
          isSubTitle: false,
          title: 'Clear filters?',
        ),
        CustomButton(
          title: 'Yes, clear filters',
          onPressed: () =>
              context.read<FilterOperationCubit>().clearFilterLabel(),
        ),
        SizedBox(
          height: 8,
        ),
        CustomButton(
          color: AppColors.transparent,
          title: 'Cancel',
          isBorder: true,
          onPressed: () => Navigator.pop(context),
        ),
        Spacer(),
        CustomDivider(
          width: 134,
          height: 5,
        ),
      ],
    );
  }
}
