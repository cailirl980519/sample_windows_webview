import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class myTheme {
  static Color primaryColor = HexColor("#FF9933");
  static Color secondaryColor = HexColor("#FDB750");
  static TextStyle headline1 = GoogleFonts.gaegu(
    fontWeight: FontWeight.w600,
    fontSize: 36,
  );
  static TextTheme textTheme = TextTheme().copyWith(
    headline1: headline1,
  );
}

ThemeData myThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: myTheme.primaryColor,
    secondaryHeaderColor: myTheme.secondaryColor,
    textTheme: myTheme.textTheme,
  );
}
