import 'package:flutter/material.dart';
import 'package:optomatica_flutter_task/featuers/big_racemate/presentation/widgets/build_app_bar.dart';
import 'package:optomatica_flutter_task/featuers/communty_screen.dart';
import 'package:optomatica_flutter_task/featuers/run_screen.dart';
import '../../../races/presentation/pages/races_screen.dart';

class BigRacemateScreen extends StatefulWidget {
  const BigRacemateScreen({super.key});
  static TabController? tabController;

  @override
  State<BigRacemateScreen> createState() => _BigRacemateScreenState();
}

class _BigRacemateScreenState extends State<BigRacemateScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BigRacemateScreen.tabController = TabController(length: 3, vsync: this);
    BigRacemateScreen.tabController!.index=2;
  }
  void dispose() {
    BigRacemateScreen.tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BuildAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: BigRacemateScreen.tabController,
              children: [
                RunScreen(),
                CommuntyScreen(),
                RacesScreen(),
              ],
            ),
          )
        ),
      ],
    );
  }
}
