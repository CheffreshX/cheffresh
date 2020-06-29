// GENERATED CODE - DO NOT MODIFY BY HAND

part of reservation;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Reservation> _$reservationSerializer = new _$ReservationSerializer();

class _$ReservationSerializer implements StructuredSerializer<Reservation> {
  @override
  final Iterable<Type> types = const [Reservation, _$Reservation];
  @override
  final String wireName = 'Reservation';

  @override
  Iterable<Object> serialize(Serializers serializers, Reservation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.dateCreated != null) {
      result
        ..add('date_created')
        ..add(serializers.serialize(object.dateCreated,
            specifiedType: const FullType(String)));
    }
    if (object.pickupTime != null) {
      result
        ..add('pickup_time')
        ..add(serializers.serialize(object.pickupTime,
            specifiedType: const FullType(String)));
    }
    if (object.isFull != null) {
      result
        ..add('isFull')
        ..add(serializers.serialize(object.isFull,
            specifiedType: const FullType(bool)));
    }
    if (object.totalCount != null) {
      result
        ..add('total_count')
        ..add(serializers.serialize(object.totalCount,
            specifiedType: const FullType(int)));
    }
    if (object.reservedCount != null) {
      result..add('reserved_count')..add(
          serializers.serialize(object.reservedCount,
              specifiedType: const FullType(int)));
    }
    if (object.location != null) {
      result..add('location')..add(serializers.serialize(object.location,
          specifiedType: const FullType(GeoPoint)));
    }
    if (object.rating != null) {
      result..add('rating')..add(serializers.serialize(object.rating,
          specifiedType: const FullType(double)));
    }
    if (object.mealName != null) {
      result..add('meal_name')..add(serializers.serialize(object.mealName,
          specifiedType: const FullType(String)));
    }
    if (object.category != null) {
      result..add('category')..add(serializers.serialize(object.category,
          specifiedType: const FullType(String)));
    }
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.details != null) {
      result..add('details')..add(serializers.serialize(object.details,
          specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result..add('id')..add(serializers.serialize(object.id,
          specifiedType: const FullType(String)));
    }
    if (object.price != null) {
      result..add('price')..add(serializers.serialize(object.price,
          specifiedType: const FullType(double)));
    }
    if (object.createBy != null) {
      result..add('created_by')..add(serializers.serialize(object.createBy,
          specifiedType: const FullType(User)));
    }
    if (object.pictures != null) {
      result..add('pictures')..add(serializers.serialize(object.pictures,
          specifiedType:
          const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.reviews != null) {
      result..add('reviews')..add(serializers.serialize(object.reviews,
          specifiedType:
          const FullType(BuiltList, const [const FullType(Review)])));
    }
    return result;
  }

  @override
  Reservation deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date_created':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pickup_time':
          result.pickupTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isFull':
          result.isFull = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'total_count':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'reserved_count':
          result.reservedCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(GeoPoint)) as GeoPoint;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'meal_name':
          result.mealName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
              specifiedType:
              const FullType(BuiltList, const [const FullType(String)]))
          as BuiltList<Object>);
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'created_by':
          result.createBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'pictures':
          result.pictures.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Review)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Reservation extends Reservation {
  @override
  final String dateCreated;
  @override
  final String pickupTime;
  @override
  final bool isFull;
  @override
  final int totalCount;
  @override
  final int reservedCount;
  @override
  final GeoPoint location;
  @override
  final double rating;
  @override
  final String mealName;
  @override
  final String category;
  @override
  final BuiltList<String> tags;
  @override
  final String details;
  @override
  final String id;
  @override
  final double price;
  @override
  final User createBy;
  @override
  final BuiltList<String> pictures;
  @override
  final BuiltList<Review> reviews;

  factory _$Reservation([void Function(ReservationBuilder) updates]) =>
      (new ReservationBuilder()
        ..update(updates)).build();

  _$Reservation._({this.dateCreated,
    this.pickupTime,
    this.isFull,
    this.totalCount,
    this.reservedCount,
    this.location,
    this.rating,
    this.mealName,
    this.category,
    this.tags,
    this.details,
    this.id,
    this.price,
    this.createBy,
    this.pictures,
    this.reviews})
      : super._();

  @override
  Reservation rebuild(void Function(ReservationBuilder) updates) =>
      (toBuilder()
        ..update(updates)).build();

  @override
  ReservationBuilder toBuilder() =>
      new ReservationBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reservation &&
        dateCreated == other.dateCreated &&
        pickupTime == other.pickupTime &&
        isFull == other.isFull &&
        totalCount == other.totalCount &&
        reservedCount == other.reservedCount &&
        location == other.location &&
        rating == other.rating &&
        mealName == other.mealName &&
        category == other.category &&
        tags == other.tags &&
        details == other.details &&
        id == other.id &&
        price == other.price &&
        createBy == other.createBy &&
        pictures == other.pictures &&
        reviews == other.reviews;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    dateCreated
                                                                        .hashCode),
                                                                pickupTime
                                                                    .hashCode),
                                                            isFull.hashCode),
                                                        totalCount.hashCode),
                                                    reservedCount.hashCode),
                                                location.hashCode),
                                            rating.hashCode),
                                        mealName.hashCode),
                                    category.hashCode),
                                tags.hashCode),
                            details.hashCode),
                        id.hashCode),
                    price.hashCode),
                createBy.hashCode),
            pictures.hashCode),
        reviews.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Reservation')
      ..add('dateCreated', dateCreated)..add('pickupTime', pickupTime)..add(
          'isFull', isFull)..add('totalCount', totalCount)..add(
          'reservedCount', reservedCount)..add('location', location)..add(
          'rating', rating)..add('mealName', mealName)..add(
          'category', category)..add('tags', tags)..add(
          'details', details)..add('id', id)..add('price', price)..add(
          'createBy', createBy)..add('pictures', pictures)..add(
          'reviews', reviews))
        .toString();
  }
}

