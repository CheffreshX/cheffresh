// GENERATED CODE - DO NOT MODIFY BY HAND

part of review;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Review> _$reviewSerializer = new _$ReviewSerializer();

class _$ReviewSerializer implements StructuredSerializer<Review> {
  @override
  final Iterable<Type> types = const [Review, _$Review];
  @override
  final String wireName = 'Review';

  @override
  Iterable<Object> serialize(Serializers serializers, Review object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.dateCreated != null) {
      result
        ..add('date_created')
        ..add(serializers.serialize(object.dateCreated,
            specifiedType: const FullType(String)));
    }
    if (object.reviewText != null) {
      result
        ..add('review_text')
        ..add(serializers.serialize(object.reviewText,
            specifiedType: const FullType(String)));
    }
    if (object.rating != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(object.rating,
            specifiedType: const FullType(double)));
    }
    if (object.createdBy != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(object.createdBy,
            specifiedType: const FullType(User)));
    }
    if (object.createdFor != null) {
      result
        ..add('created_for')
        ..add(serializers.serialize(object.createdFor,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  Review deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewBuilder();

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
        case 'review_text':
          result.reviewText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'created_by':
          result.createdBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'created_for':
          result.createdFor.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
      }
    }

    return result.build();
  }
}

class _$Review extends Review {
  @override
  final String dateCreated;
  @override
  final String reviewText;
  @override
  final double rating;
  @override
  final User createdBy;
  @override
  final User createdFor;

  factory _$Review([void Function(ReviewBuilder) updates]) =>
      (new ReviewBuilder()..update(updates)).build();

  _$Review._(
      {this.dateCreated,
      this.reviewText,
      this.rating,
      this.createdBy,
      this.createdFor})
      : super._();

  @override
  Review rebuild(void Function(ReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBuilder toBuilder() => new ReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Review &&
        dateCreated == other.dateCreated &&
        reviewText == other.reviewText &&
        rating == other.rating &&
        createdBy == other.createdBy &&
        createdFor == other.createdFor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, dateCreated.hashCode), reviewText.hashCode),
                rating.hashCode),
            createdBy.hashCode),
        createdFor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Review')
          ..add('dateCreated', dateCreated)
          ..add('reviewText', reviewText)
          ..add('rating', rating)
          ..add('createdBy', createdBy)
          ..add('createdFor', createdFor))
        .toString();
  }
}

class ReviewBuilder implements Builder<Review, ReviewBuilder> {
  _$Review _$v;

  String _dateCreated;
  String get dateCreated => _$this._dateCreated;
  set dateCreated(String dateCreated) => _$this._dateCreated = dateCreated;

  String _reviewText;
  String get reviewText => _$this._reviewText;
  set reviewText(String reviewText) => _$this._reviewText = reviewText;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  UserBuilder _createdBy;
  UserBuilder get createdBy => _$this._createdBy ??= new UserBuilder();
  set createdBy(UserBuilder createdBy) => _$this._createdBy = createdBy;

  UserBuilder _createdFor;
  UserBuilder get createdFor => _$this._createdFor ??= new UserBuilder();
  set createdFor(UserBuilder createdFor) => _$this._createdFor = createdFor;

  ReviewBuilder();

  ReviewBuilder get _$this {
    if (_$v != null) {
      _dateCreated = _$v.dateCreated;
      _reviewText = _$v.reviewText;
      _rating = _$v.rating;
      _createdBy = _$v.createdBy?.toBuilder();
      _createdFor = _$v.createdFor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Review other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Review;
  }

  @override
  void update(void Function(ReviewBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Review build() {
    _$Review _$result;
    try {
      _$result = _$v ??
          new _$Review._(
              dateCreated: dateCreated,
              reviewText: reviewText,
              rating: rating,
              createdBy: _createdBy?.build(),
              createdFor: _createdFor?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'createdBy';
        _createdBy?.build();
        _$failedField = 'createdFor';
        _createdFor?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Review', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
