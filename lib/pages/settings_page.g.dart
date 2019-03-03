// GENERATED CODE - DO NOT MODIFY BY HAND

part of settings_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsPageVM extends SettingsPageVM {
  @override
  final String userId;
  @override
  final int daysSinceEpoch;
  @override
  final DateTime date;
  @override
  final NavigationState navState;

  factory _$SettingsPageVM([void updates(SettingsPageVMBuilder b)]) =>
      (new SettingsPageVMBuilder()..update(updates)).build();

  _$SettingsPageVM._(
      {this.userId, this.daysSinceEpoch, this.date, this.navState})
      : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('SettingsPageVM', 'userId');
    }
    if (daysSinceEpoch == null) {
      throw new BuiltValueNullFieldError('SettingsPageVM', 'daysSinceEpoch');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('SettingsPageVM', 'date');
    }
    if (navState == null) {
      throw new BuiltValueNullFieldError('SettingsPageVM', 'navState');
    }
  }

  @override
  SettingsPageVM rebuild(void updates(SettingsPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsPageVMBuilder toBuilder() =>
      new SettingsPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsPageVM &&
        userId == other.userId &&
        daysSinceEpoch == other.daysSinceEpoch &&
        date == other.date &&
        navState == other.navState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), daysSinceEpoch.hashCode),
            date.hashCode),
        navState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsPageVM')
          ..add('userId', userId)
          ..add('daysSinceEpoch', daysSinceEpoch)
          ..add('date', date)
          ..add('navState', navState))
        .toString();
  }
}

class SettingsPageVMBuilder
    implements Builder<SettingsPageVM, SettingsPageVMBuilder> {
  _$SettingsPageVM _$v;

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

  NavigationStateBuilder _navState;
  NavigationStateBuilder get navState =>
      _$this._navState ??= new NavigationStateBuilder();
  set navState(NavigationStateBuilder navState) => _$this._navState = navState;

  SettingsPageVMBuilder();

  SettingsPageVMBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _daysSinceEpoch = _$v.daysSinceEpoch;
      _date = _$v.date;
      _navState = _$v.navState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsPageVM;
  }

  @override
  void update(void updates(SettingsPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsPageVM build() {
    _$SettingsPageVM _$result;
    try {
      _$result = _$v ??
          new _$SettingsPageVM._(
              userId: userId,
              daysSinceEpoch: daysSinceEpoch,
              date: date,
              navState: navState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'navState';
        navState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsPageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
