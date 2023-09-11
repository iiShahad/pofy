import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static const primary = Color(0xff34F5C5);
  static const secondary = Color(0xff2EC6F2);
  static const teritiary = Color(0xff2E4357);
  static const darkerPrimary = Color(0xff21D0B2);
  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFDBDBDB);
  static const text = Color(0xFF878787);
  static const error = Color(0xffEB001B);
  static LinearGradient linearGradient = const LinearGradient(
    colors: [
      secondary,
      primary,
    ],
  );
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
    fontFamily: GoogleFonts.poppins().fontFamily,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.all(10),
      hintStyle: const TextStyle(color: lightGrey),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: lightGrey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondary, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: error, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
