// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignIn extends SignIn {
  @override
  final FirebaseUser user;

  factory _$SignIn([void updates(SignInBuilder b)]) =>
      (new SignInBuilder()..update(updates)).build();

  _$SignIn._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('SignIn', 'user');
    }
  }

  @override
  SignIn rebuild(void updates(SignInBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInBuilder toBuilder() => new SignInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignIn && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignIn')..add('user', user))
        .toString();
  }
}

class SignInBuilder implements Builder<SignIn, SignInBuilder> {
  _$SignIn _$v;

  FirebaseUser _user;
  FirebaseUser get user => _$this._user;
  set user(FirebaseUser user) => _$this._user = user;

  SignInBuilder();

  SignInBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignIn other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignIn;
  }

  @override
  void update(void updates(SignInBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SignIn build() {
    final _$result = _$v ?? new _$SignIn._(user: user);
    replace(_$result);
    return _$result;
  }
}

class _$SignOut extends SignOut {
  factory _$SignOut([void updates(SignOutBuilder b)]) =>
      (new SignOutBuilder()..update(updates)).build();

  _$SignOut._() : super._();

  @override
  SignOut rebuild(void updates(SignOutBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SignOutBuilder toBuilder() => new SignOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignOut;
  }

  @override
  int get hashCode {
    return 957153408;
  }
}

class SignOutBuilder implements Builder<SignOut, SignOutBuilder> {
  _$SignOut _$v;

  SignOutBuilder();

  @override
  void replace(SignOut other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignOut;
  }

  @override
  void update(void updates(SignOutBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SignOut build() {
    final _$result = _$v ?? new _$SignOut._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
