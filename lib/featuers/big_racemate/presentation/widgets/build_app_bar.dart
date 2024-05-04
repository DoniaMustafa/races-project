import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_svg.dart';
import 'package:optomatica_flutter_task/featuers/big_racemate/data/static.dart';
import 'package:optomatica_flutter_task/featuers/big_racemate/presentation/pages/big_racemate_screen.dart';

class BuildAppBar extends StatefulWidget {
  const BuildAppBar({super.key});

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar>{


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      backgroundColor: AppColors.primaryColor,
      flexibleSpace: buildFlexibleSpace,
      expandedHeight: 156,
      bottom: buildTabBar,
    );
  }

  FlexibleSpaceBar get buildFlexibleSpace => FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.header,
              height: 57,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 14.5),
              child: Row(
                children: [
                  CustomSVGImage(
                    asset: AppAssets.logo,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  CustomSVGImage(
                    asset: AppAssets.notify,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CustomSVGImage(
                    asset: AppAssets.about,
                  ),
                ],
              ),
            )
          ],
        ),
      );

  TabBar get buildTabBar => TabBar(
        controller: BigRacemateScreen.tabController,
        indicatorColor: AppColors.yellow,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 5,
        tabs: List.generate(
            tabBar.length,
            (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    tabBar[index].toUpperCase(),
                    textScaler: TextScaler.linear(1),
                    style: getBoldStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: AppColors.white),
                  ),
                )),
      );
}
