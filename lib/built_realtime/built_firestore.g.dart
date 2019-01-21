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

  ListBuilder<int> get listeners;
  set listeners(ListBuilder<int> listeners);
}

abstract class FSDocumentBuilder<T> {
  void replace(FSDocument<T> other);
  void update(void updates(FSDocumentBuilder<T> b));
  DocumentReference get docRef;
  set docRef(DocumentReference docRef);

  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);

  ListBuilder<int> get listeners;
  set listeners(ListBuilder<int> listeners);
}

abstract class FSMonoCollectionBuilder<T> {
  void replace(FSMonoCollection<T> other);
  void update(void updates(FSMonoCollectionBuilder<T> b));
  CollectionReference get collectionRef;
  set collectionRef(CollectionReference collectionRef);
}

abstract class FSMultiCollectionBuilder<T> {
  void replace(FSMultiCollection<T> other);
  void update(void updates(FSMultiCollectionBuilder<T> b));
  CollectionReference get collectionRef;
  set collectionRef(CollectionReference collectionRef);
}

abstract class FSCollectionBuilder<T> {
  void replace(FSCollection<T> other);
  void update(void updates(FSCollectionBuilder<T> b));
  CollectionReference get collectionRef;
  set collectionRef(CollectionReference collectionRef);
}

class _$FSDiary extends FSDiary {
  @override
  final String userId;
  @override
  final String diaryRecordId;
  @override
  final StreamSubscription streamSubscription;
  @override
  final BuiltList<int> listeners;

  factory _$FSDiary([void updates(FSDiaryBuilder b)]) =>
      (new FSDiaryBuilder()..update(updates)).build();

  _$FSDiary._(
      {this.userId,
      this.diaryRecordId,
      this.streamSubscription,
      this.listeners})
      : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('FSDiary', 'userId');
    }
    if (diaryRecordId == null) {
      throw new BuiltValueNullFieldError('FSDiary', 'diaryRecordId');
    }
    if (listeners == null) {
      throw new BuiltValueNullFieldError('FSDiary', 'listeners');
    }
  }

  @override
  FSDiary rebuild(void updates(FSDiaryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FSDiaryBuilder toBuilder() => new FSDiaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FSDiary &&
        userId == other.userId &&
        diaryRecordId == other.diaryRecordId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), diaryRecordId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FSDiary')
          ..add('userId', userId)
          ..add('diaryRecordId', diaryRecordId)
          ..add('streamSubscription', streamSubscription)
          ..add('listeners', listeners))
        .toString();
  }
}

class FSDiaryBuilder implements Builder<FSDiary, FSDiaryBuilder> {
  _$FSDiary _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _diaryRecordId;
  String get diaryRecordId => _$this._diaryRecordId;
  set diaryRecordId(String diaryRecordId) =>
      _$this._diaryRecordId = diaryRecordId;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  ListBuilder<int> _listeners;
  ListBuilder<int> get listeners =>
      _$this._listeners ??= new ListBuilder<int>();
  set listeners(ListBuilder<int> listeners) => _$this._listeners = listeners;

  FSDiaryBuilder();

  FSDiaryBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _diaryRecordId = _$v.diaryRecordId;
      _streamSubscription = _$v.streamSubscription;
      _listeners = _$v.listeners?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FSDiary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FSDiary;
  }

  @override
  void update(void updates(FSDiaryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FSDiary build() {
    _$FSDiary _$result;
    try {
      _$result = _$v ??
          new _$FSDiary._(
              userId: userId,
              diaryRecordId: diaryRecordId,
              streamSubscription: streamSubscription,
              listeners: listeners.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'listeners';
        listeners.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FSDiary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
