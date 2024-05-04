import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_font.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/widgets/custon_divider.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';

class BuildBottomSheetStableWidget extends StatelessWidget {
  const BuildBottomSheetStableWidget({
    super.key,
    this.title,
    this.isSubTitle = true,
    this.suffixOnTap,
    this.onChanged,
    this.subTitle,
    this.subTitleOnTap,
    this.index,
    this.isReset = false,
  });
  final String? title;
  final String? subTitle;
  final bool? isSubTitle;
  final int? index;
  final bool? isReset;
  final Function(String)? onChanged;
  final void Function()? suffixOnTap;

  final void Function()? subTitleOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 11,
        ),
        CustomDivider(
          color: AppColors.borderGray,
          width: 80,
          height: 3,
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: EdgeInsets.only(
              right:  28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: index == 3
                        ? 140
                        : context
                                .read<FilterOperationCubit>()
                                .selectedFilterLabel
                                .isNotEmpty
                            ? 0
                            : 115),
                child: Text(
                  title!.toUpperCase(),
                  style: getBoldStyle(
                      fontSize: 22,
                      color: AppColors.secoundPrimaryColor,
                      fontFamily: FontFamilies.oswaldFamily),
                  textAlign: TextAlign.center,
                ),
              ),
              if (isSubTitle!)
                const Spacer(
                  flex: 1,
                ),
              if (isSubTitle!)
                GestureDetector(
                  onTap: subTitleOnTap,
                  child: Text(
                    subTitle!.toUpperCase(),
                    style: getBoldStyle(
                      fontSize: 14,
                      color: isReset!
                          ? AppColors.brown
                          : AppColors.brown.withOpacity(0.3),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
