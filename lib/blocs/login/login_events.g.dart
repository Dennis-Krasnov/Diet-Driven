// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginButtonPressed extends LoginButtonPressed {
  @override
  final String username;
  @override
  final String password;

  factory _$LoginButtonPressed([void updates(LoginButtonPressedBuilder b)]) =>
      (new LoginButtonPressedBuilder()..update(updates)).build();

  _$LoginButtonPressed._({this.username, this.password}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('LoginButtonPressed', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('LoginButtonPressed', 'password');
    }
  }

  @override
  LoginButtonPressed rebuild(void updates(LoginButtonPressedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginButtonPressedBuilder toBuilder() =>
      new LoginButtonPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginButtonPressed &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginButtonPressed')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class LoginButtonPressedBuilder
    implements Builder<LoginButtonPressed, LoginButtonPressedBuilder> {
  _$LoginButtonPressed _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  LoginButtonPressedBuilder();

  LoginButtonPressedBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginButtonPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginButtonPressed;
  }

  @override
  void update(void updates(LoginButtonPressedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginButtonPressed build() {
    final _$result = _$v ??
        new _$LoginButtonPressed._(username: username, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
