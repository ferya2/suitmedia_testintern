import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suitmedia/style/colors.dart';

class TextStyleApp {
  static TextStyle textFieldStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsApp.hintText,
  );
  static TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorsApp.white,
  );
  static TextStyle appbarTextStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorsApp.black,
  );
  static TextStyle welcomeTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );
  static TextStyle namaTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsApp.black,
  );
  static TextStyle subTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: ColorsApp.sub,
  );
  static TextStyle selectednameTextStyle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorsApp.black,
  );
}
