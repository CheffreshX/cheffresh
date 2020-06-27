import 'package:cheffresh/ui/shared/styles.dart';
import 'package:flutter/material.dart';

AppBar defaultAppBar({String title, VoidCallback onPressed, List<Widget> actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: onPressed == null
        ? null
        : BackButton(
            onPressed: onPressed,
          ),
    title: Text(
      title,
      style: appBarTextStyle,
    ),
    actions: actions,
  );
}
