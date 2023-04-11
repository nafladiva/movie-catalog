import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const defaultColor = Color(0xFF0B2447);
  static const primaryColor = Color(0xFFA5D7E8);
  static const orangeColor = Colors.orange;
  static const yellowColor = Colors.yellow;
  static const whiteColor = Colors.white;

  static final myTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: defaultColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
  );
}
