import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'font_size.dart';

TextStyle _style(
    {FontWeight? fontWeight,
    Color? color,
    double? fontSize,
    String? fontFamily,
    TextDecoration? textDecoration}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      decoration: textDecoration);
}

TextStyle infoTextStyle() {
  return _style(
      fontWeight: FontWeight.bold,
      color: AppColors.FontColorBlack,
      fontSize: FontSize.f11);
}

TextStyle mediumTextStyle() {
  return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      color: AppColors.FontColorBlack,
      fontSize: FontSize.f10);
}

TextStyle smallTextStyle() {
  return _style(
      fontWeight: FontWeight.bold,
      color: AppColors.FontColorBlack,
      fontSize: FontSize.f9);
}

TextStyle BigTextStyle() {
  return _style(
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontSize: FontSize.f20);
}
