// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PressLoginButton extends PressLoginButton {
  @override
  final String username;
  @override
  final String password;

  factory _$PressLoginButton([void updates(PressLoginButtonBuilder b)]) =>
      (new PressLoginButtonBuilder()..update(updates)).build();

  _$PressLoginButton._({this.username, this.password}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('PressLoginButton', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('PressLoginButton', 'password');
    }
  }

  @override
  PressLoginButton rebuild(void updates(PressLoginButtonBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PressLoginButtonBuilder toBuilder() =>
      new PressLoginButtonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PressLoginButton &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PressLoginButton')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class PressLoginButtonBuilder
    implements Builder<PressLoginButton, PressLoginButtonBuilder> {
  _$PressLoginButton _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  PressLoginButtonBuilder();

  PressLoginButtonBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PressLoginButton other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PressLoginButton;
  }

  @override
  void update(void updates(PressLoginButtonBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PressLoginButton build() {
    final _$result =
        _$v ?? new _$PressLoginButton._(username: username, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
