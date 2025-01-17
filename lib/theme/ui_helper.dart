//  Box Decoration
import 'package:Food/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

BoxDecoration kCustomBoxDecorationWithShadow(
    double radius, Color bgColor, Color borderColor, Color shadowColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
    color: bgColor,
    boxShadow: [
      BoxShadow(
        color: shadowColor.withOpacity(0.1),
        blurRadius: 12,
        offset: const Offset(0, 6),
      )
    ],
  );
}

BoxDecoration kCustomBoxDecoration(
    double radius, Color bgColor, Color borderColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
    color: bgColor,
  );
}

SizedBox heightBox(double height){
  return SizedBox(height: height,);
}
SizedBox widthBox(double width){
  return SizedBox(height: width,);
}

Widget shimmerEffect({double? height, double? width, double radius = 12, EdgeInsetsGeometry? margin}){
  return  Shimmer.fromColors(
    baseColor: lightGreyColor,
    highlightColor: whiteColor,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: kCustomBoxDecoration(radius, whiteColor, whiteColor),
      ),
    );
}