// GENERATED CODE - DO NOT MODIFY BY HAND

part of diary_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DiaryPageVM extends DiaryPageVM {
  @override
  final BuiltList<FoodRecord> diaryRecords;
  @override
  final String userId;
  @override
  final DateTime date;

  factory _$DiaryPageVM([void updates(DiaryPageVMBuilder b)]) =>
      (new DiaryPageVMBuilder()..update(updates)).build();

  _$DiaryPageVM._({this.diaryRecords, this.userId, this.date}) : super._() {
    if (diaryRecords == null) {
      throw new BuiltValueNullFieldError('DiaryPageVM', 'diaryRecords');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('DiaryPageVM', 'userId');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('DiaryPageVM', 'date');
    }
  }

  @override
  DiaryPageVM rebuild(void updates(DiaryPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryPageVMBuilder toBuilder() => new DiaryPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryPageVM &&
        diaryRecords == other.diaryRecords &&
        userId == other.userId &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, diaryRecords.hashCode), userId.hashCode), date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryPageVM')
          ..add('diaryRecords', diaryRecords)
          ..add('userId', userId)
          ..add('date', date))
        .toString();
  }
}

class DiaryPageVMBuilder implements Builder<DiaryPageVM, DiaryPageVMBuilder> {
  _$DiaryPageVM _$v;

  ListBuilder<FoodRecord> _diaryRecords;
  ListBuilder<FoodRecord> get diaryRecords =>
      _$this._diaryRecords ??= new ListBuilder<FoodRecord>();
  set diaryRecords(ListBuilder<FoodRecord> diaryRecords) =>
      _$this._diaryRecords = diaryRecords;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DiaryPageVMBuilder();

  DiaryPageVMBuilder get _$this {
    if (_$v != null) {
      _diaryRecords = _$v.diaryRecords?.toBuilder();
      _userId = _$v.userId;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiaryPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryPageVM;
  }

  @override
  void update(void updates(DiaryPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryPageVM build() {
    _$DiaryPageVM _$result;
    try {
      _$result = _$v ??
          new _$DiaryPageVM._(
              diaryRecords: diaryRecords.build(), userId: userId, date: date);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryRecords';
        diaryRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DiaryPageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
