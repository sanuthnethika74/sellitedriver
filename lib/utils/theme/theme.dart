import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellitedriver/utils/theme/elevated_button_theme.dart';
import 'package:sellitedriver/utils/theme/outlined_button_theme.dart';

class SelliteAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.inter(fontSize: 16),
        bodyText2: GoogleFonts.inter(fontSize: 12),
        caption: GoogleFonts.inter(fontSize: 12),
        headline1: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline2: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
        headline3: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
        headline4: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
        headline5: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        headline6: GoogleFonts.inter(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        overline: GoogleFonts.inter(fontSize: 10),
        subtitle1: GoogleFonts.inter(fontSize: 14),
        subtitle2: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      primarySwatch: const MaterialColor(
        0xFF008cff,
        <int, Color>{
          50: Color(0xFFE1F4FF),
          100: Color(0xFFB3E0FF),
          200: Color(0xFF80C6FF),
          300: Color(0xFF4DAFFA),
          400: Color(0xFF268FFF),
          500: Color(0xFF008cff),
          600: Color(0xFF007BD2),
          700: Color(0xFF006FAE),
          800: Color(0xFF00618B),
          900: Color(0xFF004E6E),
        },
      )

      // bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.green)
      );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: Color(0xFF003765)),
      elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF004E6E),
      ),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.inter(fontSize: 14),
        bodyText2: GoogleFonts.inter(fontSize: 12, color: Colors.white),
        caption: GoogleFonts.inter(fontSize: 12),
        headline1: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
        headline2: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
        headline3: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
        headline4: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        headline5: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
        headline6: GoogleFonts.inter(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        overline: GoogleFonts.inter(fontSize: 10),
        subtitle1: GoogleFonts.inter(fontSize: 14, color: Colors.black),
        subtitle2: GoogleFonts.inter(fontSize: 14),
      ),
      primarySwatch: const MaterialColor(
        0xFF008cff,
        <int, Color>{
          50: Color(0xFFD1E6F7),
          100: Color(0xFFA3CCEC),
          200: Color(0xFF76B3E0),
          300: Color(0xFF4989C7),
          400: Color(0xFF266EB3),
          500: Color(0xFF005299),
          600: Color(0xFF004C8C),
          700: Color(0xFF00427F),
          800: Color(0xFF003875),
          900: Color(0xFF002C64),
        },
      ));
}
