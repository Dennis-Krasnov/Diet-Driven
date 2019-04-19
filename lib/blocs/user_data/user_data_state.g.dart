// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDataUninitialized extends UserDataUninitialized {
  factory _$UserDataUninitialized(
          [void updates(UserDataUninitializedBuilder b)]) =>
      (new UserDataUninitializedBuilder()..update(updates)).build();

  _$UserDataUninitialized._() : super._();

  @override
  UserDataUninitialized rebuild(void updates(UserDataUninitializedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataUninitializedBuilder toBuilder() =>
      new UserDataUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataUninitialized;
  }

  @override
  int get hashCode {
    return 252898823;
  }
}

class UserDataUninitializedBuilder
    implements Builder<UserDataUninitialized, UserDataUninitializedBuilder> {
  _$UserDataUninitialized _$v;

  UserDataUninitializedBuilder();

  @override
  void replace(UserDataUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataUninitialized;
  }

  @override
  void update(void updates(UserDataUninitializedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataUninitialized build() {
    final _$result = _$v ?? new _$UserDataUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataFailed extends UserDataFailed {
  @override
  final String error;

  factory _$UserDataFailed([void updates(UserDataFailedBuilder b)]) =>
      (new UserDataFailedBuilder()..update(updates)).build();

  _$UserDataFailed._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('UserDataFailed', 'error');
    }
  }

  @override
  UserDataFailed rebuild(void updates(UserDataFailedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataFailedBuilder toBuilder() =>
      new UserDataFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataFailed && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataFailed')..add('error', error))
        .toString();
  }
}

class UserDataFailedBuilder
    implements Builder<UserDataFailed, UserDataFailedBuilder> {
  _$UserDataFailed _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  UserDataFailedBuilder();

  UserDataFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataFailed;
  }

  @override
  void update(void updates(UserDataFailedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataFailed build() {
    final _$result = _$v ?? new _$UserDataFailed._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$UserDataLoading extends UserDataLoading {
  factory _$UserDataLoading([void updates(UserDataLoadingBuilder b)]) =>
      (new UserDataLoadingBuilder()..update(updates)).build();

  _$UserDataLoading._() : super._();

  @override
  UserDataLoading rebuild(void updates(UserDataLoadingBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataLoadingBuilder toBuilder() =>
      new UserDataLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataLoading;
  }

  @override
  int get hashCode {
    return 780040618;
  }
}

class UserDataLoadingBuilder
    implements Builder<UserDataLoading, UserDataLoadingBuilder> {
  _$UserDataLoading _$v;

  UserDataLoadingBuilder();

  @override
  void replace(UserDataLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataLoading;
  }

  @override
  void update(void updates(UserDataLoadingBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataLoading build() {
    final _$result = _$v ?? new _$UserDataLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataOnboarding extends UserDataOnboarding {
  factory _$UserDataOnboarding([void updates(UserDataOnboardingBuilder b)]) =>
      (new UserDataOnboardingBuilder()..update(updates)).build();

  _$UserDataOnboarding._() : super._();

  @override
  UserDataOnboarding rebuild(void updates(UserDataOnboardingBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataOnboardingBuilder toBuilder() =>
      new UserDataOnboardingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataOnboarding;
  }

  @override
  int get hashCode {
    return 581968459;
  }
}

class UserDataOnboardingBuilder
    implements Builder<UserDataOnboarding, UserDataOnboardingBuilder> {
  _$UserDataOnboarding _$v;

  UserDataOnboardingBuilder();

  @override
  void replace(UserDataOnboarding other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataOnboarding;
  }

  @override
  void update(void updates(UserDataOnboardingBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataOnboarding build() {
    final _$result = _$v ?? new _$UserDataOnboarding._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataLoaded extends UserDataLoaded {
  @override
  final UserData userData;

  factory _$UserDataLoaded([void updates(UserDataLoadedBuilder b)]) =>
      (new UserDataLoadedBuilder()..update(updates)).build();

  _$UserDataLoaded._({this.userData}) : super._() {
    if (userData == null) {
      throw new BuiltValueNullFieldError('UserDataLoaded', 'userData');
    }
  }

  @override
  UserDataLoaded rebuild(void updates(UserDataLoadedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataLoadedBuilder toBuilder() =>
      new UserDataLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataLoaded && userData == other.userData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataLoaded')
          ..add('userData', userData))
        .toString();
  }
}

class UserDataLoadedBuilder
    implements Builder<UserDataLoaded, UserDataLoadedBuilder> {
  _$UserDataLoaded _$v;

  UserDataBuilder _userData;
  UserDataBuilder get userData => _$this._userData ??= new UserDataBuilder();
  set userData(UserDataBuilder userData) => _$this._userData = userData;

  UserDataLoadedBuilder();

  UserDataLoadedBuilder get _$this {
    if (_$v != null) {
      _userData = _$v.userData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataLoaded;
  }

  @override
  void update(void updates(UserDataLoadedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataLoaded build() {
    _$UserDataLoaded _$result;
    try {
      _$result = _$v ?? new _$UserDataLoaded._(userData: userData.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userData';
        userData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserDataLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
