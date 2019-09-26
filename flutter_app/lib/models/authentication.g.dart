// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Authentication extends Authentication {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final bool isAnonymous;
  @override
  final String email;
  @override
  final bool isEmailVerified;

  factory _$Authentication([void Function(AuthenticationBuilder) updates]) =>
      (new AuthenticationBuilder()..update(updates)).build();

  _$Authentication._(
      {this.uid,
      this.displayName,
      this.isAnonymous,
      this.email,
      this.isEmailVerified})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('Authentication', 'uid');
    }
    if (isAnonymous == null) {
      throw new BuiltValueNullFieldError('Authentication', 'isAnonymous');
    }
    if (isEmailVerified == null) {
      throw new BuiltValueNullFieldError('Authentication', 'isEmailVerified');
    }
  }

  @override
  Authentication rebuild(void Function(AuthenticationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationBuilder toBuilder() =>
      new AuthenticationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Authentication &&
        uid == other.uid &&
        displayName == other.displayName &&
        isAnonymous == other.isAnonymous &&
        email == other.email &&
        isEmailVerified == other.isEmailVerified;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), displayName.hashCode),
                isAnonymous.hashCode),
            email.hashCode),
        isEmailVerified.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Authentication')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('isAnonymous', isAnonymous)
          ..add('email', email)
          ..add('isEmailVerified', isEmailVerified))
        .toString();
  }
}

class AuthenticationBuilder
    implements Builder<Authentication, AuthenticationBuilder> {
  _$Authentication _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  bool _isAnonymous;
  bool get isAnonymous => _$this._isAnonymous;
  set isAnonymous(bool isAnonymous) => _$this._isAnonymous = isAnonymous;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  bool _isEmailVerified;
  bool get isEmailVerified => _$this._isEmailVerified;
  set isEmailVerified(bool isEmailVerified) =>
      _$this._isEmailVerified = isEmailVerified;

  AuthenticationBuilder();

  AuthenticationBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _isAnonymous = _$v.isAnonymous;
      _email = _$v.email;
      _isEmailVerified = _$v.isEmailVerified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Authentication other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Authentication;
  }

  @override
  void update(void Function(AuthenticationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Authentication build() {
    final _$result = _$v ??
        new _$Authentication._(
            uid: uid,
            displayName: displayName,
            isAnonymous: isAnonymous,
            email: email,
            isEmailVerified: isEmailVerified);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
