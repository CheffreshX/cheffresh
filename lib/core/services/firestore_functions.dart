import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/models/user/user.dart';
import 'package:cheffresh/locator_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/firebase_constants.dart';
import 'api.dart';

class FirestoreFunctions extends ChangeNotifier {
  final Api _api = locator<Api>();

  List<Reservation> reservations;
  List<Reservation> orders;

  Future<List<Reservation>> fetchOrders() async {
    var result = await _api.getDataCollection(FirestorePaths.RESERVATION_PATH);
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
      updatedReservation.toMap(),
      updatedReservation.id,
      FirestorePaths.RESERVATION_PATH,
    );
    return;
  }

  Stream<QuerySnapshot> fetchReservationsAsStream() {
    return _api.streamDataCollection(FirestorePaths.RESERVATION_PATH);
  }

  Future addReservation(Reservation data) async {
    var result =
        await _api.addDocument(data.toMap(), FirestorePaths.RESERVATION_PATH);
    print(result);
    return;
  }

  Future<bool> addUser(User data, String uid) async {
    await _api.setDocument(data.toMap(), uid, FirestorePaths.USER_PATH);
    return true;
  }
}
