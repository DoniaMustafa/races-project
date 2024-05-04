import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/app_service.dart';
import 'package:optomatica_flutter_task/featuers/layout/presentation/manager/bottom_nav_bar_operation/bottom_nav_bar_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/layout/presentation/pages/layout_screen.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/races_data/races_data_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/search_location/search_location_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarOperationCubit(),
        ),

        BlocProvider(
          create: (context) => SearchLocationCubit(),
        ),

        BlocProvider(
          create: (context) => FilterOperationCubit(),
        ),
        BlocProvider(create: (context) => RacesDataCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: AppService.navigatorKey,
        theme: ThemeData(
            // unselectedWidgetColor: Colors.red, // <-- your color
            ),
        home: BlocBuilder<BottomNavBarOperationCubit, BottomNavBarOperationState>(
          builder: (context, state) {
            return LayoutScreen();
          },
        ),
      ),
    );
  }
}
