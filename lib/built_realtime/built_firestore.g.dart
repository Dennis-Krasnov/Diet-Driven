// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_firestore;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class FSBuilder<T> {
  void replace(FS<T> other);
  void update(void updates(FSBuilder<T> b));
  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);

  Observable<T> get snapshotObservable;
  set snapshotObservable(Observable<T> snapshotObservable);
}

abstract class FSDocumentBuilder<T> {
  void replace(FSDocument<T> other);
  void update(void updates(FSDocumentBuilder<T> b));
  DocumentReference get docRef;
  set docRef(DocumentReference docRef);

  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);
}

abstract class FSCollectionBuilder<T> {
  void replace(FSCollection<T> other);
  void update(void updates(FSCollectionBuilder<T> b));
  CollectionReference get colRef;
  set colRef(CollectionReference colRef);

  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);
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
    if (userId == null) {
      throw new BuiltValueNullFieldError('FoodRecordDocument', 'userId');
    }
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

  _$FoodDiaryCollection._({this.userId, this.streamSubscription}) : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('FoodDiaryCollection', 'userId');
    }
  }

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

class _$MealSnapshotCollection extends MealSnapshotCollection {
  @override
  final String userId;
  @override
  final StreamSubscription streamSubscription;

  factory _$MealSnapshotCollection(
          [void updates(MealSnapshotCollectionBuilder b)]) =>
      (new MealSnapshotCollectionBuilder()..update(updates)).build();

  _$MealSnapshotCollection._({this.userId, this.streamSubscription})
      : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('MealSnapshotCollection', 'userId');
    }
  }

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
