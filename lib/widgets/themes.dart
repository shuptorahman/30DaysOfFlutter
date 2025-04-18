import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(color: Colors.white),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData get darkTheme =>
      ThemeData(brightness: Brightness.dark);

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlueishColor = Color(0xff403b58);
}
