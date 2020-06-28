import 'package:cheffresh/ui/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void displayDialog(String error) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  showDialog(
      context: Get.overlayContext,
      child: CupertinoAlertDialog(
        title: Text(
          error,
          style: dialogMessageTextStyle,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(Get.overlayContext);
              },
              child: Text('OK')),
        ],
      ));
}


