import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_svg.dart';
import 'package:optomatica_flutter_task/featuers/layout/data/models/static_model.dart';
import 'package:optomatica_flutter_task/featuers/layout/presentation/manager/bottom_nav_bar_operation/bottom_nav_bar_operation_cubit.dart';

class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 81,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          border: Border.all(color: AppColors.lightGray)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navbar.length, (index) => buildItem(index)),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 134,
            height: 5,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )
        ],
      ),
    );
  }

  Widget buildItem(int index) =>
      BlocBuilder<BottomNavBarOperationCubit, BottomNavBarOperationState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () =>
                context.read<BottomNavBarOperationCubit>().changeIndex(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSVGImage(
                  asset: navbar[index].icon!,
                  color: index == 2
                      ? null
                      : context
                                  .read<BottomNavBarOperationCubit>()
                                  .selectedIndex ==
                              index
                          ? AppColors.primaryColor
                          : AppColors.hintPrimaryColor,
                ),
                SizedBox(
                  height: 4,
                ),
                if (navbar[index].title != '')
                  Text(
                    navbar[index].title!,
                    style: getMediumStyle(
                      color: context
                                  .read<BottomNavBarOperationCubit>()
                                  .selectedIndex ==
                              index
                          ? AppColors.primaryColor
                          : AppColors.hintPrimaryColor,
                      letterSpacing: 1.5,
                    ),
                  ),
              ],
            ),
          );
        },
      );
}
