import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Colors.white;
Color secondaryColor = Colors.black;

TextStyle myNewFontWhite = GoogleFonts.pressStart2p(
  textStyle: TextStyle(
    letterSpacing: 3,
    fontSize: 15,
  ),
  color: primaryColor,
);
TextStyle myNewFontBlack = GoogleFonts.pressStart2p(
  textStyle: TextStyle(
    letterSpacing: 3,
    fontSize: 15,
  ),
  color: secondaryColor,
);
