import 'package:cheffresh/core/constants/api_constants.dart';
import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../locator_setup.dart';

class SettingsViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<bool> logout() async {
    setBusy(true);
    await FirebaseAuth.instance.signOut();
    final pref = await SharedPreferences.getInstance();
    await pref.remove(CUSTOMER_ID);
    setBusy(false);
    unawaited(_navigationService.popAllAndPushNamed(RoutePaths.Login));
    return true;
  }
}
