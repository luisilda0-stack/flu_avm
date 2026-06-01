import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final Color electusColor;
  final bool tenebrisModusEst;

  AppTheme({
    this.electusColor = const Color(0xFF546E7A),
    this.tenebrisModusEst = false,
  });

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: electusColor,
    brightness: tenebrisModusEst ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: tenebrisModusEst ? electusColor : electusColor.withAlpha(20),
      centerTitle: false,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.cormorantGaramond(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.cormorantGaramond(fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: GoogleFonts.cormorantGaramond(fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.cormorantGaramond(fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.cormorantGaramond(fontSize: 18),
      titleSmall: GoogleFonts.cormorantGaramond(fontSize: 16),
      bodyLarge: GoogleFonts.sofiaSans(fontSize: 16),
      bodyMedium: GoogleFonts.sofiaSans(fontSize: 14),
      bodySmall: GoogleFonts.sofiaSans(fontSize: 12),
      labelLarge: GoogleFonts.sofiaSans(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}