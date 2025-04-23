import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
    ).copyWith(
      secondary:
          darkBlueishColor, // এখানেই FloatingActionButton এর রঙ সেট
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(
          backgroundColor: darkBlueishColor,
          foregroundColor: Colors.white,
        ),

    cardColor: Colors.white,
    canvasColor: creamColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,

      primarySwatch: Colors.deepPurple,
    ).copyWith(
      secondary: lightBlueishColor,
      // এখানেই FloatingActionButton এর রঙ সেট
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(
          backgroundColor: lightBlueishColor,
          foregroundColor: Colors.white,
        ),

    cardColor: Colors.black,
    canvasColor: darkcreamColor,

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBlueishColor = Color(0xff403b58);
  static Color lightBlueishColor = Vx.indigo500;
}
