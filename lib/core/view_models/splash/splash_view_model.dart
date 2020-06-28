import 'package:cheffresh/core/constants/api_constants.dart';
import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../locator_setup.dart';

class SplashViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> onReady() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.containsKey(CUSTOMER_ID)) {
      await Future.delayed(Duration(seconds: 3)).whenComplete(() =>
          unawaited(_navigationService.popAllAndPushNamed(RoutePaths.Home)));
    } else {
      unawaited(_navigationService.popAllAndPushNamed(RoutePaths.Login));
    }
  }
}
