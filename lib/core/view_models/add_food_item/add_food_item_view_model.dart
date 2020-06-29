import 'dart:io';

import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../locator_setup.dart';

class AddFoodItemViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> addFoodItem({
    Map<String, dynamic> form,
    List<File> foodItemImages,
    GeoPoint location,
  }) async {
    //Step #1: TO-DO upload images to fire storage
    //and get List<String> Urls
    //List<String> urls;

    var reservation = Reservation((ReservationBuilder b) => b
      //..pictures = urls
      //..createBy = Provider.of<User>(context)
      ..location = location
      ..category = form['category']
      ..dateCreated = DateTime.now().toIso8601String()
      ..details = form['details']
      ..mealName = form['meal_name']
      ..pickupTime = form['pickupTime']
      ..reservedCount = 0
      ..tags.addAll(List<String>.from(form['food_tags']))
      ..price = double.parse(form['price']));

    //save this to firebase!
    print(reservation);
  }

  void routeToHome() {
    _navigationService.popAllAndPushNamed(RoutePaths.Home);
  }
}
