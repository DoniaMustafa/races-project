import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/constant.dart';
import 'package:optomatica_flutter_task/featuers/big_racemate/data/static.dart';
import 'package:optomatica_flutter_task/featuers/layout/presentation/manager/bottom_nav_bar_operation/bottom_nav_bar_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/layout/presentation/widgets/bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: tabBar.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppConstant
            .screens[context.read<BottomNavBarOperationCubit>().selectedIndex],
        bottomNavigationBar: const BuildBottomNavBar());
  }
}
