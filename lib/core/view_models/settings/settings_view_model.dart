import 'package:cheffresh/core/view_models/base/base_model.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends BaseModel {
  Future<bool> logout(BuildContext context) async {
    setBusy(true);
    //final bool success = await _authService.logout();
    setBusy(false);
    //if (success) {
    //TO DO navigate to login screen
    //} else {
    //TO DO display error message
    //}
    return true;
  }
}
