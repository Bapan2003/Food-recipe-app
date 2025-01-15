
import 'package:flutter/material.dart';

///   Text Style

TextStyle kTextStyleCustomColor(Color color, double size, bool isBold,
    {bool? isUnderline, bool? cairo}) {
  var underline = false;
  if (isUnderline != null) {
    underline = isUnderline;
  }
  return TextStyle(
    fontSize: size,
    fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
    color: color,
    fontFamily: cairo != null ? 'Cairo' : 'Poppins',
    decoration: underline ? TextDecoration.underline : null,
    decorationColor: color,
  );
}

TextStyle kTextStyleColor800(Color color, double size, bool isBold,
    {bool? isUnderline, bool? cairo}) {
  var underline = false;
  if (isUnderline != null) {
    underline = isUnderline;
  }
  return TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.w800 : FontWeight.w400,
      color: color,
      fontFamily: cairo != null ? 'Cairo' : 'Poppins',
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle kTextStyleColor600(Color color, double size, bool isBold,
    {bool? isUnderline, bool? cairo}) {
  var underline = false;
  if (isUnderline != null) {
    underline = isUnderline;
  }
  return TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
      color: color,
      fontFamily: cairo != null ? 'Cairo' : 'Poppins',
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle kTextStyleColor500(Color color, double size, bool isBold,
    {bool? isUnderline, bool? cairo}) {
  var underline = false;
  if (isUnderline != null) {
    underline = isUnderline;
  }
  return TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
      color: color,
      fontFamily: cairo != null ? 'Cairo' : 'Poppins',
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle kTextStyleColor700(Color color, double size, bool isBold,
    {bool? isUnderline, bool? cairo}) {
  var underline = false;
  if (isUnderline != null) {
    underline = isUnderline;
  }
  return TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
      color: color,
      fontFamily: cairo != null ? 'Cairo' : 'Poppins',
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle kTextStyleCustomSemiBold(Color color, double size, {bool? cairo}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: color,
    fontFamily: cairo != null ? 'Cairo' : 'Poppins',
  );
}

TextStyle kTextStyleCustomSubText(Color color, double size, bool isBold,
    {bool? cairo}) {
  return TextStyle(
    color: color,
    fontWeight: isBold ? FontWeight.w600 : FontWeight.w300,
    fontSize: size,
    fontFamily: cairo != null ? 'Cairo' : 'Poppins',
  );
}