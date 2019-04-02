// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteDiaryArrived extends RemoteDiaryArrived {
  @override
  final ValueObservable<BuiltList<FoodDiaryDay>> diaryDays;

  factory _$RemoteDiaryArrived([void updates(RemoteDiaryArrivedBuilder b)]) =>
      (new RemoteDiaryArrivedBuilder()..update(updates)).build();

  _$RemoteDiaryArrived._({this.diaryDays}) : super._() {
    if (diaryDays == null) {
      throw new BuiltValueNullFieldError('RemoteDiaryArrived', 'diaryDays');
    }
  }

  @override
  RemoteDiaryArrived rebuild(void updates(RemoteDiaryArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteDiaryArrivedBuilder toBuilder() =>
      new RemoteDiaryArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteDiaryArrived && diaryDays == other.diaryDays;
  }

  @override
  int get hashCode {
    return $jf($jc(0, diaryDays.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteDiaryArrived')
          ..add('diaryDays', diaryDays))
        .toString();
  }
}

class RemoteDiaryArrivedBuilder
    implements Builder<RemoteDiaryArrived, RemoteDiaryArrivedBuilder> {
  _$RemoteDiaryArrived _$v;

  ValueObservable<BuiltList<FoodDiaryDay>> _diaryDays;
  ValueObservable<BuiltList<FoodDiaryDay>> get diaryDays => _$this._diaryDays;
  set diaryDays(ValueObservable<BuiltList<FoodDiaryDay>> diaryDays) =>
      _$this._diaryDays = diaryDays;

  RemoteDiaryArrivedBuilder();

  RemoteDiaryArrivedBuilder get _$this {
    if (_$v != null) {
      _diaryDays = _$v.diaryDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteDiaryArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteDiaryArrived;
  }

  @override
  void update(void updates(RemoteDiaryArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteDiaryArrived build() {
    final _$result = _$v ?? new _$RemoteDiaryArrived._(diaryDays: diaryDays);
    replace(_$result);
    return _$result;
  }
}

class _$SaveFoodDiaryDay extends SaveFoodDiaryDay {
  @override
  final String userId;
  @override
  final FoodDiaryDay day;

  factory _$SaveFoodDiaryDay([void updates(SaveFoodDiaryDayBuilder b)]) =>
      (new SaveFoodDiaryDayBuilder()..update(updates)).build();

  _$SaveFoodDiaryDay._({this.userId, this.day}) : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('SaveFoodDiaryDay', 'userId');
    }
    if (day == null) {
      throw new BuiltValueNullFieldError('SaveFoodDiaryDay', 'day');
    }
  }

  @override
  SaveFoodDiaryDay rebuild(void updates(SaveFoodDiaryDayBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveFoodDiaryDayBuilder toBuilder() =>
      new SaveFoodDiaryDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveFoodDiaryDay &&
        userId == other.userId &&
        day == other.day;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), day.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SaveFoodDiaryDay')
          ..add('userId', userId)
          ..add('day', day))
        .toString();
  }
}

class SaveFoodDiaryDayBuilder
    implements Builder<SaveFoodDiaryDay, SaveFoodDiaryDayBuilder> {
  _$SaveFoodDiaryDay _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  FoodDiaryDayBuilder _day;
  FoodDiaryDayBuilder get day => _$this._day ??= new FoodDiaryDayBuilder();
  set day(FoodDiaryDayBuilder day) => _$this._day = day;

  SaveFoodDiaryDayBuilder();

  SaveFoodDiaryDayBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _day = _$v.day?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaveFoodDiaryDay other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SaveFoodDiaryDay;
  }

  @override
  void update(void updates(SaveFoodDiaryDayBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SaveFoodDiaryDay build() {
    _$SaveFoodDiaryDay _$result;
    try {
      _$result =
          _$v ?? new _$SaveFoodDiaryDay._(userId: userId, day: day.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'day';
        day.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SaveFoodDiaryDay', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
