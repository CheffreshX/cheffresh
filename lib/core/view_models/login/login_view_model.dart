import 'package:cheffresh/core/constants/firebase_constants.dart';
import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:cheffresh/ui/shared/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../locator_setup.dart';

class LoginViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();
  String smsVerificationCode = '';

  Future<void> verify(String phone) async {
    final _auth = FirebaseAuth.instance;
    setBusy(true);
    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) =>
            _verificationComplete(authCredential),
        verificationFailed: (authException) =>
            _verificationFailed(authException),
        codeAutoRetrievalTimeout: (verificationId) =>
            _codeAutoRetrievalTimeout(verificationId),
        codeSent: (verificationId, [code]) =>
            _smsCodeSent(verificationId, [code]));
  }

  void _verificationComplete(AuthCredential authCredential) {
    setBusy(false);
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) {
      saveUserId(authResult.user.uid);

      if (authResult.additionalUserInfo.isNewUser) {
        //TO-DO Navigate to sign up screen to fill data: Picture/Name/Location
        //register
      } else {
        _navigationService.popAllAndPushNamed(RoutePaths.Home);
      }
    });
  }

  Future<void> saveUserId(String id) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString(FIREBASE_ID, id);
  }

  Future<bool> smsCodeDialog() {
    return showDialog(
        context: Get.overlayContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Enter sms Code'),
            content: CupertinoTextField(
              onChanged: (value) {
                smsVerificationCode = value;
              },
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    FirebaseAuth.instance.currentUser().then((user) {
                      if (user != null) {
                        _navigationService.popAllAndPushNamed(RoutePaths.Home);
                      } else {
                        _navigationService.pop();
                      }
                    });
                  },
                  child: Text('OK')),
              CupertinoDialogAction(
                  isDefaultAction: false,
                  onPressed: () {
                    Navigator.pop(Get.overlayContext);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }

  void _smsCodeSent(String verificationId, List<int> code) {
    setBusy(false);
    smsVerificationCode = verificationId;
    smsCodeDialog();
  }

  void _verificationFailed(AuthException authException) {
    setBusy(false);
    displayDialog('Error!!' + authException.message.toString());
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    print('Phone authentication timed out');
    setBusy(false);
    smsVerificationCode = verificationId;
  }
}
