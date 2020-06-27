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
        color: DARK_GREY_COLOR,
        letterSpacing: 0.0));

TextStyle smallHeaderTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: DARK_COLOR,
        letterSpacing: 0.0));

TextStyle smallGreenHeaderTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: GREEN_STATUS_COLOR,
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

TextStyle boldBlueSubtitleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w400,
        color: BLUE_STATUS_COLOR,
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

TextStyle tankTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        fontWeight: FontWeight.bold,
        color: TANK_TEXT_COLOR,
        shadows: <Shadow>[
          Shadow(
            // bottomLeft
            offset: Offset(-1, -1),
            color: TANK_TEXT_SHADOW_COLOR,
          ),
          Shadow(
            // bottomRight
            offset: Offset(1, -1),
            blurRadius: 1,
            color: TANK_TEXT_SHADOW_COLOR,
          ),
          Shadow(
            // topRight
            offset: Offset(1, 1),
            color: TANK_TEXT_SHADOW_COLOR,
          ),
          Shadow(
            // topLeft
            offset: Offset(-1, 1),
            color: TANK_TEXT_SHADOW_COLOR,
          ),
        ],
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
    borderRadius: BorderRadius.circular(5.0),
    side: const BorderSide(color: ACCENT_COLOR));
