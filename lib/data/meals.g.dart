// GENERATED CODE - DO NOT MODIFY BY HAND

part of meals;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealInfo> _$mealInfoSerializer = new _$MealInfoSerializer();
Serializer<MealsSnapshot> _$mealsSnapshotSerializer =
    new _$MealsSnapshotSerializer();

class _$MealInfoSerializer implements StructuredSerializer<MealInfo> {
  @override
  final Iterable<Type> types = const [MealInfo, _$MealInfo];
  @override
  final String wireName = 'MealInfo';

  @override
  Iterable serialize(Serializers serializers, MealInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'startsAt',
      serializers.serialize(object.startsAt,
          specifiedType: const FullType(Duration)),
      'mealIndex',
      serializers.serialize(object.mealIndex,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MealInfo deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealInfoBuilder();

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
        case 'startsAt':
          result.startsAt = serializers.deserialize(value,
              specifiedType: const FullType(Duration)) as Duration;
          break;
        case 'mealIndex':
          result.mealIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MealsSnapshotSerializer implements StructuredSerializer<MealsSnapshot> {
  @override
  final Iterable<Type> types = const [MealsSnapshot, _$MealsSnapshot];
  @override
  final String wireName = 'MealsSnapshot';

  @override
  Iterable serialize(Serializers serializers, MealsSnapshot object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '_id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'modifiedAt',
      serializers.serialize(object.modifiedAt,
          specifiedType: const FullType(DateTime)),
      'meals',
      serializers.serialize(object.meals,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MealInfo)])),
    ];

    return result;
  }

  @override
  MealsSnapshot deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealsSnapshotBuilder();

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
        case 'modifiedAt':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'meals':
          result.meals = serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(MealInfo)])) as BuiltList;
          break;
      }
    }

    return result.build();
  }
}

class _$MealInfo extends MealInfo {
  @override
  final String name;
  @override
  final Duration startsAt;
  @override
  final int mealIndex;

  factory _$MealInfo([void updates(MealInfoBuilder b)]) =>
      (new MealInfoBuilder()..update(updates)).build();

  _$MealInfo._({this.name, this.startsAt, this.mealIndex}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('MealInfo', 'name');
    }
    if (startsAt == null) {
      throw new BuiltValueNullFieldError('MealInfo', 'startsAt');
    }
    if (mealIndex == null) {
      throw new BuiltValueNullFieldError('MealInfo', 'mealIndex');
    }
  }

  @override
  MealInfo rebuild(void updates(MealInfoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MealInfoBuilder toBuilder() => new MealInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealInfo &&
        name == other.name &&
        startsAt == other.startsAt &&
        mealIndex == other.mealIndex;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), startsAt.hashCode), mealIndex.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MealInfo')
          ..add('name', name)
          ..add('startsAt', startsAt)
          ..add('mealIndex', mealIndex))
        .toString();
  }
}

class MealInfoBuilder implements Builder<MealInfo, MealInfoBuilder> {
  _$MealInfo _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Duration _startsAt;
  Duration get startsAt => _$this._startsAt;
  set startsAt(Duration startsAt) => _$this._startsAt = startsAt;

  int _mealIndex;
  int get mealIndex => _$this._mealIndex;
  set mealIndex(int mealIndex) => _$this._mealIndex = mealIndex;

  MealInfoBuilder();

  MealInfoBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _startsAt = _$v.startsAt;
      _mealIndex = _$v.mealIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MealInfo;
  }

  @override
  void update(void updates(MealInfoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MealInfo build() {
    final _$result = _$v ??
        new _$MealInfo._(name: name, startsAt: startsAt, mealIndex: mealIndex);
    replace(_$result);
    return _$result;
  }
}

class _$MealsSnapshot extends MealsSnapshot {
  @override
  final String id;
  @override
  final DateTime modifiedAt;
  @override
  final BuiltList<MealInfo> meals;

  factory _$MealsSnapshot([void updates(MealsSnapshotBuilder b)]) =>
      (new MealsSnapshotBuilder()..update(updates)).build() as _$MealsSnapshot;

  _$MealsSnapshot._({this.id, this.modifiedAt, this.meals}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('MealsSnapshot', 'id');
    }
    if (modifiedAt == null) {
      throw new BuiltValueNullFieldError('MealsSnapshot', 'modifiedAt');
    }
    if (meals == null) {
      throw new BuiltValueNullFieldError('MealsSnapshot', 'meals');
    }
  }

  @override
  MealsSnapshot rebuild(void updates(MealsSnapshotBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$MealsSnapshotBuilder toBuilder() =>
      new _$MealsSnapshotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealsSnapshot &&
        modifiedAt == other.modifiedAt &&
        meals == other.meals;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, modifiedAt.hashCode), meals.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MealsSnapshot')
          ..add('id', id)
          ..add('modifiedAt', modifiedAt)
          ..add('meals', meals))
        .toString();
  }
}

class _$MealsSnapshotBuilder extends MealsSnapshotBuilder {
  _$MealsSnapshot _$v;

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
  DateTime get modifiedAt {
    _$this;
    return super.modifiedAt;
  }

  @override
  set modifiedAt(DateTime modifiedAt) {
    _$this;
    super.modifiedAt = modifiedAt;
  }

  @override
  BuiltList<MealInfo> get meals {
    _$this;
    return super.meals;
  }

  @override
  set meals(BuiltList<MealInfo> meals) {
    _$this;
    super.meals = meals;
  }

  _$MealsSnapshotBuilder() : super._();

  MealsSnapshotBuilder get _$this {
    if (_$v != null) {
      super.id = _$v.id;
      super.modifiedAt = _$v.modifiedAt;
      super.meals = _$v.meals;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealsSnapshot other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MealsSnapshot;
  }

  @override
  void update(void updates(MealsSnapshotBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MealsSnapshot build() {
    final _$result = _$v ??
        new _$MealsSnapshot._(id: id, modifiedAt: modifiedAt, meals: meals);
    replace(_$result);
    return _$result;
  }
}

class _$MealSnapshotCollection extends MealSnapshotCollection {
  @override
  final String userId;
  @override
  final StreamSubscription streamSubscription;

  factory _$MealSnapshotCollection(
          [void updates(MealSnapshotCollectionBuilder b)]) =>
      (new MealSnapshotCollectionBuilder()..update(updates)).build();

  _$MealSnapshotCollection._({this.userId, this.streamSubscription})
      : super._();

  @override
  MealSnapshotCollection rebuild(
          void updates(MealSnapshotCollectionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MealSnapshotCollectionBuilder toBuilder() =>
      new MealSnapshotCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealSnapshotCollection && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MealSnapshotCollection')
          ..add('userId', userId)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class MealSnapshotCollectionBuilder
    implements Builder<MealSnapshotCollection, MealSnapshotCollectionBuilder> {
  _$MealSnapshotCollection _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  MealSnapshotCollectionBuilder();

  MealSnapshotCollectionBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealSnapshotCollection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MealSnapshotCollection;
  }

  @override
  void update(void updates(MealSnapshotCollectionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MealSnapshotCollection build() {
    final _$result = _$v ??
        new _$MealSnapshotCollection._(
            userId: userId, streamSubscription: streamSubscription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
