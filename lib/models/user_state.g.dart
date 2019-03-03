// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserState extends UserState {
  @override
  final FirebaseUser authUser;
  @override
  final bool isAdmin;

  factory _$UserState([void updates(UserStateBuilder b)]) =>
      (new UserStateBuilder()..update(updates)).build() as _$UserState;

  _$UserState._({this.authUser, this.isAdmin}) : super._() {
    if (isAdmin == null) {
      throw new BuiltValueNullFieldError('UserState', 'isAdmin');
    }
  }

  @override
  UserState rebuild(void updates(UserStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$UserStateBuilder toBuilder() => new _$UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState &&
        authUser == other.authUser &&
        isAdmin == other.isAdmin;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, authUser.hashCode), isAdmin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserState')
          ..add('authUser', authUser)
          ..add('isAdmin', isAdmin))
        .toString();
  }
}

class _$UserStateBuilder extends UserStateBuilder {
  _$UserState _$v;

  @override
  FirebaseUser get authUser {
    _$this;
    return super.authUser;
  }

  @override
  set authUser(FirebaseUser authUser) {
    _$this;
    super.authUser = authUser;
  }

  @override
  bool get isAdmin {
    _$this;
    return super.isAdmin;
  }

  @override
  set isAdmin(bool isAdmin) {
    _$this;
    super.isAdmin = isAdmin;
  }

  _$UserStateBuilder() : super._();

  UserStateBuilder get _$this {
    if (_$v != null) {
      super.authUser = _$v.authUser;
      super.isAdmin = _$v.isAdmin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserState;
  }

  @override
  void update(void updates(UserStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserState build() {
    final _$result =
        _$v ?? new _$UserState._(authUser: authUser, isAdmin: isAdmin);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
