import 'package:flutter/material.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_assets.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_color.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_style.dart';
import 'package:optomatica_flutter_task/core/widgets/custom_svg.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      this.hint,
      this.controller,
      this.isEmptyIcon = false,
      this.suffixOnTap,  this.onTap,
      this.isEmptyPref = false,
      this.prefixIcon,
      this.onChanged});
  final String? hint;
  final bool isEmptyIcon;
  final bool isEmptyPref;
  final String? prefixIcon;
  final Function(String)? onChanged;
  final void Function()? suffixOnTap;
  final TextEditingController? controller;
  final void Function()?   onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(onTap: onTap,
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        style:
            getRegularStyle(fontSize: 16, color: AppColors.primaryColor),
        onChanged: onChanged,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2,
                  color: controller!.text.isNotEmpty
                      ? AppColors.yellow
                      : AppColors.borderGray,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                gapPadding: 20,
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.yellow,
                )),
            hintText: hint,
            hintStyle: getRegularStyle(
              fontSize: 16,
            ),
            prefixIconConstraints: isEmptyPref
                ? null
                : BoxConstraints(maxHeight: 25, maxWidth: 25),
            prefixIcon: isEmptyPref
                ? null
                : Align(
                    alignment: Alignment.center,
                    child: CustomSVGImage(asset: prefixIcon!)),
            suffixIconConstraints: isEmptyIcon
                ? null
                : BoxConstraints(
                    maxHeight: 50,
                    maxWidth: controller!.text.isNotEmpty ? 30 : 40),
            suffixIcon: isEmptyIcon
                ? null
                : GestureDetector(
                    onTap: suffixOnTap,
                    child: Padding(
                      padding: EdgeInsets.only(right: 18),
                      child: controller!.text.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.brown, width: 2)),
                              child: Icon(
                                Icons.close,
                                color: AppColors.brown,
                                size: 18,
                              ),
                            )
                          : const SizedBox(
                              height: 25,
                              width: 25,
                              child: CustomSVGImage(asset: AppAssets.search)),
                    ),
                  )),
      ),
    );
  }
}
