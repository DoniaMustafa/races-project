import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/core/widgets/bottom_sheet_widget.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_botton.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_text_form.dart';
import 'package:optomatica_flutter_task/core/widgets/custon_divider.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/search_location/search_location_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/widgets/location_bottom_sheet/build_countre_checkbox_item.dart';

class BuildLocationBottomSheetWidgets extends StatelessWidget {
  BuildLocationBottomSheetWidgets({super.key});
  TextEditingController controller = TextEditingController();
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildBottomSheetStableWidget(
          title: 'Race location',
          subTitle: 'Reset',
          subTitleOnTap: () {
            context.read<FilterOperationCubit>().clearList();
          },
        ),
        buildForm(context),
        buildCountriesMenu(context),
        CustomButton(
          onPressed: () {
            isSelect = true;
            context
                .read<FilterOperationCubit>()
                .changeFilterSelectColor(AppConstant.title[1], isSelect);
          },
        ),
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

  Widget buildForm(context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<SearchLocationCubit, SearchLocationState>(
          builder: (context, state) {
            return CustomTextForm(
              hint: 'Search',
              isEmptyPref: true,
              suffixOnTap: () {
                controller.clear();
                context.read<SearchLocationCubit>().searchForListCountries('');
              },
              onChanged: (String text) {
                context
                    .read<SearchLocationCubit>()
                    .searchForListCountries(text);
              },
              controller: controller,
            );
          },
        ),
      );
  Widget buildCountriesMenu(context) =>
      BlocBuilder<SearchLocationCubit, SearchLocationState>(
        builder: (context, state) {
          return Column(
            children: List.generate(
                context.read<SearchLocationCubit>().resultCountry.length,
                (index) => BuildCountriesCheckBoxItem(
                      title: context
                          .read<SearchLocationCubit>()
                          .resultCountry[index],
                      index: index,
                    )),
          );
        },
      );
}
