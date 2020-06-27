import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: CONTRAST_COLOR,
  primaryColor: CONTRAST_COLOR,
  primarySwatch: Colors.lightGreen,
  dividerColor: GREY_COLOR,
  backgroundColor: CONTRAST_COLOR,
  accentColor: ACCENT_COLOR,
  iconTheme: const IconThemeData(color: DARK_COLOR),
  textTheme: GoogleFonts.poppinsTextTheme(),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: barrierColor),
  inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        gapPadding: 10,
        borderSide: BorderSide(color: ACCENT_COLOR),
      ),
      focusedBorder: OutlineInputBorder(
        gapPadding: 10,
        borderSide: BorderSide(color: ACCENT_COLOR),
      ),
      focusColor: ACCENT_COLOR),
);
