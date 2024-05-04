import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';

class BottomNavBarModel {
  String? title;
  String? icon;

  BottomNavBarModel({this.title, this.icon});
}

List<BottomNavBarModel> navbar = [
  BottomNavBarModel(title: 'Home', icon: AppAssets.home),
  BottomNavBarModel(title: 'Train', icon:  AppAssets.train),
  BottomNavBarModel(title: '', icon:  AppAssets.bigRacemate),
  BottomNavBarModel(title: 'Explore', icon:  AppAssets.explore),
  BottomNavBarModel(title: 'Me', icon:  AppAssets.me),
];
