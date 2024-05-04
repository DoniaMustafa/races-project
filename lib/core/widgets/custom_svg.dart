import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSVGImage extends StatelessWidget {
  const CustomSVGImage({this.asset, this.color, super.key});
final String? asset;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(
       asset!,color:color ,);
  }
}
