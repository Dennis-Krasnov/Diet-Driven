// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_firestore;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class FSBASEBuilder<T> {
  void replace(FSBASE<T> other);
  void update(void updates(FSBASEBuilder<T> b));
}

class _$DiaryFSDocument extends DiaryFSDocument {
  @override
  final String userId;
  @override
  final String diaryRecordId;

  factory _$DiaryFSDocument([void updates(DiaryFSDocumentBuilder b)]) =>
      (new DiaryFSDocumentBuilder()..update(updates)).build();

  _$DiaryFSDocument._({this.userId, this.diaryRecordId}) : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('DiaryFSDocument', 'userId');
    }
    if (diaryRecordId == null) {
      throw new BuiltValueNullFieldError('DiaryFSDocument', 'diaryRecordId');
    }
  }

  @override
  DiaryFSDocument rebuild(void updates(DiaryFSDocumentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryFSDocumentBuilder toBuilder() =>
      new DiaryFSDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryFSDocument &&
        userId == other.userId &&
        diaryRecordId == other.diaryRecordId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), diaryRecordId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryFSDocument')
          ..add('userId', userId)
          ..add('diaryRecordId', diaryRecordId))
        .toString();
  }
}

class DiaryFSDocumentBuilder
    implements
        Builder<DiaryFSDocument, DiaryFSDocumentBuilder>,
        FSBASEBuilder<FoodRecord> {
  _$DiaryFSDocument _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _diaryRecordId;
  String get diaryRecordId => _$this._diaryRecordId;
  set diaryRecordId(String diaryRecordId) =>
      _$this._diaryRecordId = diaryRecordId;

  DiaryFSDocumentBuilder();

  DiaryFSDocumentBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _diaryRecordId = _$v.diaryRecordId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiaryFSDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryFSDocument;
  }

  @override
  void update(void updates(DiaryFSDocumentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryFSDocument build() {
    final _$result = _$v ??
        new _$DiaryFSDocument._(userId: userId, diaryRecordId: diaryRecordId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
