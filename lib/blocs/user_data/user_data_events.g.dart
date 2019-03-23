// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDataArrived extends UserDataArrived {
  @override
  final UserData userData;

  factory _$UserDataArrived([void updates(UserDataArrivedBuilder b)]) =>
      (new UserDataArrivedBuilder()..update(updates)).build();

  _$UserDataArrived._({this.userData}) : super._() {
    if (userData == null) {
      throw new BuiltValueNullFieldError('UserDataArrived', 'userData');
    }
  }

  @override
  UserDataArrived rebuild(void updates(UserDataArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataArrivedBuilder toBuilder() =>
      new UserDataArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataArrived && userData == other.userData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataArrived')
          ..add('userData', userData))
        .toString();
  }
}

class UserDataArrivedBuilder
    implements Builder<UserDataArrived, UserDataArrivedBuilder> {
  _$UserDataArrived _$v;

  UserDataBuilder _userData;
  UserDataBuilder get userData => _$this._userData ??= new UserDataBuilder();
  set userData(UserDataBuilder userData) => _$this._userData = userData;

  UserDataArrivedBuilder();

  UserDataArrivedBuilder get _$this {
    if (_$v != null) {
      _userData = _$v.userData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataArrived;
  }

  @override
  void update(void updates(UserDataArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataArrived build() {
    _$UserDataArrived _$result;
    try {
      _$result = _$v ?? new _$UserDataArrived._(userData: userData.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userData';
        userData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserDataArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
