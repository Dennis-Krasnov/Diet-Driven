// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginInitial extends LoginInitial {
  factory _$LoginInitial([void updates(LoginInitialBuilder b)]) =>
      (new LoginInitialBuilder()..update(updates)).build();

  _$LoginInitial._() : super._();

  @override
  LoginInitial rebuild(void updates(LoginInitialBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginInitialBuilder toBuilder() => new LoginInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginInitial;
  }

  @override
  int get hashCode {
    return 864398879;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoginInitial').toString();
  }
}

class LoginInitialBuilder
    implements Builder<LoginInitial, LoginInitialBuilder> {
  _$LoginInitial _$v;

  LoginInitialBuilder();

  @override
  void replace(LoginInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginInitial;
  }

  @override
  void update(void updates(LoginInitialBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginInitial build() {
    final _$result = _$v ?? new _$LoginInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$LoginLoading extends LoginLoading {
  factory _$LoginLoading([void updates(LoginLoadingBuilder b)]) =>
      (new LoginLoadingBuilder()..update(updates)).build();

  _$LoginLoading._() : super._();

  @override
  LoginLoading rebuild(void updates(LoginLoadingBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginLoadingBuilder toBuilder() => new LoginLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginLoading;
  }

  @override
  int get hashCode {
    return 75875038;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoginLoading').toString();
  }
}

class LoginLoadingBuilder
    implements Builder<LoginLoading, LoginLoadingBuilder> {
  _$LoginLoading _$v;

  LoginLoadingBuilder();

  @override
  void replace(LoginLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginLoading;
  }

  @override
  void update(void updates(LoginLoadingBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginLoading build() {
    final _$result = _$v ?? new _$LoginLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$LoginFailure extends LoginFailure {
  @override
  final String error;

  factory _$LoginFailure([void updates(LoginFailureBuilder b)]) =>
      (new LoginFailureBuilder()..update(updates)).build();

  _$LoginFailure._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('LoginFailure', 'error');
    }
  }

  @override
  LoginFailure rebuild(void updates(LoginFailureBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginFailureBuilder toBuilder() => new LoginFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginFailure && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginFailure')..add('error', error))
        .toString();
  }
}

class LoginFailureBuilder
    implements Builder<LoginFailure, LoginFailureBuilder> {
  _$LoginFailure _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  LoginFailureBuilder();

  LoginFailureBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginFailure;
  }

  @override
  void update(void updates(LoginFailureBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginFailure build() {
    final _$result = _$v ?? new _$LoginFailure._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
