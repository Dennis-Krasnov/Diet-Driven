// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealInfo> _$mealInfoSerializer = new _$MealInfoSerializer();

class _$MealInfoSerializer implements StructuredSerializer<MealInfo> {
  @override
  final Iterable<Type> types = const [MealInfo, _$MealInfo];
  @override
  final String wireName = 'MealInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, MealInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'mealName',
      serializers.serialize(object.mealName,
          specifiedType: const FullType(String)),
      'startTime',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MealInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'mealName':
          result.mealName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MealInfo extends MealInfo {
  @override
  final String mealName;
  @override
  final int startTime;

  factory _$MealInfo([void Function(MealInfoBuilder) updates]) =>
      (new MealInfoBuilder()..update(updates)).build();

  _$MealInfo._({this.mealName, this.startTime}) : super._() {
    if (mealName == null) {
      throw new BuiltValueNullFieldError('MealInfo', 'mealName');
    }
    if (startTime == null) {
      throw new BuiltValueNullFieldError('MealInfo', 'startTime');
    }
  }

  @override
  MealInfo rebuild(void Function(MealInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealInfoBuilder toBuilder() => new MealInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealInfo &&
        mealName == other.mealName &&
        startTime == other.startTime;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mealName.hashCode), startTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MealInfo')
          ..add('mealName', mealName)
          ..add('startTime', startTime))
        .toString();
  }
}

class MealInfoBuilder implements Builder<MealInfo, MealInfoBuilder> {
  _$MealInfo _$v;

  String _mealName;
  String get mealName => _$this._mealName;
  set mealName(String mealName) => _$this._mealName = mealName;

  int _startTime;
  int get startTime => _$this._startTime;
  set startTime(int startTime) => _$this._startTime = startTime;

  MealInfoBuilder();

  MealInfoBuilder get _$this {
    if (_$v != null) {
      _mealName = _$v.mealName;
      _startTime = _$v.startTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MealInfo;
  }

  @override
  void update(void Function(MealInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MealInfo build() {
    final _$result =
        _$v ?? new _$MealInfo._(mealName: mealName, startTime: startTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
