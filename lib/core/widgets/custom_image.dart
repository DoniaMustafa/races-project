import 'package:flutter/cupertino.dart';

class CustomImage extends StatelessWidget {
  CustomImage({
    super.key,
    required this.asset,
    this.isRadius = false,
    this.width,
    this.height,
  });
  final String asset;
  final double? width;
  final double? height;
  bool isRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      height: height ?? null,
      decoration: BoxDecoration(
        borderRadius: isRadius
            ? const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
            : null,
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
