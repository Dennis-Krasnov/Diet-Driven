// GENERATED CODE - DO NOT MODIFY BY HAND

part of food;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodDiaryDay> _$foodDiaryDaySerializer =
    new _$FoodDiaryDaySerializer();
Serializer<FoodRecord> _$foodRecordSerializer = new _$FoodRecordSerializer();

class _$FoodDiaryDaySerializer implements StructuredSerializer<FoodDiaryDay> {
  @override
  final Iterable<Type> types = const [FoodDiaryDay, _$FoodDiaryDay];
  @override
  final String wireName = 'FoodDiaryDay';

  @override
  Iterable serialize(Serializers serializers, FoodDiaryDay object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '_id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'appertainingMealsSnapshotId',
      serializers.serialize(object.appertainingMealsSnapshotId,
          specifiedType: const FullType(String)),
      'foodRecords',
      serializers.serialize(object.foodRecords,
          specifiedType:
              const FullType(BuiltList, const [const FullType(FoodRecord)])),
    ];

    return result;
  }

  @override
  FoodDiaryDay deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodDiaryDayBuilder();

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
        case 'appertainingMealsSnapshotId':
          result.appertainingMealsSnapshotId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foodRecords':
          result.foodRecords = serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(FoodRecord)])) as BuiltList;
          break;
      }
    }

    return result.build();
  }
}

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
    if (object.edamamId != null) {
      result
        ..add('edamamId')
        ..add(serializers.serialize(object.edamamId,
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
        case 'edamamId':
          result.edamamId = serializers.deserialize(value,
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

class _$FoodDiaryDay extends FoodDiaryDay {
  @override
  final String id;
  @override
  final String appertainingMealsSnapshotId;
  @override
  final BuiltList<FoodRecord> foodRecords;

  factory _$FoodDiaryDay([void updates(FoodDiaryDayBuilder b)]) =>
      (new FoodDiaryDayBuilder()..update(updates)).build() as _$FoodDiaryDay;

  _$FoodDiaryDay._(
      {this.id, this.appertainingMealsSnapshotId, this.foodRecords})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDay', 'id');
    }
    if (appertainingMealsSnapshotId == null) {
      throw new BuiltValueNullFieldError(
          'FoodDiaryDay', 'appertainingMealsSnapshotId');
    }
    if (foodRecords == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDay', 'foodRecords');
    }
  }

  @override
  FoodDiaryDay rebuild(void updates(FoodDiaryDayBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$FoodDiaryDayBuilder toBuilder() =>
      new _$FoodDiaryDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryDay &&
        appertainingMealsSnapshotId == other.appertainingMealsSnapshotId &&
        foodRecords == other.foodRecords;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(0, appertainingMealsSnapshotId.hashCode), foodRecords.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryDay')
          ..add('id', id)
          ..add('appertainingMealsSnapshotId', appertainingMealsSnapshotId)
          ..add('foodRecords', foodRecords))
        .toString();
  }
}

class _$FoodDiaryDayBuilder extends FoodDiaryDayBuilder {
  _$FoodDiaryDay _$v;

  @override
  String get id {
    _$this;
    return super.id;
  }

  @override
  set id(String id) {
    _$this;
    super.id = id;
  }

  @override
  String get appertainingMealsSnapshotId {
    _$this;
    return super.appertainingMealsSnapshotId;
  }

  @override
  set appertainingMealsSnapshotId(String appertainingMealsSnapshotId) {
    _$this;
    super.appertainingMealsSnapshotId = appertainingMealsSnapshotId;
  }

  @override
  BuiltList<FoodRecord> get foodRecords {
    _$this;
    return super.foodRecords;
  }

  @override
  set foodRecords(BuiltList<FoodRecord> foodRecords) {
    _$this;
    super.foodRecords = foodRecords;
  }

  _$FoodDiaryDayBuilder() : super._();

  FoodDiaryDayBuilder get _$this {
    if (_$v != null) {
      super.id = _$v.id;
      super.appertainingMealsSnapshotId = _$v.appertainingMealsSnapshotId;
      super.foodRecords = _$v.foodRecords;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryDay other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryDay;
  }

  @override
  void update(void updates(FoodDiaryDayBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryDay build() {
    final _$result = _$v ??
        new _$FoodDiaryDay._(
            id: id,
            appertainingMealsSnapshotId: appertainingMealsSnapshotId,
            foodRecords: foodRecords);
    replace(_$result);
    return _$result;
  }
}

class _$FoodRecord extends FoodRecord {
  @override
  final String id;
  @override
  final String edamamId;
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
        id == other.id &&
        edamamId == other.edamamId &&
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
                            $jc($jc($jc(0, id.hashCode), edamamId.hashCode),
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

class _$FoodDiaryDayDocument extends FoodDiaryDayDocument {
  @override
  final String userId;
  @override
  final String daysSinceEpoch;
  @override
  final StreamSubscription streamSubscription;

  factory _$FoodDiaryDayDocument(
          [void updates(FoodDiaryDayDocumentBuilder b)]) =>
      (new FoodDiaryDayDocumentBuilder()..update(updates)).build();

  _$FoodDiaryDayDocument._(
      {this.userId, this.daysSinceEpoch, this.streamSubscription})
      : super._() {
    if (daysSinceEpoch == null) {
      throw new BuiltValueNullFieldError(
          'FoodDiaryDayDocument', 'daysSinceEpoch');
    }
  }

  @override
  FoodDiaryDayDocument rebuild(void updates(FoodDiaryDayDocumentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryDayDocumentBuilder toBuilder() =>
      new FoodDiaryDayDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryDayDocument &&
        userId == other.userId &&
        daysSinceEpoch == other.daysSinceEpoch;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), daysSinceEpoch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryDayDocument')
          ..add('userId', userId)
          ..add('daysSinceEpoch', daysSinceEpoch)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class FoodDiaryDayDocumentBuilder
    implements Builder<FoodDiaryDayDocument, FoodDiaryDayDocumentBuilder> {
  _$FoodDiaryDayDocument _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _daysSinceEpoch;
  String get daysSinceEpoch => _$this._daysSinceEpoch;
  set daysSinceEpoch(String daysSinceEpoch) =>
      _$this._daysSinceEpoch = daysSinceEpoch;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  FoodDiaryDayDocumentBuilder();

  FoodDiaryDayDocumentBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _daysSinceEpoch = _$v.daysSinceEpoch;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryDayDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryDayDocument;
  }

  @override
  void update(void updates(FoodDiaryDayDocumentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryDayDocument build() {
    final _$result = _$v ??
        new _$FoodDiaryDayDocument._(
            userId: userId,
            daysSinceEpoch: daysSinceEpoch,
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
