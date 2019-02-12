// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final UserState user;
  @override
  final NavigationState navigation;
  @override
  final BuiltList<FSDocument> subscriptions;
  @override
  final BuiltList<FoodRecord> diaryRecords;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user, this.navigation, this.subscriptions, this.diaryRecords})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('AppState', 'user');
    }
    if (navigation == null) {
      throw new BuiltValueNullFieldError('AppState', 'navigation');
    }
    if (subscriptions == null) {
      throw new BuiltValueNullFieldError('AppState', 'subscriptions');
    }
    if (diaryRecords == null) {
      throw new BuiltValueNullFieldError('AppState', 'diaryRecords');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        navigation == other.navigation &&
        subscriptions == other.subscriptions &&
        diaryRecords == other.diaryRecords;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, user.hashCode), navigation.hashCode),
            subscriptions.hashCode),
        diaryRecords.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('navigation', navigation)
          ..add('subscriptions', subscriptions)
          ..add('diaryRecords', diaryRecords))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserStateBuilder _user;
  UserStateBuilder get user => _$this._user ??= new UserStateBuilder();
  set user(UserStateBuilder user) => _$this._user = user;

  NavigationStateBuilder _navigation;
  NavigationStateBuilder get navigation =>
      _$this._navigation ??= new NavigationStateBuilder();
  set navigation(NavigationStateBuilder navigation) =>
      _$this._navigation = navigation;

  ListBuilder<FSDocument> _subscriptions;
  ListBuilder<FSDocument> get subscriptions =>
      _$this._subscriptions ??= new ListBuilder<FSDocument>();
  set subscriptions(ListBuilder<FSDocument> subscriptions) =>
      _$this._subscriptions = subscriptions;

  ListBuilder<FoodRecord> _diaryRecords;
  ListBuilder<FoodRecord> get diaryRecords =>
      _$this._diaryRecords ??= new ListBuilder<FoodRecord>();
  set diaryRecords(ListBuilder<FoodRecord> diaryRecords) =>
      _$this._diaryRecords = diaryRecords;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _navigation = _$v.navigation?.toBuilder();
      _subscriptions = _$v.subscriptions?.toBuilder();
      _diaryRecords = _$v.diaryRecords?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              user: user.build(),
              navigation: navigation.build(),
              subscriptions: subscriptions.build(),
              diaryRecords: diaryRecords.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'navigation';
        navigation.build();
        _$failedField = 'subscriptions';
        subscriptions.build();
        _$failedField = 'diaryRecords';
        diaryRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
