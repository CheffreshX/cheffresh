import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/models/user/user.dart';
import 'package:cheffresh/locator_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class FirestoreFunctions extends ChangeNotifier {
  final Api _api = locator<Api>();

  List<Reservation> reservations;
  List<Reservation> orders;

  Future<List<Reservation>> fetchOrders() async {
    var result = await _api.getDataCollection();
    orders = result.documents
        .map((doc) => Reservation.fromMap(doc.data, doc.documentID))
        .toList();
    return orders;
  }

  Stream<QuerySnapshot> fetchReservationsAsStream() {
    return _api.streamDataCollection();
  }

  Future addReservation(Reservation data) async {
    var result = await _api.addDocument(data.toMap());
    print(result);
    return;
  }

  Future addUser(User data) async {
    var result = await _api.addDocument(data.toMap());
    print(result);
    return;
  }
}
