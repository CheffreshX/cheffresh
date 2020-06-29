import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pedantic/pedantic.dart';

import '../../../locator_setup.dart';

class SplashViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> onReady() async {
    setBusy(true);
    var user = await FirebaseAuth.instance.currentUser();
    if (user != null && user.displayName != null) {
      setBusy(false);
      unawaited(_navigationService.popAllAndPushNamed(RoutePaths.Home));
    } else {
      setBusy(false);
      unawaited(_navigationService.popAllAndPushNamed(RoutePaths.Login));
    }
  }
}
