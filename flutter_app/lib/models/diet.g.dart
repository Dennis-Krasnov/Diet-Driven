// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Diet extends Diet {
  @override
  final NutrientMap idealNutrients;
  @override
  final BuiltList<MealInfo> meals;
  @override
  final int startDate;

  factory _$Diet([void Function(DietBuilder) updates]) =>
      (new DietBuilder()..update(updates)).build() as _$Diet;

  _$Diet._({this.idealNutrients, this.meals, this.startDate}) : super._() {
    if (idealNutrients == null) {
      throw new BuiltValueNullFieldError('Diet', 'idealNutrients');
    }
    if (meals == null) {
      throw new BuiltValueNullFieldError('Diet', 'meals');
    }
    if (startDate == null) {
      throw new BuiltValueNullFieldError('Diet', 'startDate');
    }
  }

  @override
  Diet rebuild(void Function(DietBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$DietBuilder toBuilder() => new _$DietBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Diet &&
        idealNutrients == other.idealNutrients &&
        meals == other.meals &&
        startDate == other.startDate;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, idealNutrients.hashCode), meals.hashCode),
        startDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Diet')
          ..add('idealNutrients', idealNutrients)
          ..add('meals', meals)
          ..add('startDate', startDate))
        .toString();
  }
}

class _$DietBuilder extends DietBuilder {
  _$Diet _$v;

  @override
  NutrientMap get idealNutrients {
    _$this;
    return super.idealNutrients;
  }

  @override
  set idealNutrients(NutrientMap idealNutrients) {
    _$this;
    super.idealNutrients = idealNutrients;
  }

  @override
  BuiltList<MealInfo> get meals {
    _$this;
    return super.meals;
  }

  @override
  set meals(BuiltList<MealInfo> meals) {
    _$this;
    super.meals = meals;
  }

  @override
  int get startDate {
    _$this;
    return super.startDate;
  }

  @override
  set startDate(int startDate) {
    _$this;
    super.startDate = startDate;
  }

  _$DietBuilder() : super._();

  DietBuilder get _$this {
    if (_$v != null) {
      super.idealNutrients = _$v.idealNutrients;
      super.meals = _$v.meals;
      super.startDate = _$v.startDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Diet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Diet;
  }

  @override
  void update(void Function(DietBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Diet build() {
    final _$result = _$v ??
        new _$Diet._(
            idealNutrients: idealNutrients, meals: meals, startDate: startDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
