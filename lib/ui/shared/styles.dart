import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//===== TextStyles =====
TextStyle defaultTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(24),
        fontWeight: FontWeight.w500,
        color: DARK_COLOR,
        letterSpacing: 0.0));

TextStyle appBarTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: FontWeight.w500,
        color: Colors.green,
        letterSpacing: 0.0));

TextStyle smallHeaderTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: DARK_COLOR,
        letterSpacing: 0.0));

TextStyle smallAccentHeaderTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: ACCENT_COLOR,
        letterSpacing: 0.0));

TextStyle smallGreyHeaderTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        fontStyle: FontStyle.italic,
        color: GREY_COLOR,
        letterSpacing: 0.0));

TextStyle boldSubtitleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w500,
        color: DARK_COLOR,
        letterSpacing: 0.0));

TextStyle alertMessageTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w600,
        color: CONTRAST_COLOR,
        letterSpacing: 0.0));

TextStyle dialogMessageTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0));

TextStyle alertTitleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        color: CONTRAST_COLOR,
        letterSpacing: 0.0));

TextStyle forgetPasswordTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        color: RED_COLOR,
        decorationThickness: 1.5,
        letterSpacing: 0.0));

TextStyle smallTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        fontWeight: FontWeight.w500,
        color: DARK_COLOR,
        letterSpacing: 0.0));

TextStyle textButtonTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: FontWeight.w500,
        color: ACCENT_COLOR,
        letterSpacing: 0.0));

TextStyle buttonTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w700,
    letterSpacing: 0.0);

TextStyle languageSwitchTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w500,
        color: CONTRAST_COLOR,
        letterSpacing: 0.0));

//===== Shapes =====
RoundedRectangleBorder roundedShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60.0),
    side: const BorderSide(color: Color(0xFF38A169)));
