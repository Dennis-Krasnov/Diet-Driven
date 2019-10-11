// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitFoodDiary extends InitFoodDiary {
  factory _$InitFoodDiary([void Function(InitFoodDiaryBuilder) updates]) =>
      (new InitFoodDiaryBuilder()..update(updates)).build();

  _$InitFoodDiary._() : super._();

  @override
  InitFoodDiary rebuild(void Function(InitFoodDiaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitFoodDiaryBuilder toBuilder() => new InitFoodDiaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitFoodDiary;
  }

  @override
  int get hashCode {
    return 398441077;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('InitFoodDiary').toString();
  }
}

class InitFoodDiaryBuilder
    implements Builder<InitFoodDiary, InitFoodDiaryBuilder> {
  _$InitFoodDiary _$v;

  InitFoodDiaryBuilder();

  @override
  void replace(InitFoodDiary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitFoodDiary;
  }

  @override
  void update(void Function(InitFoodDiaryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitFoodDiary build() {
    final _$result = _$v ?? new _$InitFoodDiary._();
    replace(_$result);
    return _$result;
  }
}

class _$IngressFoodDiaryArrived extends IngressFoodDiaryArrived {
  @override
  final BuiltList<FoodDiaryDay> diaryDays;
  @override
  final BuiltList<Diet> diets;

  factory _$IngressFoodDiaryArrived(
          [void Function(IngressFoodDiaryArrivedBuilder) updates]) =>
      (new IngressFoodDiaryArrivedBuilder()..update(updates)).build();

  _$IngressFoodDiaryArrived._({this.diaryDays, this.diets}) : super._() {
    if (diaryDays == null) {
      throw new BuiltValueNullFieldError(
          'IngressFoodDiaryArrived', 'diaryDays');
    }
    if (diets == null) {
      throw new BuiltValueNullFieldError('IngressFoodDiaryArrived', 'diets');
    }
  }

  @override
  IngressFoodDiaryArrived rebuild(
          void Function(IngressFoodDiaryArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IngressFoodDiaryArrivedBuilder toBuilder() =>
      new IngressFoodDiaryArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IngressFoodDiaryArrived &&
        diaryDays == other.diaryDays &&
        diets == other.diets;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, diaryDays.hashCode), diets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('IngressFoodDiaryArrived')
          ..add('diaryDays', diaryDays)
          ..add('diets', diets))
        .toString();
  }
}

class IngressFoodDiaryArrivedBuilder
    implements
        Builder<IngressFoodDiaryArrived, IngressFoodDiaryArrivedBuilder> {
  _$IngressFoodDiaryArrived _$v;

  ListBuilder<FoodDiaryDay> _diaryDays;
  ListBuilder<FoodDiaryDay> get diaryDays =>
      _$this._diaryDays ??= new ListBuilder<FoodDiaryDay>();
  set diaryDays(ListBuilder<FoodDiaryDay> diaryDays) =>
      _$this._diaryDays = diaryDays;

  ListBuilder<Diet> _diets;
  ListBuilder<Diet> get diets => _$this._diets ??= new ListBuilder<Diet>();
  set diets(ListBuilder<Diet> diets) => _$this._diets = diets;

  IngressFoodDiaryArrivedBuilder();

  IngressFoodDiaryArrivedBuilder get _$this {
    if (_$v != null) {
      _diaryDays = _$v.diaryDays?.toBuilder();
      _diets = _$v.diets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IngressFoodDiaryArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$IngressFoodDiaryArrived;
  }

  @override
  void update(void Function(IngressFoodDiaryArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IngressFoodDiaryArrived build() {
    _$IngressFoodDiaryArrived _$result;
    try {
      _$result = _$v ??
          new _$IngressFoodDiaryArrived._(
              diaryDays: diaryDays.build(), diets: diets.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryDays';
        diaryDays.build();
        _$failedField = 'diets';
        diets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'IngressFoodDiaryArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryError extends FoodDiaryError {
  @override
  final Object error;
  @override
  final StackTrace stacktrace;

  factory _$FoodDiaryError([void Function(FoodDiaryErrorBuilder) updates]) =>
      (new FoodDiaryErrorBuilder()..update(updates)).build();

  _$FoodDiaryError._({this.error, this.stacktrace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryError', 'error');
    }
  }

  @override
  FoodDiaryError rebuild(void Function(FoodDiaryErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryErrorBuilder toBuilder() =>
      new FoodDiaryErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryError &&
        error == other.error &&
        stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), stacktrace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryError')
          ..add('error', error)
          ..add('stacktrace', stacktrace))
        .toString();
  }
}

class FoodDiaryErrorBuilder
    implements
        Builder<FoodDiaryError, FoodDiaryErrorBuilder>,
        BuiltErrorBuilder {
  _$FoodDiaryError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  FoodDiaryErrorBuilder();

  FoodDiaryErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FoodDiaryError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryError;
  }

  @override
  void update(void Function(FoodDiaryErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryError build() {
    final _$result =
        _$v ?? new _$FoodDiaryError._(error: error, stacktrace: stacktrace);
    replace(_$result);
    return _$result;
  }
}

class _$GlobalAddFoodRecords extends GlobalAddFoodRecords {
  @override
  final int date;
  @override
  final int mealIndex;
  @override
  final BuiltList<FoodRecord> foodRecords;
  @override
  final Completer<void> completer;

  factory _$GlobalAddFoodRecords(
          [void Function(GlobalAddFoodRecordsBuilder) updates]) =>
      (new GlobalAddFoodRecordsBuilder()..update(updates)).build();

  _$GlobalAddFoodRecords._(
      {this.date, this.mealIndex, this.foodRecords, this.completer})
      : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('GlobalAddFoodRecords', 'date');
    }
    if (mealIndex == null) {
      throw new BuiltValueNullFieldError('GlobalAddFoodRecords', 'mealIndex');
    }
    if (foodRecords == null) {
      throw new BuiltValueNullFieldError('GlobalAddFoodRecords', 'foodRecords');
    }
  }

  @override
  GlobalAddFoodRecords rebuild(
          void Function(GlobalAddFoodRecordsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalAddFoodRecordsBuilder toBuilder() =>
      new GlobalAddFoodRecordsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalAddFoodRecords &&
        date == other.date &&
        mealIndex == other.mealIndex &&
        foodRecords == other.foodRecords &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, date.hashCode), mealIndex.hashCode),
            foodRecords.hashCode),
        completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GlobalAddFoodRecords')
          ..add('date', date)
          ..add('mealIndex', mealIndex)
          ..add('foodRecords', foodRecords)
          ..add('completer', completer))
        .toString();
  }
}

class GlobalAddFoodRecordsBuilder
    implements Builder<GlobalAddFoodRecords, GlobalAddFoodRecordsBuilder> {
  _$GlobalAddFoodRecords _$v;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  int _mealIndex;
  int get mealIndex => _$this._mealIndex;
  set mealIndex(int mealIndex) => _$this._mealIndex = mealIndex;

  ListBuilder<FoodRecord> _foodRecords;
  ListBuilder<FoodRecord> get foodRecords =>
      _$this._foodRecords ??= new ListBuilder<FoodRecord>();
  set foodRecords(ListBuilder<FoodRecord> foodRecords) =>
      _$this._foodRecords = foodRecords;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  GlobalAddFoodRecordsBuilder();

  GlobalAddFoodRecordsBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _mealIndex = _$v.mealIndex;
      _foodRecords = _$v.foodRecords?.toBuilder();
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GlobalAddFoodRecords other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GlobalAddFoodRecords;
  }

  @override
  void update(void Function(GlobalAddFoodRecordsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GlobalAddFoodRecords build() {
    _$GlobalAddFoodRecords _$result;
    try {
      _$result = _$v ??
          new _$GlobalAddFoodRecords._(
              date: date,
              mealIndex: mealIndex,
              foodRecords: foodRecords.build(),
              completer: completer);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecords';
        foodRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GlobalAddFoodRecords', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
