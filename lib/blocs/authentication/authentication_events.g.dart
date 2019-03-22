// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppStarted extends AppStarted {
  factory _$AppStarted([void updates(AppStartedBuilder b)]) =>
      (new AppStartedBuilder()..update(updates)).build();

  _$AppStarted._() : super._();

  @override
  AppStarted rebuild(void updates(AppStartedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStartedBuilder toBuilder() => new AppStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppStarted;
  }

  @override
  int get hashCode {
    return 805240986;
  }
}

class AppStartedBuilder implements Builder<AppStarted, AppStartedBuilder> {
  _$AppStarted _$v;

  AppStartedBuilder();

  @override
  void replace(AppStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppStarted;
  }

  @override
  void update(void updates(AppStartedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppStarted build() {
    final _$result = _$v ?? new _$AppStarted._();
    replace(_$result);
    return _$result;
  }
}

class _$LoggedIn extends LoggedIn {
  @override
  final FirebaseUser user;

  factory _$LoggedIn([void updates(LoggedInBuilder b)]) =>
      (new LoggedInBuilder()..update(updates)).build();

  _$LoggedIn._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('LoggedIn', 'user');
    }
  }

  @override
  LoggedIn rebuild(void updates(LoggedInBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoggedInBuilder toBuilder() => new LoggedInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoggedIn && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoggedIn')..add('user', user))
        .toString();
  }
}

class LoggedInBuilder implements Builder<LoggedIn, LoggedInBuilder> {
  _$LoggedIn _$v;

  FirebaseUser _user;
  FirebaseUser get user => _$this._user;
  set user(FirebaseUser user) => _$this._user = user;

  LoggedInBuilder();

  LoggedInBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoggedIn other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoggedIn;
  }

  @override
  void update(void updates(LoggedInBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoggedIn build() {
    final _$result = _$v ?? new _$LoggedIn._(user: user);
    replace(_$result);
    return _$result;
  }
}

class _$LoggedOut extends LoggedOut {
  factory _$LoggedOut([void updates(LoggedOutBuilder b)]) =>
      (new LoggedOutBuilder()..update(updates)).build();

  _$LoggedOut._() : super._();

  @override
  LoggedOut rebuild(void updates(LoggedOutBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoggedOutBuilder toBuilder() => new LoggedOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoggedOut;
  }

  @override
  int get hashCode {
    return 755061653;
  }
}

class LoggedOutBuilder implements Builder<LoggedOut, LoggedOutBuilder> {
  _$LoggedOut _$v;

  LoggedOutBuilder();

  @override
  void replace(LoggedOut other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoggedOut;
  }

  @override
  void update(void updates(LoggedOutBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoggedOut build() {
    final _$result = _$v ?? new _$LoggedOut._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
