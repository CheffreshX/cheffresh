import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:pedantic/pedantic.dart';

import '../../../locator_setup.dart';
import '../base/base_model.dart';

class SplashViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> onReady() async {
    Future.delayed(Duration(seconds: 3)).whenComplete(() =>
        unawaited(_navigationService.popAllAndPushNamed(RoutePaths.Home)));
  }
}
