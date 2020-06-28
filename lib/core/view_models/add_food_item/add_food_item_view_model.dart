import 'dart:io';

import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';

import '../../../locator_setup.dart';

class AddFoodItemViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> addFoodItem(
      {Map<String, dynamic> form,
      List<File> foodItemImages,
      List<dynamic> foodTags}) async {}

  void routeToHome() {
    _navigationService.popAllAndPushNamed(RoutePaths.Home);
  }
}
