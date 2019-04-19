// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteUserDataArrived extends RemoteUserDataArrived {
  @override
  final UserData userData;

  factory _$RemoteUserDataArrived(
          [void updates(RemoteUserDataArrivedBuilder b)]) =>
      (new RemoteUserDataArrivedBuilder()..update(updates)).build();

  _$RemoteUserDataArrived._({this.userData}) : super._() {
    if (userData == null) {
      throw new BuiltValueNullFieldError('RemoteUserDataArrived', 'userData');
    }
  }

  @override
  RemoteUserDataArrived rebuild(void updates(RemoteUserDataArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteUserDataArrivedBuilder toBuilder() =>
      new RemoteUserDataArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteUserDataArrived && userData == other.userData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteUserDataArrived')
          ..add('userData', userData))
        .toString();
  }
}

class RemoteUserDataArrivedBuilder
    implements Builder<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  _$RemoteUserDataArrived _$v;

  UserDataBuilder _userData;
  UserDataBuilder get userData => _$this._userData ??= new UserDataBuilder();
  set userData(UserDataBuilder userData) => _$this._userData = userData;

  RemoteUserDataArrivedBuilder();

  RemoteUserDataArrivedBuilder get _$this {
    if (_$v != null) {
      _userData = _$v.userData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteUserDataArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteUserDataArrived;
  }

  @override
  void update(void updates(RemoteUserDataArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteUserDataArrived build() {
    _$RemoteUserDataArrived _$result;
    try {
      _$result =
          _$v ?? new _$RemoteUserDataArrived._(userData: userData.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userData';
        userData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoteUserDataArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserDataError extends UserDataError {
  @override
  final String error;

  factory _$UserDataError([void updates(UserDataErrorBuilder b)]) =>
      (new UserDataErrorBuilder()..update(updates)).build();

  _$UserDataError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('UserDataError', 'error');
    }
  }

  @override
  UserDataError rebuild(void updates(UserDataErrorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataErrorBuilder toBuilder() => new UserDataErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataError')..add('error', error))
        .toString();
  }
}

class UserDataErrorBuilder
    implements Builder<UserDataError, UserDataErrorBuilder> {
  _$UserDataError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  UserDataErrorBuilder();

  UserDataErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataError;
  }

  @override
  void update(void updates(UserDataErrorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataError build() {
    final _$result = _$v ?? new _$UserDataError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$OnboardUser extends OnboardUser {
  factory _$OnboardUser([void updates(OnboardUserBuilder b)]) =>
      (new OnboardUserBuilder()..update(updates)).build();

  _$OnboardUser._() : super._();

  @override
  OnboardUser rebuild(void updates(OnboardUserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  OnboardUserBuilder toBuilder() => new OnboardUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OnboardUser;
  }

  @override
  int get hashCode {
    return 509793739;
  }
}

class OnboardUserBuilder implements Builder<OnboardUser, OnboardUserBuilder> {
  _$OnboardUser _$v;

  OnboardUserBuilder();

  @override
  void replace(OnboardUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OnboardUser;
  }

  @override
  void update(void updates(OnboardUserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$OnboardUser build() {
    final _$result = _$v ?? new _$OnboardUser._();
    replace(_$result);
    return _$result;
  }
}

class _$LoadUserData extends LoadUserData {
  factory _$LoadUserData([void updates(LoadUserDataBuilder b)]) =>
      (new LoadUserDataBuilder()..update(updates)).build();

  _$LoadUserData._() : super._();

  @override
  LoadUserData rebuild(void updates(LoadUserDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadUserDataBuilder toBuilder() => new LoadUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoadUserData;
  }

  @override
  int get hashCode {
    return 112846452;
  }
}

class LoadUserDataBuilder
    implements Builder<LoadUserData, LoadUserDataBuilder> {
  _$LoadUserData _$v;

  LoadUserDataBuilder();

  @override
  void replace(LoadUserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoadUserData;
  }

  @override
  void update(void updates(LoadUserDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadUserData build() {
    final _$result = _$v ?? new _$LoadUserData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
