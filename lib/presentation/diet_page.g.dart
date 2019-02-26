// GENERATED CODE - DO NOT MODIFY BY HAND

part of diet_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DietPageVM extends DietPageVM {
  @override
  final BuiltList<FoodRecord> diaryRecords;
  @override
  final BuiltList<MealsSnapshot> mealsSnapshots;
  @override
  final String userId;
  @override
  final int daysSinceEpoch;
  @override
  final DateTime date;

  factory _$DietPageVM([void updates(DietPageVMBuilder b)]) =>
      (new DietPageVMBuilder()..update(updates)).build();

  _$DietPageVM._(
      {this.diaryRecords,
      this.mealsSnapshots,
      this.userId,
      this.daysSinceEpoch,
      this.date})
      : super._() {
    if (diaryRecords == null) {
      throw new BuiltValueNullFieldError('DietPageVM', 'diaryRecords');
    }
    if (mealsSnapshots == null) {
      throw new BuiltValueNullFieldError('DietPageVM', 'mealsSnapshots');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('DietPageVM', 'userId');
    }
    if (daysSinceEpoch == null) {
      throw new BuiltValueNullFieldError('DietPageVM', 'daysSinceEpoch');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('DietPageVM', 'date');
    }
  }

  @override
  DietPageVM rebuild(void updates(DietPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DietPageVMBuilder toBuilder() => new DietPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DietPageVM &&
        diaryRecords == other.diaryRecords &&
        mealsSnapshots == other.mealsSnapshots &&
        userId == other.userId &&
        daysSinceEpoch == other.daysSinceEpoch &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, diaryRecords.hashCode), mealsSnapshots.hashCode),
                userId.hashCode),
            daysSinceEpoch.hashCode),
        date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DietPageVM')
          ..add('diaryRecords', diaryRecords)
          ..add('mealsSnapshots', mealsSnapshots)
          ..add('userId', userId)
          ..add('daysSinceEpoch', daysSinceEpoch)
          ..add('date', date))
        .toString();
  }
}

class DietPageVMBuilder implements Builder<DietPageVM, DietPageVMBuilder> {
  _$DietPageVM _$v;

  ListBuilder<FoodRecord> _diaryRecords;
  ListBuilder<FoodRecord> get diaryRecords =>
      _$this._diaryRecords ??= new ListBuilder<FoodRecord>();
  set diaryRecords(ListBuilder<FoodRecord> diaryRecords) =>
      _$this._diaryRecords = diaryRecords;

  ListBuilder<MealsSnapshot> _mealsSnapshots;
  ListBuilder<MealsSnapshot> get mealsSnapshots =>
      _$this._mealsSnapshots ??= new ListBuilder<MealsSnapshot>();
  set mealsSnapshots(ListBuilder<MealsSnapshot> mealsSnapshots) =>
      _$this._mealsSnapshots = mealsSnapshots;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  int _daysSinceEpoch;
  int get daysSinceEpoch => _$this._daysSinceEpoch;
  set daysSinceEpoch(int daysSinceEpoch) =>
      _$this._daysSinceEpoch = daysSinceEpoch;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DietPageVMBuilder();

  DietPageVMBuilder get _$this {
    if (_$v != null) {
      _diaryRecords = _$v.diaryRecords?.toBuilder();
      _mealsSnapshots = _$v.mealsSnapshots?.toBuilder();
      _userId = _$v.userId;
      _daysSinceEpoch = _$v.daysSinceEpoch;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DietPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DietPageVM;
  }

  @override
  void update(void updates(DietPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DietPageVM build() {
    _$DietPageVM _$result;
    try {
      _$result = _$v ??
          new _$DietPageVM._(
              diaryRecords: diaryRecords.build(),
              mealsSnapshots: mealsSnapshots.build(),
              userId: userId,
              daysSinceEpoch: daysSinceEpoch,
              date: date);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryRecords';
        diaryRecords.build();
        _$failedField = 'mealsSnapshots';
        mealsSnapshots.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DietPageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
