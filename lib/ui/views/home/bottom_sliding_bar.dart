import 'package:cheffresh/ui/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomSlidingBar extends StatelessWidget {
  const BottomSlidingBar({Key key, @required this.body, this.panelController})
      : super(key: key);

  final Widget body;
  final PanelController panelController;

  final BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      backdropEnabled: true,
      borderRadius: radius,
      minHeight: ScreenUtil.screenHeight / 30,
      maxHeight: ScreenUtil.screenHeight / 15,
      panel: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(60)),
        child: Text('Options to reserve'),
      ),
      collapsed: GestureDetector(
          onTap: () => panelController.open(),
          child: _collapsedWidget(context)),
      body: body,
    );
  }

  Container _collapsedWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: GREY_COLOR, borderRadius: radius),
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30.0)),
          child: Row(
            children: <Widget>[
              Text('Reserve'),
            ],
          ),
        ),
      ),
    );
  }
}
