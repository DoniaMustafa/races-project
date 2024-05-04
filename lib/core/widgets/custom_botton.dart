import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.onPressed,
      super.key,
      this.title = 'Done',
      this.isBorder = false,
      this.style,
      this.color});
  final void Function()? onPressed;
  final String title;
  bool isBorder;
  final TextStyle? style;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          autofocus: true,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.yellow,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: isBorder
                    ? BorderSide(color: AppColors.primaryColor)
                    : BorderSide.none),
            fixedSize: Size.fromWidth(double.infinity),
            maximumSize: Size.fromWidth(double.infinity),
            shadowColor: Colors.transparent,
          ),

          // shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(8)),
          //     side: isBorder
          //         ? BorderSide(color: AppColors.primaryColor)
          //         : BorderSide.none)),
          // backgroundColor:
          //     MaterialStateProperty.all(color ?? AppColors.yellow),
          // fixedSize:
          //     MaterialStateProperty.all(Size.fromWidth(double.infinity)),
          // maximumSize:
          //     MaterialStateProperty.all(Size.fromWidth(double.infinity))),
          onPressed: onPressed,
          child: Text(
            title,
            style: style ??
                getBoldStyle(fontSize: 14, color: AppColors.primaryColor),
          )),
    );
  }
}
