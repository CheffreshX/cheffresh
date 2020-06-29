// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.dateCreated != null) {
      result
        ..add('date_created')
        ..add(serializers.serialize(object.dateCreated,
            specifiedType: const FullType(String)));
    }
    if (object.image != null) {
      result..add('image')..add(serializers.serialize(object.image,
          specifiedType: const FullType(String)));
    }
    if (object.healthCertificate != null) {
      result..add('health_certificate')..add(
          serializers.serialize(object.healthCertificate,
              specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result..add('phone')..add(serializers.serialize(object.phone,
          specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result..add('address')..add(serializers.serialize(object.address,
          specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(GeoPoint)));
    }
    if (object.reservations != null) {
      result
        ..add('reservations')
        ..add(serializers.serialize(object.reservations,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.reservations_created != null) {
      result
        ..add('reservations_created')
        ..add(serializers.serialize(object.reservations_created,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_created':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'health_certificate':
          result.healthCertificate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(GeoPoint)) as GeoPoint;
          break;
        case 'reservations':
          result.reservations.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'reservations_created':
          result.reservations_created.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String name;
  @override
  final String dateCreated;
  @override
  final String image;
  @override
  final String healthCertificate;
  @override
  final String phone;
  @override
  final String address;
  @override
  final GeoPoint location;
  @override
  final BuiltList<String> reservations;
  @override
  final BuiltList<String> reservations_created;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.name,
      this.dateCreated,
      this.image,
      this.healthCertificate,
      this.phone,
      this.address,
      this.location,
      this.reservations,
      this.reservations_created})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        name == other.name &&
        dateCreated == other.dateCreated &&
        image == other.image &&
        healthCertificate == other.healthCertificate &&
        phone == other.phone &&
        address == other.address &&
        location == other.location &&
        reservations == other.reservations &&
        reservations_created == other.reservations_created;
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
                                $jc($jc(0, name.hashCode),
                                    dateCreated.hashCode),
                                image.hashCode),
                            healthCertificate.hashCode),
                        phone.hashCode),
                    address.hashCode),
                location.hashCode),
            reservations.hashCode),
        reservations_created.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
      ..add('name', name)..add('dateCreated', dateCreated)..add(
          'image', image)..add('healthCertificate', healthCertificate)..add(
          'phone', phone)..add('address', address)..add(
          'location', location)..add('reservations', reservations)..add(
          'reservations_created', reservations_created))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _dateCreated;
  String get dateCreated => _$this._dateCreated;
  set dateCreated(String dateCreated) => _$this._dateCreated = dateCreated;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _healthCertificate;
  String get healthCertificate => _$this._healthCertificate;
  set healthCertificate(String healthCertificate) =>
      _$this._healthCertificate = healthCertificate;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  GeoPoint _location;
  GeoPoint get location => _$this._location;
  set location(GeoPoint location) => _$this._location = location;

  ListBuilder<String> _reservations;
  ListBuilder<String> get reservations =>
      _$this._reservations ??= new ListBuilder<String>();
  set reservations(ListBuilder<String> reservations) =>
      _$this._reservations = reservations;

  ListBuilder<String> _reservations_created;
  ListBuilder<String> get reservations_created =>
      _$this._reservations_created ??= new ListBuilder<String>();
  set reservations_created(ListBuilder<String> reservations_created) =>
      _$this._reservations_created = reservations_created;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _dateCreated = _$v.dateCreated;
      _image = _$v.image;
      _healthCertificate = _$v.healthCertificate;
      _phone = _$v.phone;
      _address = _$v.address;
      _location = _$v.location;
      _reservations = _$v.reservations?.toBuilder();
      _reservations_created = _$v.reservations_created?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              name: name,
              dateCreated: dateCreated,
              image: image,
              healthCertificate: healthCertificate,
              phone: phone,
              address: address,
              location: location,
              reservations: _reservations?.build(),
              reservations_created: _reservations_created?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'reservations';
        _reservations?.build();
        _$failedField = 'reservations_created';
        _reservations_created?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
