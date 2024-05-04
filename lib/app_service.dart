import 'package:flutter/material.dart';

class AppService{
  AppService._();


  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  static get getContext => navigatorKey.currentState?.context;


}