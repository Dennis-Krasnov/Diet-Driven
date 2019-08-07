// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_day.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodDiaryDay> _$foodDiaryDaySerializer =
    new _$FoodDiaryDaySerializer();

class _$FoodDiaryDaySerializer implements StructuredSerializer<FoodDiaryDay> {
  @override
  final Iterable<Type> types = const [FoodDiaryDay, _$FoodDiaryDay];
  @override
  final String wireName = 'FoodDiaryDay';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodDiaryDay object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(int)),
      'mealRecords',
      serializers.serialize(object.mealRecords,
          specifiedType: const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(FoodRecord)])),
    ];

    return result;
  }

  @override
  FoodDiaryDay deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodDiaryDayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'mealRecords':
          result.mealRecords.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap, const [
                const FullType(int),
                const FullType(FoodRecord)
              ])) as BuiltListMultimap<dynamic, dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$FoodDiaryDay extends FoodDiaryDay {
  @override
  final int date;
  @override
  final BuiltListMultimap<int, FoodRecord> mealRecords;

  factory _$FoodDiaryDay([void Function(FoodDiaryDayBuilder) updates]) =>
      (new FoodDiaryDayBuilder()..update(updates)).build();

  _$FoodDiaryDay._({this.date, this.mealRecords}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDay', 'date');
    }
    if (mealRecords == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDay', 'mealRecords');
    }
  }

  @override
  FoodDiaryDay rebuild(void Function(FoodDiaryDayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryDayBuilder toBuilder() => new FoodDiaryDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryDay &&
        date == other.date &&
        mealRecords == other.mealRecords;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, date.hashCode), mealRecords.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryDay')
          ..add('date', date)
          ..add('mealRecords', mealRecords))
        .toString();
  }
}

class FoodDiaryDayBuilder
    implements Builder<FoodDiaryDay, FoodDiaryDayBuilder> {
  _$FoodDiaryDay _$v;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  ListMultimapBuilder<int, FoodRecord> _mealRecords;
  ListMultimapBuilder<int, FoodRecord> get mealRecords =>
      _$this._mealRecords ??= new ListMultimapBuilder<int, FoodRecord>();
  set mealRecords(ListMultimapBuilder<int, FoodRecord> mealRecords) =>
      _$this._mealRecords = mealRecords;

  FoodDiaryDayBuilder();

  FoodDiaryDayBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _mealRecords = _$v.mealRecords?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryDay other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryDay;
  }

  @override
  void update(void Function(FoodDiaryDayBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryDay build() {
    _$FoodDiaryDay _$result;
    try {
      _$result = _$v ??
          new _$FoodDiaryDay._(date: date, mealRecords: mealRecords.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'mealRecords';
        mealRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodDiaryDay', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
