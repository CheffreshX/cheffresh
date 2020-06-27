import 'package:cheffresh/ui/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'colors.dart';

void showNoInternetConnectionSnackbar() {
  if (!Get.isSnackbarOpen) {
    Get.rawSnackbar(
        messageText: Text(
          'No internet connection',
          style: alertMessageTextStyle,
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
        margin: EdgeInsets.zero,
        backgroundColor: ALERT_COLOR,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 5));
  }
}

void showSnackbar(String text) {
  if (!Get.isSnackbarOpen) {
    Get.rawSnackbar(
        messageText: Text(
          text,
          style: alertMessageTextStyle,
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
        margin: EdgeInsets.zero,
        backgroundColor: ALERT_COLOR,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 5));
  }
}
