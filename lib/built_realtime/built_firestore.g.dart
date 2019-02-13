// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_firestore;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DiaryRecordCollectionPath extends DiaryRecordCollectionPath {
  @override
  final String userId;

  factory _$DiaryRecordCollectionPath(
          [void updates(DiaryRecordCollectionPathBuilder b)]) =>
      (new DiaryRecordCollectionPathBuilder()..update(updates)).build();

  _$DiaryRecordCollectionPath._({this.userId}) : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('DiaryRecordCollectionPath', 'userId');
    }
  }

  @override
  DiaryRecordCollectionPath rebuild(
          void updates(DiaryRecordCollectionPathBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryRecordCollectionPathBuilder toBuilder() =>
      new DiaryRecordCollectionPathBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryRecordCollectionPath && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryRecordCollectionPath')
          ..add('userId', userId))
        .toString();
  }
}

class DiaryRecordCollectionPathBuilder
    implements
        Builder<DiaryRecordCollectionPath, DiaryRecordCollectionPathBuilder> {
  _$DiaryRecordCollectionPath _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  DiaryRecordCollectionPathBuilder();

  DiaryRecordCollectionPathBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiaryRecordCollectionPath other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryRecordCollectionPath;
  }

  @override
  void update(void updates(DiaryRecordCollectionPathBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryRecordCollectionPath build() {
    final _$result = _$v ?? new _$DiaryRecordCollectionPath._(userId: userId);
    replace(_$result);
    return _$result;
  }
}

class _$DiaryRecordPath extends DiaryRecordPath {
  @override
  final String userId;
  @override
  final String diaryRecordId;

  factory _$DiaryRecordPath([void updates(DiaryRecordPathBuilder b)]) =>
      (new DiaryRecordPathBuilder()..update(updates)).build();

  _$DiaryRecordPath._({this.userId, this.diaryRecordId}) : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('DiaryRecordPath', 'userId');
    }
    if (diaryRecordId == null) {
      throw new BuiltValueNullFieldError('DiaryRecordPath', 'diaryRecordId');
    }
  }

  @override
  DiaryRecordPath rebuild(void updates(DiaryRecordPathBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryRecordPathBuilder toBuilder() =>
      new DiaryRecordPathBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryRecordPath &&
        userId == other.userId &&
        diaryRecordId == other.diaryRecordId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), diaryRecordId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryRecordPath')
          ..add('userId', userId)
          ..add('diaryRecordId', diaryRecordId))
        .toString();
  }
}

class DiaryRecordPathBuilder
    implements Builder<DiaryRecordPath, DiaryRecordPathBuilder> {
  _$DiaryRecordPath _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _diaryRecordId;
  String get diaryRecordId => _$this._diaryRecordId;
  set diaryRecordId(String diaryRecordId) =>
      _$this._diaryRecordId = diaryRecordId;

  DiaryRecordPathBuilder();

  DiaryRecordPathBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _diaryRecordId = _$v.diaryRecordId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiaryRecordPath other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryRecordPath;
  }

  @override
  void update(void updates(DiaryRecordPathBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryRecordPath build() {
    final _$result = _$v ??
        new _$DiaryRecordPath._(userId: userId, diaryRecordId: diaryRecordId);
    replace(_$result);
    return _$result;
  }
}

abstract class FSBuilder<T> {
  void replace(FS<T> other);
  void update(void updates(FSBuilder<T> b));
  Path get path;
  set path(Path path);

  ListBuilder<int> get listeners;
  set listeners(ListBuilder<int> listeners);

  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);

  Observable<T> get snapshotObservable;
  set snapshotObservable(Observable<T> snapshotObservable);
}

class _$FSDocument<T> extends FSDocument<T> {
  @override
  final Path path;
  @override
  final BuiltList<int> listeners;
  @override
  final StreamSubscription streamSubscription;

  factory _$FSDocument([void updates(FSDocumentBuilder<T> b)]) =>
      (new FSDocumentBuilder<T>()..update(updates)).build();

