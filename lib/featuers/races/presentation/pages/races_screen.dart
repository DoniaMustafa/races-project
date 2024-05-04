import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_text_form.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/races_data/races_data_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/build_filter_menu.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/build_races_list.dart';

class RacesScreen extends StatelessWidget {
  RacesScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          buildTextForm,
          const SizedBox(
            height: 16,
          ),
          BuildFilterMenu(),
          const Expanded(child: BuildRacesScreen()),
        ],
      ),
    );
  }
  get buildTextForm=>BlocBuilder<FilterOperationCubit, FilterOperationState>(
    builder: (context, state) {
      return CustomTextForm(
          onChanged: (String val) {
            context.read<RacesDataCubit>().getRacesDataFilter(text: val);
          },
          hint: 'Search Race Name or Country',
          controller: controller,
          isEmptyPref: true);
    },
  );
}
