import 'package:coffee_machine_flutter/shared/style/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// light theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.openSansTextTheme().apply(
    bodyColor: pLightTextColor,
    displayColor: pLightTextColor,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: pLightColor,
    titleTextStyle: TextStyle(
      color: pAppBarTextColor,
    ),
  ),
  iconTheme: IconThemeData(
    color: sIconColor,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(pLightColor),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: pLightButtonForegroundColor,
      side: BorderSide(
        color: sIconColor,
      ),
    ),
  ),
  scaffoldBackgroundColor: pLightScaffoldBackgroundColor,
);
