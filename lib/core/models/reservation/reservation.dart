library reservation;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cheffresh/core/models/review/review.dart';
import 'package:cheffresh/core/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../serializers.dart';

part 'reservation.g.dart';

abstract class Reservation implements Built<Reservation, ReservationBuilder> {
  factory Reservation([Function(ReservationBuilder b) updates]) = _$Reservation;

  Reservation._();

  @nullable
  @BuiltValueField(wireName: 'date_created')
  String get dateCreated;

  @nullable
  bool get isFull;

  @nullable
  @BuiltValueField(wireName: 'total_count')
  int get totalCount;

  @nullable
  @BuiltValueField(wireName: 'reserved_count')
  int get reservedCount;

  @nullable
  GeoPoint get location;

  @nullable
  @BuiltValueField(wireName: 'meal_name')
  String get mealName;

  @nullable
  String get category;

  @nullable
  BuiltList<String> get tags;

  @nullable
  BuiltList<String> get details;

  @nullable
  double get price;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  User get createBy;

  @nullable
  BuiltList<String> get pictures;

  @nullable
  BuiltList<Review> get reviews;

  String toJson() {
    return json.encode(serializers.serializeWith(Reservation.serializer, this));
  }

  static Reservation fromJson(String jsonString) {
    return serializers.deserializeWith(
        Reservation.serializer, json.decode(jsonString));
  }

  static Serializer<Reservation> get serializer => _$reservationSerializer;
}
