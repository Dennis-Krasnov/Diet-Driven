// GENERATED CODE - DO NOT MODIFY BY HAND

part of food_record;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodRecord> _$foodRecordSerializer = new _$FoodRecordSerializer();

class _$FoodRecordSerializer implements StructuredSerializer<FoodRecord> {
  @override
  final Iterable<Type> types = const [FoodRecord, _$FoodRecord];
  @override
  final String wireName = 'FoodRecord';

  @override
  Iterable serialize(Serializers serializers, FoodRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'foodName',
      serializers.serialize(object.foodName,
          specifiedType: const FullType(String)),
      'uncertainty',
      serializers.serialize(object.uncertainty,
          specifiedType: const FullType(Uncertainty)),
      'grams',
      serializers.serialize(object.grams,
          specifiedType: const FullType(double)),
    ];
    if (object.id != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.edamamId != null) {
      result
        ..add('edamamId')
        ..add(serializers.serialize(object.edamamId,
            specifiedType: const FullType(String)));
    }
    if (object.daysSinceEpoch != null) {
      result
        ..add('daysSinceEpoch')
        ..add(serializers.serialize(object.daysSinceEpoch,
            specifiedType: const FullType(int)));
    }
    if (object.mealSnapshotId != null) {
      result
        ..add('mealSnapshotId')
        ..add(serializers.serialize(object.mealSnapshotId,
            specifiedType: const FullType(String)));
    }
    if (object.mealIndex != null) {
      result
        ..add('mealIndex')
        ..add(serializers.serialize(object.mealIndex,
            specifiedType: const FullType(int)));
    }
    if (object.timestamp != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(object.timestamp,
            specifiedType: const FullType(DateTime)));
    }
    if (object.manufacturer != null) {
      result
        ..add('manufacturer')
        ..add(serializers.serialize(object.manufacturer,
            specifiedType: const FullType(String)));
    }
    if (object.sodium != null) {
      result
        ..add('sodium')
        ..add(serializers.serialize(object.sodium,
            specifiedType: const FullType(double)));
    }

    return result;
  }

  @override
  FoodRecord deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'edamamId':
          result.edamamId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'daysSinceEpoch':
          result.daysSinceEpoch = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'mealSnapshotId':
          result.mealSnapshotId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mealIndex':
          result.mealIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'foodName':
          result.foodName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'manufacturer':
          result.manufacturer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uncertainty':
          result.uncertainty = serializers.deserialize(value,
              specifiedType: const FullType(Uncertainty)) as Uncertainty;
          break;
        case 'grams':
          result.grams = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'sodium':
          result.sodium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodRecord extends FoodRecord {
  @override
  final String id;
  @override
  final String edamamId;
  @override
  final int daysSinceEpoch;
  @override
  final String mealSnapshotId;
  @override
  final int mealIndex;
  @override
  final DateTime timestamp;
  @override
  final String foodName;
  @override
  final String manufacturer;
  @override
  final Uncertainty uncertainty;
  @override
  final double grams;
  @override
  final double sodium;

  factory _$FoodRecord([void updates(FoodRecordBuilder b)]) =>
      (new FoodRecordBuilder()..update(updates)).build();

  _$FoodRecord._(
      {this.id,
      this.edamamId,
      this.daysSinceEpoch,
      this.mealSnapshotId,
      this.mealIndex,
      this.timestamp,
      this.foodName,
      this.manufacturer,
      this.uncertainty,
      this.grams,
      this.sodium})
      : super._() {
    if (foodName == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'foodName');
    }
    if (uncertainty == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'uncertainty');
    }
    if (grams == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'grams');
    }
  }

  @override
  FoodRecord rebuild(void updates(FoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodRecordBuilder toBuilder() => new FoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecord &&
        edamamId == other.edamamId &&
        daysSinceEpoch == other.daysSinceEpoch &&
        mealSnapshotId == other.mealSnapshotId &&
        mealIndex == other.mealIndex &&
        timestamp == other.timestamp &&
        foodName == other.foodName &&
        manufacturer == other.manufacturer &&
        uncertainty == other.uncertainty &&
        grams == other.grams &&
        sodium == other.sodium;
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
                                    $jc($jc(0, edamamId.hashCode),
                                        daysSinceEpoch.hashCode),
                                    mealSnapshotId.hashCode),
                                mealIndex.hashCode),
                            timestamp.hashCode),
                        foodName.hashCode),
                    manufacturer.hashCode),
                uncertainty.hashCode),
            grams.hashCode),
        sodium.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecord')
          ..add('id', id)
          ..add('edamamId', edamamId)
          ..add('daysSinceEpoch', daysSinceEpoch)
          ..add('mealSnapshotId', mealSnapshotId)
          ..add('mealIndex', mealIndex)
          ..add('timestamp', timestamp)
          ..add('foodName', foodName)
          ..add('manufacturer', manufacturer)
          ..add('uncertainty', uncertainty)
          ..add('grams', grams)
          ..add('sodium', sodium))
        .toString();
  }
}

