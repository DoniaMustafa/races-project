import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/core/widgets/bottom_sheet_widget.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_botton.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_text_form.dart';
import 'package:optomatica_flutter_task/core/widgets/custon_divider.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildDateBottomSheetWidgets extends StatefulWidget {
  BuildDateBottomSheetWidgets({super.key});

  @override
  State<BuildDateBottomSheetWidgets> createState() =>
      _BuildDateBottomSheetWidgetsState();
}

class _BuildDateBottomSheetWidgetsState
    extends State<BuildDateBottomSheetWidgets> {
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fromDate.text = 'Mon, Oct 10, 2022';
    toDate.text = 'Mon, Oct 10, 2022';
  }
  bool isSelect=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildBottomSheetStableWidget(
          subTitle: 'Reset',
          title: 'Race Date',
          index: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        _buildDate(text: 'From', controller: fromDate),
        const SizedBox(
          height: 16,
        ),
        _buildDate(text: 'To', controller: toDate),
        SizedBox(
          height: 40,
        ),
        CustomButton(onPressed: () {
           isSelect=true;
          // setState(() {
          //
          // });
          context
        .read<FilterOperationCubit>()
        .changeFilterSelectColor(AppConstant.title[3],isSelect);
        },),
        Spacer(),
        CustomDivider(
          width: 134,
          height: 5,
        ),
      ],
    );
  }

  Widget _buildDate(
          {String? text,
          TextEditingController? controller,
          VoidCallback? onTap}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text!,
              style:
                  getRegularStyle(fontSize: 16, color: AppColors.primaryColor),
            ),
            CustomTextForm(
              onTap: () => calendarPicker(),
              isEmptyIcon: true,
              controller: controller, prefixIcon: AppAssets.clender,
              // hint: ,
            ),
          ],
        ),
      );
  void calendarPicker() async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
  }
}
