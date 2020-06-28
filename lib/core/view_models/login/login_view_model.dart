import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';

import '../../../locator_setup.dart';
import '../base_model.dart';

class LoginViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> login({Map<String, dynamic> form}) async {}

  void routeToHome() {
    _navigationService.popAllAndPushNamed(RoutePaths.Home);
  }
}