class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  _$FoodRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _edamamId;
  String get edamamId => _$this._edamamId;
  set edamamId(String edamamId) => _$this._edamamId = edamamId;

  int _daysSinceEpoch;
  int get daysSinceEpoch => _$this._daysSinceEpoch;
  set daysSinceEpoch(int daysSinceEpoch) =>
      _$this._daysSinceEpoch = daysSinceEpoch;

  String _mealSnapshotId;
  String get mealSnapshotId => _$this._mealSnapshotId;
  set mealSnapshotId(String mealSnapshotId) =>
      _$this._mealSnapshotId = mealSnapshotId;

  int _mealIndex;
  int get mealIndex => _$this._mealIndex;
  set mealIndex(int mealIndex) => _$this._mealIndex = mealIndex;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  String _foodName;
  String get foodName => _$this._foodName;
  set foodName(String foodName) => _$this._foodName = foodName;

  String _manufacturer;
  String get manufacturer => _$this._manufacturer;
  set manufacturer(String manufacturer) => _$this._manufacturer = manufacturer;

  Uncertainty _uncertainty;
  Uncertainty get uncertainty => _$this._uncertainty;
  set uncertainty(Uncertainty uncertainty) => _$this._uncertainty = uncertainty;

  double _grams;
  double get grams => _$this._grams;
  set grams(double grams) => _$this._grams = grams;

  double _sodium;
  double get sodium => _$this._sodium;
  set sodium(double sodium) => _$this._sodium = sodium;

  FoodRecordBuilder();

  FoodRecordBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _edamamId = _$v.edamamId;
      _daysSinceEpoch = _$v.daysSinceEpoch;
      _mealSnapshotId = _$v.mealSnapshotId;
      _mealIndex = _$v.mealIndex;
      _timestamp = _$v.timestamp;
      _foodName = _$v.foodName;
      _manufacturer = _$v.manufacturer;
      _uncertainty = _$v.uncertainty;
      _grams = _$v.grams;
      _sodium = _$v.sodium;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodRecord;
  }

  @override
  void update(void updates(FoodRecordBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecord build() {
    final _$result = _$v ??
        new _$FoodRecord._(
            id: id,
            edamamId: edamamId,
            daysSinceEpoch: daysSinceEpoch,
            mealSnapshotId: mealSnapshotId,
            mealIndex: mealIndex,
            timestamp: timestamp,
            foodName: foodName,
            manufacturer: manufacturer,
            uncertainty: uncertainty,
            grams: grams,
            sodium: sodium);
    replace(_$result);
    return _$result;
  }
}

class _$FoodRecordDocument extends FoodRecordDocument {
  @override
  final String userId;
  @override
  final String foodRecordId;
  @override
  final StreamSubscription streamSubscription;

  factory _$FoodRecordDocument([void updates(FoodRecordDocumentBuilder b)]) =>
      (new FoodRecordDocumentBuilder()..update(updates)).build();

  _$FoodRecordDocument._(
      {this.userId, this.foodRecordId, this.streamSubscription})
      : super._() {
    if (foodRecordId == null) {
      throw new BuiltValueNullFieldError('FoodRecordDocument', 'foodRecordId');
    }
  }

  @override
  FoodRecordDocument rebuild(void updates(FoodRecordDocumentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodRecordDocumentBuilder toBuilder() =>
      new FoodRecordDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecordDocument &&
        userId == other.userId &&
        foodRecordId == other.foodRecordId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), foodRecordId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecordDocument')
          ..add('userId', userId)
          ..add('foodRecordId', foodRecordId)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class FoodRecordDocumentBuilder
    implements Builder<FoodRecordDocument, FoodRecordDocumentBuilder> {
  _$FoodRecordDocument _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _foodRecordId;
  String get foodRecordId => _$this._foodRecordId;
  set foodRecordId(String foodRecordId) => _$this._foodRecordId = foodRecordId;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  FoodRecordDocumentBuilder();

  FoodRecordDocumentBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _foodRecordId = _$v.foodRecordId;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodRecordDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodRecordDocument;
  }

  @override
  void update(void updates(FoodRecordDocumentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecordDocument build() {
    final _$result = _$v ??
        new _$FoodRecordDocument._(
            userId: userId,
            foodRecordId: foodRecordId,
            streamSubscription: streamSubscription);
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryCollection extends FoodDiaryCollection {
  @override
  final String userId;
  @override
  final StreamSubscription streamSubscription;

  factory _$FoodDiaryCollection([void updates(FoodDiaryCollectionBuilder b)]) =>
      (new FoodDiaryCollectionBuilder()..update(updates)).build();

  _$FoodDiaryCollection._({this.userId, this.streamSubscription}) : super._();

  @override
  FoodDiaryCollection rebuild(void updates(FoodDiaryCollectionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryCollectionBuilder toBuilder() =>
      new FoodDiaryCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryCollection && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryCollection')
          ..add('userId', userId)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class FoodDiaryCollectionBuilder
    implements Builder<FoodDiaryCollection, FoodDiaryCollectionBuilder> {
  _$FoodDiaryCollection _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  FoodDiaryCollectionBuilder();

  FoodDiaryCollectionBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryCollection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryCollection;
  }

  @override
  void update(void updates(FoodDiaryCollectionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryCollection build() {
    final _$result = _$v ??
        new _$FoodDiaryCollection._(
            userId: userId, streamSubscription: streamSubscription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
