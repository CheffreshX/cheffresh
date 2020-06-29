import 'dart:async';
import 'dart:io';

import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/services/navigation/navigation_service.dart';
import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
    setBusy(true);
    var urls = await _uploadFiles(foodItemImages);
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
      ..pictures.addAll(urls)
      ..price = double.parse(form['price']));

    //save this to firebase!
    setBusy(false);
    print(reservation);
  }

  Future<List<String>> _uploadFiles(List<File> files) async {
    var urls = <String>[];
    for (var i = 0; i < files.length; i++) {
      var storageReference =
          FirebaseStorage().ref().child('multiple2/${files[i].toString()}');

      var uploadTask = storageReference.putFile(files[i]);

      var streamSubscription = uploadTask.events.listen((event) {
        print('EVENT ${event.type}');
      });

      await uploadTask.onComplete;
      await streamSubscription.cancel();

      String url = await storageReference.getDownloadURL();
      urls.add(url); //all all the urls to the list
    }
    return urls;
  }

  void routeToHome() {
    _navigationService.popAllAndPushNamed(RoutePaths.Home);
  }
}
