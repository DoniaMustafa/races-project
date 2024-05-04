import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:optomatica_flutter_task/app_service.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_font.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_text_form.dart';

class AppHelper {
  AppHelper._();

  static void bottomSheet({Widget? child,double? height}) =>
      showModalBottomSheet(isScrollControlled: true,
          useSafeArea: true,
          context: AppService.getContext,
          builder: (context) => Container(
            height:height ,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: child),);
///////////////////////////////////////////////////////

  static String distancesString='';

  static List<String> convertDistances(String distanceString) {
    // Split the string into individual distances
    List<String> rawDistances = distanceString.split(",");

    // Convert each raw distance to a double and format with units (always "K")
    return rawDistances.map((distance)  {
    double parsedDistance = double.parse(distance);
    distancesString=formatDistance(parsedDistance);
    print('distancesString >>>>> $distancesString');
        return formatDistance(parsedDistance);
  }).toList();
  }

  static String formatDistance(double distance) {
    // Convert distance to thousands (even if less than 1000) and format with one decimal place
    return "${distance / 1000.0}K";
  }
////////////////////////////////////////////////
  static  String formattedDate='';
  static convertDate(String rawDate){
    int year = int.parse(rawDate.substring(0, 4));
    int month = int.parse(rawDate.substring(4, 6));
    int day = int.parse(rawDate.substring(6, 8));

    DateTime date = DateTime(year, month, day);

    DateFormat formatter = DateFormat('d MMMM, yyyy'); // 'd' for day without leading zero, 'MMMM' for full month name
    formattedDate = formatter.format(date);
    print(formattedDate);
    return formattedDate;


  }


}
