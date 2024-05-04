import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/utils/helper/app_helper.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_image.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_svg.dart';
import 'package:optomatica_flutter_task/featuers/races/data/models/races_model.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/operation/filter_operation_cubit.dart';
import 'package:optomatica_flutter_task/featuers/races/presentation/manager/races_data/races_data_cubit.dart';

class BuildRacesScreen extends StatefulWidget {
  const BuildRacesScreen({super.key});

  @override
  State<BuildRacesScreen> createState() => _BuildRacesScreenState();
}

class _BuildRacesScreenState extends State<BuildRacesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RacesDataCubit>().getRaceData();
    });
    super.initState();
  }
  List<String> formattedDistances=[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RacesDataCubit, RacesDataState>(
      builder: (context, state) {
        return ListView.separated(
            padding: EdgeInsets.only(top: 24),
            itemBuilder: (context, index) {
              AppHelper.convertDate(
                  context.read<RacesDataCubit>().list[index].date!);
               formattedDistances = AppHelper.convertDistances(
                  context.read<RacesDataCubit>().list[index].distances!);
              return buildItem(
                  index, context, context.read<RacesDataCubit>().list[index]);
            },
            separatorBuilder: (context, i) => SizedBox(
                  height: 24,
                ),
            itemCount: context.read<RacesDataCubit>().list.length);
      },
    );
  }

  buildItem(int index, context, RacesResponseModel model) => Container(
        padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: index == 0 || index == 1 || index == 2
                ? AppColors.regularGrayColor
                : AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFCDD3E4), // Black with 75% opacity
                offset: Offset(0, 4), // Offset the shadow down by 4 pixels
                blurRadius: 10.0,
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              asset: '${AppAssets.png}/${model.image}',
              height: MediaQuery.of(context).size.height / 4,
              width: 117,
              isRadius: true,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // if( index == 0 || index == 1 || index == 2)
                SizedBox(
                  height: 6.5,
                ),
                if (index == 0 || index == 1 || index == 2)
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: index == 0
                        ? AppColors.yellow
                        : index == 1
                            ? AppColors.primaryColor
                            : AppColors.hintPrimaryColor,
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.star,
                          color: AppColors.white,
                          size: 15,
                        )),
                  ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  model.name!,
                  style: getBoldStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColors.deepPrimaryColor),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Organized by',
                  style: getMediumStyle(
                      height: 1,
                      fontSize: 14,
                      color: AppColors.hintPrimaryColor),
                  // maxLines: 1,
                ),
                Text(
                  model.organizer ?? 'No organizer',
                  style: getMediumStyle(fontSize: 14, color: AppColors.brown),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          buildDetailsItem(AppAssets.direction,'${model.distances!.replaceAll(',', 'k\, ')}K'),
                          BlocBuilder<FilterOperationCubit,
                              FilterOperationState>(
                            builder: (context, state) {
                              return buildDetailsItem(
                                  AppAssets.calendar, AppHelper.formattedDate);
                            },
                          ),
                          buildDetailsItem(AppAssets.location,
                              '${model.city!},${model.country!}')
                        ],
                      ),
                    ),
                    CustomSVGImage(
                      asset: AppAssets.share,
                    )
                  ],
                ),
              ],
            )),
          ],
        ),
      );

  buildDetailsItem(String asset, String info, {bool? isDic = false}) => Row(
        children: [
          CustomSVGImage(
            asset: asset,
          ),
          SizedBox(
            width: 5,
          ),
          // if (isDic!=true)
          Expanded(
            flex: 6,
            child: AutoSizeText(
              info, maxLines: 1,
              style:
                  getMediumStyle(fontSize: 14, color: AppColors.primaryColor),
              textScaleFactor: 1,
              // maxLines: 1,
            ),
          ),
          // if (isDic!)
          //   Row(
          //     children: List.generate(
          //         AppHelper.distancesString.split('0.0').length,
          //         (index) =>
          //             Text(formattedDistances[index].split(',').join('K,').split('0.0').join(' '))),
          //   )
        ],
      );
}
