import 'package:flutter/material.dart';
import 'package:optomatica_flutter_task/core/utils/app_config/app_font.dart';

TextStyle getRegularStyle(
    {String? fontFamily = FontFamilies.robotoFamily,
    Color? color,
    double fontSize = 12.0,
    double? letterSpacing}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontWeight: FontWeight.w400,
  );
}

TextStyle getMediumStyle({
  double? fontSize = 12,
  Color? color,
  double? letterSpacing,
  // FontStyle? fontStyle,
  String? fontFamily = FontFamilies.robotoFamily,
  // double? wordSpacing,
  // TextDecoration? decoration,
  // TextDecorationStyle? textDecorationStyle,
  // TextBaseline? textBaseline,
  // Color? decorationColor,
  // Color? backgroundColor,
  double? height,
}) =>
    TextStyle(
        height: height,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500);
TextStyle getBoldStyle(
        {String? fontFamily = FontFamilies.robotoFamily,
        Color? color,
        double fontSize = 12.0,
        double? letterSpacing,
        FontWeight fontWeight = FontWeight.w700}) =>
    TextStyle(
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        fontWeight: fontWeight);
