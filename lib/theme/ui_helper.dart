//  Box Decoration
import 'package:flutter/cupertino.dart';

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