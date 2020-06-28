library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'serializers.g.dart';

@SerializersFor([User, GeoPoint, Reservation])
final Serializers serializers = _$serializers;

final standardSerializers = (serializers.toBuilder()
//..add(DateTimeSerializer())
      ..add(GeoPointSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

class GeoPointSerializer implements PrimitiveSerializer<GeoPoint> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([GeoPoint]);
  @override
  final String wireName = 'GeoPoint';

  @override
  Object serialize(Serializers serializers, GeoPoint geoPoint,
      {FullType specifiedType = FullType.unspecified}) {
    return geoPoint;
  }

  @override
  GeoPoint deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return serialized as GeoPoint;
  }
}
