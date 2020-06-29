import 'package:cheffresh/core/models/reservation/reservation.dart';
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

  Future reserveOrder(Reservation reservation, String uid) async {
    Function(ReservationBuilder p1) updates;

    if (reservation.reservedCount == reservation.totalCount - 1) {
      updates = (ReservationBuilder b) => b
        ..reservedCount = reservation.totalCount
        ..isFull = true;
    } else {
      var newCount = reservation.reservedCount + 1;
      updates = (ReservationBuilder b) => b..reservedCount = newCount;
    }

    var updatedReservation = reservation.rebuild(updates);
    await _api.updateDocument(
        updatedReservation.toMap(), updatedReservation.id);
    return;
  }

  Stream<QuerySnapshot> fetchReservationsAsStream() {
    return _api.streamDataCollection();
  }

  Future addReservation(Reservation data) async {
    var result = await _api.addDocument(data.toMap());
    print(result);
    return;
  }
}
