import 'package:coffee_machine_flutter/shared/style/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// light theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
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
    color: pIconColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: pLightButtonForegroundColor,
      side: const BorderSide(
        color: Colors.brown
      )
    ),
  ),
  scaffoldBackgroundColor: pLightScaffoldBackgroundColor,
);