class ReservationBuilder implements Builder<Reservation, ReservationBuilder> {
  _$Reservation _$v;

  String _dateCreated;
  String get dateCreated => _$this._dateCreated;
  set dateCreated(String dateCreated) => _$this._dateCreated = dateCreated;

  String _pickupTime;
  String get pickupTime => _$this._pickupTime;
  set pickupTime(String pickupTime) => _$this._pickupTime = pickupTime;

  bool _isFull;
  bool get isFull => _$this._isFull;
  set isFull(bool isFull) => _$this._isFull = isFull;

  int _totalCount;
  int get totalCount => _$this._totalCount;

  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  int _reservedCount;

  int get reservedCount => _$this._reservedCount;

  set reservedCount(int reservedCount) => _$this._reservedCount = reservedCount;

  GeoPoint _location;

  GeoPoint get location => _$this._location;

  set location(GeoPoint location) => _$this._location = location;

  double _rating;

  double get rating => _$this._rating;

  set rating(double rating) => _$this._rating = rating;

  String _mealName;

  String get mealName => _$this._mealName;

  set mealName(String mealName) => _$this._mealName = mealName;

  String _category;

  String get category => _$this._category;

  set category(String category) => _$this._category = category;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  String _details;
  String get details => _$this._details;
  set details(String details) => _$this._details = details;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  UserBuilder _createBy;
  UserBuilder get createBy => _$this._createBy ??= new UserBuilder();
  set createBy(UserBuilder createBy) => _$this._createBy = createBy;

  ListBuilder<String> _pictures;
  ListBuilder<String> get pictures =>
      _$this._pictures ??= new ListBuilder<String>();
  set pictures(ListBuilder<String> pictures) => _$this._pictures = pictures;

  ListBuilder<Review> _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review> reviews) => _$this._reviews = reviews;

  ReservationBuilder();

  ReservationBuilder get _$this {
    if (_$v != null) {
      _dateCreated = _$v.dateCreated;
      _pickupTime = _$v.pickupTime;
      _isFull = _$v.isFull;
      _totalCount = _$v.totalCount;
      _reservedCount = _$v.reservedCount;
      _location = _$v.location;
      _rating = _$v.rating;
      _mealName = _$v.mealName;
      _category = _$v.category;
      _tags = _$v.tags?.toBuilder();
      _details = _$v.details;
      _id = _$v.id;
      _price = _$v.price;
      _createBy = _$v.createBy?.toBuilder();
      _pictures = _$v.pictures?.toBuilder();
      _reviews = _$v.reviews?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reservation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Reservation;
  }

  @override
  void update(void Function(ReservationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Reservation build() {
    _$Reservation _$result;
    try {
      _$result = _$v ??
          new _$Reservation._(
              dateCreated: dateCreated,
              pickupTime: pickupTime,
              isFull: isFull,
              totalCount: totalCount,
              reservedCount: reservedCount,
              location: location,
              rating: rating,
              mealName: mealName,
              category: category,
              tags: _tags?.build(),
              details: details,
              id: id,
              price: price,
              createBy: _createBy?.build(),
              pictures: _pictures?.build(),
              reviews: _reviews?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();

        _$failedField = 'createBy';
        _createBy?.build();
        _$failedField = 'pictures';
        _pictures?.build();
        _$failedField = 'reviews';
        _reviews?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Reservation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
