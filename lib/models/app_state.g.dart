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
  final BuiltSetMultimap<FS, int> subscriptions;
  @override
  final BuiltList<FoodRecord> diaryRecords;
  @override
  final DateTime currentDate;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build() as _$AppState;

  _$AppState._(
      {this.user,
      this.navigation,
      this.subscriptions,
      this.diaryRecords,
      this.currentDate})
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
    if (currentDate == null) {
      throw new BuiltValueNullFieldError('AppState', 'currentDate');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$AppStateBuilder toBuilder() => new _$AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        navigation == other.navigation &&
        subscriptions == other.subscriptions &&
        diaryRecords == other.diaryRecords &&
        currentDate == other.currentDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, user.hashCode), navigation.hashCode),
                subscriptions.hashCode),
            diaryRecords.hashCode),
        currentDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('navigation', navigation)
          ..add('subscriptions', subscriptions)
          ..add('diaryRecords', diaryRecords)
          ..add('currentDate', currentDate))
        .toString();
  }
}

class _$AppStateBuilder extends AppStateBuilder {
  _$AppState _$v;

  @override
  UserStateBuilder get user {
    _$this;
    return super.user ??= new UserStateBuilder();
  }

  @override
  set user(UserStateBuilder user) {
    _$this;
    super.user = user;
  }

  @override
  NavigationStateBuilder get navigation {
    _$this;
    return super.navigation ??= new NavigationStateBuilder();
  }

  @override
  set navigation(NavigationStateBuilder navigation) {
    _$this;
    super.navigation = navigation;
  }

  @override
  SetMultimapBuilder<FS, int> get subscriptions {
    _$this;
    return super.subscriptions ??= new SetMultimapBuilder<FS, int>();
  }

  @override
  set subscriptions(SetMultimapBuilder<FS, int> subscriptions) {
    _$this;
    super.subscriptions = subscriptions;
  }

  @override
  ListBuilder<FoodRecord> get diaryRecords {
    _$this;
    return super.diaryRecords ??= new ListBuilder<FoodRecord>();
  }

  @override
  set diaryRecords(ListBuilder<FoodRecord> diaryRecords) {
    _$this;
    super.diaryRecords = diaryRecords;
  }

  @override
  DateTime get currentDate {
    _$this;
    return super.currentDate;
  }

  @override
  set currentDate(DateTime currentDate) {
    _$this;
    super.currentDate = currentDate;
  }

  _$AppStateBuilder() : super._();

  AppStateBuilder get _$this {
    if (_$v != null) {
      super.user = _$v.user?.toBuilder();
      super.navigation = _$v.navigation?.toBuilder();
      super.subscriptions = _$v.subscriptions?.toBuilder();
      super.diaryRecords = _$v.diaryRecords?.toBuilder();
      super.currentDate = _$v.currentDate;
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
              diaryRecords: diaryRecords.build(),
              currentDate: currentDate);
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