  _$FSDocument._({this.path, this.listeners, this.streamSubscription})
      : super._() {
    if (path == null) {
      throw new BuiltValueNullFieldError('FSDocument', 'path');
    }
    if (listeners == null) {
      throw new BuiltValueNullFieldError('FSDocument', 'listeners');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('FSDocument', 'T');
    }
  }

  @override
  FSDocument<T> rebuild(void updates(FSDocumentBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FSDocumentBuilder<T> toBuilder() => new FSDocumentBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FSDocument && path == other.path;
  }

  @override
  int get hashCode {
    return $jf($jc(0, path.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FSDocument')
          ..add('path', path)
          ..add('listeners', listeners)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class FSDocumentBuilder<T>
    implements Builder<FSDocument<T>, FSDocumentBuilder<T>>, FSBuilder<T> {
  _$FSDocument<T> _$v;

  Path _path;
  Path get path => _$this._path;
  set path(Path path) => _$this._path = path;

  ListBuilder<int> _listeners;
  ListBuilder<int> get listeners =>
      _$this._listeners ??= new ListBuilder<int>();
  set listeners(ListBuilder<int> listeners) => _$this._listeners = listeners;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  FSDocumentBuilder();

  FSDocumentBuilder<T> get _$this {
    if (_$v != null) {
      _path = _$v.path;
      _listeners = _$v.listeners?.toBuilder();
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FSDocument<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FSDocument<T>;
  }

  @override
  void update(void updates(FSDocumentBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FSDocument<T> build() {
    _$FSDocument<T> _$result;
    try {
      _$result = _$v ??
          new _$FSDocument<T>._(
              path: path,
              listeners: listeners.build(),
              streamSubscription: streamSubscription);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'listeners';
        listeners.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FSDocument', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FSCollection<T> extends FSCollection<T> {
  @override
  final Path path;
  @override
  final BuiltList<int> listeners;
  @override
  final StreamSubscription streamSubscription;

  factory _$FSCollection([void updates(FSCollectionBuilder<T> b)]) =>
      (new FSCollectionBuilder<T>()..update(updates)).build();

  _$FSCollection._({this.path, this.listeners, this.streamSubscription})
      : super._() {
    if (path == null) {
      throw new BuiltValueNullFieldError('FSCollection', 'path');
    }
    if (listeners == null) {
      throw new BuiltValueNullFieldError('FSCollection', 'listeners');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('FSCollection', 'T');
    }
  }

  @override
  FSCollection<T> rebuild(void updates(FSCollectionBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FSCollectionBuilder<T> toBuilder() =>
      new FSCollectionBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FSCollection && path == other.path;
  }

  @override
  int get hashCode {
    return $jf($jc(0, path.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FSCollection')
          ..add('path', path)
          ..add('listeners', listeners)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class FSCollectionBuilder<T>
    implements
        Builder<FSCollection<T>, FSCollectionBuilder<T>>,
        FSBuilder<BuiltList<T>> {
  _$FSCollection<T> _$v;

  Path _path;
  Path get path => _$this._path;
  set path(Path path) => _$this._path = path;

  ListBuilder<int> _listeners;
  ListBuilder<int> get listeners =>
      _$this._listeners ??= new ListBuilder<int>();
  set listeners(ListBuilder<int> listeners) => _$this._listeners = listeners;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  FSCollectionBuilder();

  FSCollectionBuilder<T> get _$this {
    if (_$v != null) {
      _path = _$v.path;
      _listeners = _$v.listeners?.toBuilder();
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FSCollection<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FSCollection<T>;
  }

  @override
  void update(void updates(FSCollectionBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FSCollection<T> build() {
    _$FSCollection<T> _$result;
    try {
      _$result = _$v ??
          new _$FSCollection<T>._(
              path: path,
              listeners: listeners.build(),
              streamSubscription: streamSubscription);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'listeners';
        listeners.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FSCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
