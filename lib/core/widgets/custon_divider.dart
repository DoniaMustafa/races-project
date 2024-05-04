import 'package:flutter/material.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {super.key, this.width, this.height, this.color});
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 120),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color:color??AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
