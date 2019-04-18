// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteDiaryDayArrived extends RemoteDiaryDayArrived {
  @override
  final ValueObservable<FoodDiaryDay> diaryDay;

  factory _$RemoteDiaryDayArrived(
          [void updates(RemoteDiaryDayArrivedBuilder b)]) =>
      (new RemoteDiaryDayArrivedBuilder()..update(updates)).build();

  _$RemoteDiaryDayArrived._({this.diaryDay}) : super._() {
    if (diaryDay == null) {
      throw new BuiltValueNullFieldError('RemoteDiaryDayArrived', 'diaryDay');
    }
  }

  @override
  RemoteDiaryDayArrived rebuild(void updates(RemoteDiaryDayArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteDiaryDayArrivedBuilder toBuilder() =>
      new RemoteDiaryDayArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteDiaryDayArrived && diaryDay == other.diaryDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, diaryDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteDiaryDayArrived')
          ..add('diaryDay', diaryDay))
        .toString();
  }
}

class RemoteDiaryDayArrivedBuilder
    implements Builder<RemoteDiaryDayArrived, RemoteDiaryDayArrivedBuilder> {
  _$RemoteDiaryDayArrived _$v;

  ValueObservable<FoodDiaryDay> _diaryDay;
  ValueObservable<FoodDiaryDay> get diaryDay => _$this._diaryDay;
  set diaryDay(ValueObservable<FoodDiaryDay> diaryDay) =>
      _$this._diaryDay = diaryDay;

  RemoteDiaryDayArrivedBuilder();

  RemoteDiaryDayArrivedBuilder get _$this {
    if (_$v != null) {
      _diaryDay = _$v.diaryDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteDiaryDayArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteDiaryDayArrived;
  }

  @override
  void update(void updates(RemoteDiaryDayArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteDiaryDayArrived build() {
    final _$result = _$v ?? new _$RemoteDiaryDayArrived._(diaryDay: diaryDay);
    replace(_$result);
    return _$result;
  }
}

class _$SaveFoodDiaryDay extends SaveFoodDiaryDay {
  @override
  final FoodDiaryDay diaryDay;

  factory _$SaveFoodDiaryDay([void updates(SaveFoodDiaryDayBuilder b)]) =>
      (new SaveFoodDiaryDayBuilder()..update(updates)).build();

  _$SaveFoodDiaryDay._({this.diaryDay}) : super._() {
    if (diaryDay == null) {
      throw new BuiltValueNullFieldError('SaveFoodDiaryDay', 'diaryDay');
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
    return other is SaveFoodDiaryDay && diaryDay == other.diaryDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, diaryDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SaveFoodDiaryDay')
          ..add('diaryDay', diaryDay))
        .toString();
  }
}

class SaveFoodDiaryDayBuilder
    implements Builder<SaveFoodDiaryDay, SaveFoodDiaryDayBuilder> {
  _$SaveFoodDiaryDay _$v;

  FoodDiaryDayBuilder _diaryDay;
  FoodDiaryDayBuilder get diaryDay =>
      _$this._diaryDay ??= new FoodDiaryDayBuilder();
  set diaryDay(FoodDiaryDayBuilder diaryDay) => _$this._diaryDay = diaryDay;

  SaveFoodDiaryDayBuilder();

  SaveFoodDiaryDayBuilder get _$this {
    if (_$v != null) {
      _diaryDay = _$v.diaryDay?.toBuilder();
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
      _$result = _$v ?? new _$SaveFoodDiaryDay._(diaryDay: diaryDay.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryDay';
        diaryDay.build();
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
