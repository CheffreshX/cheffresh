import 'package:cheffresh/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

Widget buildRaisedButton(
    {@required String text, @required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: RaisedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(13)),
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
      color: ACCENT_COLOR,
      textColor: CONTRAST_COLOR,
      shape: roundedShape,
    ),
  );
}
