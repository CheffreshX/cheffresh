library review;

import 'dart:convert';
import 'dart:core';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cheffresh/core/models/user/user.dart';

import '../serializers.dart';

part 'review.g.dart';

abstract class Review implements Built<Review, ReviewBuilder> {
  factory Review([Function(ReviewBuilder b) updates]) = _$Review;

  Review._();

  @nullable
  @BuiltValueField(wireName: 'date_created')
  String get dateCreated;

  @nullable
  @BuiltValueField(wireName: 'review_text')
  String get reviewText;

  @nullable
  double get rating;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  User get createdBy;

  @nullable
  @BuiltValueField(wireName: 'created_for')
  User get createdFor;

  String toJson() {
    return json.encode(serializers.serializeWith(Review.serializer, this));
  }

  static Review fromJson(String jsonString) {
    return serializers.deserializeWith(
        Review.serializer, json.decode(jsonString));
  }

  static Serializer<Review> get serializer => _$reviewSerializer;
}
