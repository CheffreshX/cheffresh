import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Pill extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Widget widget;

  Pill(this.text,
      {Key key,
      this.color = const Color(0xFFE2E8F0),
      this.textColor = const Color(0xFF4A5568),
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: widget ??
            Text(
              text,
              style:
                  TextStyle(color: textColor, fontSize: ScreenUtil().setSp(12)),
            ));
  }
}
