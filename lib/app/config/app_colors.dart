import 'package:flutter/material.dart';

class AppColors {
  static Color BackgroundColor = HexColor("#F2F7FF");
  static Color BorderColore = Colors.black12;
  static Color FontColorBlack = HexColor("#474749");
  static Color IconColor = HexColor("#7652DC");

  static Color BorderInputColor = HexColor("#707070");
  static Color BorderInputColorlogin = HexColor("#FFEA58");

  static Color CercleBlue = HexColor("#0000FF");
  static Color CerclePink =HexColor("#FF4DCF");


  Color contColor = HexColor("#fec8bd");
  static Color white = Colors.white;
  static Color textColor = Colors.black;
  static Color primaryColor = HexColor("#0000FF");
  static Color secondryColor = HexColor("#FF8751");
  static Color yellowColor = HexColor("##FFEA58");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
