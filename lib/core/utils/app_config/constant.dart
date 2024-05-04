import 'package:flutter/material.dart';
import 'package:optomatica_flutter_task/featuers/big_racemate/presentation/pages/big_racemate_screen.dart';
import 'package:optomatica_flutter_task/featuers/explore_screen.dart';
import 'package:optomatica_flutter_task/featuers/home_screen.dart';
import 'package:optomatica_flutter_task/featuers/me_screen.dart';
import 'package:optomatica_flutter_task/featuers/train_screen.dart';

class AppConstant {
  AppConstant._();

  static List<Widget> screens = [
    HomeScreen(),
    TrainScreen(),
    BigRacemateScreen(),
    ExploreScreen(),
    MeScreen()
  ];
  static List<String> title = ["Type", "Location", "Distance", "Date"];

  static List<String> countries = [
    'Near my location',
    'Egypt (3)',
    'France (7)',
    'Germany (9)',
    'Greece (4)',
    'Italy (9)',
    'Kuwait (2)',
  ];
  static List<String> types = [
    'Real-time event',
    'Virtual ',
    'All',
    ];
}
