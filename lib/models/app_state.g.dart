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
  final bool userDataLoaded;
  @override
  final bool settingsLoaded;
  @override
  final bool remoteConfigLoaded;
  @override
  final ConnectivityResult currentConnectivity;
  @override
  final BuiltList<FoodDiaryDay> foodDiaryDays;
  @override
  final BuiltList<MealsSnapshot> mealsSnapshots;
  @override
  final int currentDaysSinceEpoch;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build() as _$AppState;

  _$AppState._(
      {this.user,
      this.navigation,
      this.userDataLoaded,
      this.settingsLoaded,
      this.remoteConfigLoaded,
      this.currentConnectivity,
      this.foodDiaryDays,
      this.mealsSnapshots,
      this.currentDaysSinceEpoch})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('AppState', 'user');
    }
    if (navigation == null) {
      throw new BuiltValueNullFieldError('AppState', 'navigation');
    }
    if (userDataLoaded == null) {
      throw new BuiltValueNullFieldError('AppState', 'userDataLoaded');
    }
    if (settingsLoaded == null) {
      throw new BuiltValueNullFieldError('AppState', 'settingsLoaded');
    }
    if (remoteConfigLoaded == null) {
      throw new BuiltValueNullFieldError('AppState', 'remoteConfigLoaded');
    }
    if (foodDiaryDays == null) {
      throw new BuiltValueNullFieldError('AppState', 'foodDiaryDays');
    }
    if (mealsSnapshots == null) {
      throw new BuiltValueNullFieldError('AppState', 'mealsSnapshots');
    }
    if (currentDaysSinceEpoch == null) {
      throw new BuiltValueNullFieldError('AppState', 'currentDaysSinceEpoch');
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
        userDataLoaded == other.userDataLoaded &&
        settingsLoaded == other.settingsLoaded &&
        remoteConfigLoaded == other.remoteConfigLoaded &&
        currentConnectivity == other.currentConnectivity &&
        foodDiaryDays == other.foodDiaryDays &&
        mealsSnapshots == other.mealsSnapshots &&
        currentDaysSinceEpoch == other.currentDaysSinceEpoch;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, user.hashCode), navigation.hashCode),
                                userDataLoaded.hashCode),
                            settingsLoaded.hashCode),
                        remoteConfigLoaded.hashCode),
                    currentConnectivity.hashCode),
                foodDiaryDays.hashCode),
            mealsSnapshots.hashCode),
        currentDaysSinceEpoch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('navigation', navigation)
          ..add('userDataLoaded', userDataLoaded)
          ..add('settingsLoaded', settingsLoaded)
          ..add('remoteConfigLoaded', remoteConfigLoaded)
          ..add('currentConnectivity', currentConnectivity)
          ..add('foodDiaryDays', foodDiaryDays)
          ..add('mealsSnapshots', mealsSnapshots)
          ..add('currentDaysSinceEpoch', currentDaysSinceEpoch))
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
  bool get userDataLoaded {
    _$this;
    return super.userDataLoaded;
  }

  @override
  set userDataLoaded(bool userDataLoaded) {
    _$this;
    super.userDataLoaded = userDataLoaded;
  }

  @override
  bool get settingsLoaded {
    _$this;
    return super.settingsLoaded;
  }

  @override
  set settingsLoaded(bool settingsLoaded) {
    _$this;
    super.settingsLoaded = settingsLoaded;
  }

  @override
  bool get remoteConfigLoaded {
    _$this;
    return super.remoteConfigLoaded;
  }

  @override
  set remoteConfigLoaded(bool remoteConfigLoaded) {
    _$this;
    super.remoteConfigLoaded = remoteConfigLoaded;
  }

  @override
  ConnectivityResult get currentConnectivity {
    _$this;
    return super.currentConnectivity;
  }

  @override
  set currentConnectivity(ConnectivityResult currentConnectivity) {
    _$this;
    super.currentConnectivity = currentConnectivity;
  }

  @override
  ListBuilder<FoodDiaryDay> get foodDiaryDays {
    _$this;
    return super.foodDiaryDays ??= new ListBuilder<FoodDiaryDay>();
  }

  @override
  set foodDiaryDays(ListBuilder<FoodDiaryDay> foodDiaryDays) {
    _$this;
    super.foodDiaryDays = foodDiaryDays;
  }

  @override
  ListBuilder<MealsSnapshot> get mealsSnapshots {
    _$this;
    return super.mealsSnapshots ??= new ListBuilder<MealsSnapshot>();
  }

  @override
  set mealsSnapshots(ListBuilder<MealsSnapshot> mealsSnapshots) {
    _$this;
    super.mealsSnapshots = mealsSnapshots;
  }

  @override
  int get currentDaysSinceEpoch {
    _$this;
    return super.currentDaysSinceEpoch;
  }

  @override
  set currentDaysSinceEpoch(int currentDaysSinceEpoch) {
    _$this;
    super.currentDaysSinceEpoch = currentDaysSinceEpoch;
  }

  _$AppStateBuilder() : super._();

  AppStateBuilder get _$this {
    if (_$v != null) {
      super.user = _$v.user?.toBuilder();
      super.navigation = _$v.navigation?.toBuilder();
      super.userDataLoaded = _$v.userDataLoaded;
      super.settingsLoaded = _$v.settingsLoaded;
      super.remoteConfigLoaded = _$v.remoteConfigLoaded;
      super.currentConnectivity = _$v.currentConnectivity;
      super.foodDiaryDays = _$v.foodDiaryDays?.toBuilder();
      super.mealsSnapshots = _$v.mealsSnapshots?.toBuilder();
      super.currentDaysSinceEpoch = _$v.currentDaysSinceEpoch;
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
              userDataLoaded: userDataLoaded,
              settingsLoaded: settingsLoaded,
              remoteConfigLoaded: remoteConfigLoaded,
              currentConnectivity: currentConnectivity,
              foodDiaryDays: foodDiaryDays.build(),
              mealsSnapshots: mealsSnapshots.build(),
              currentDaysSinceEpoch: currentDaysSinceEpoch);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'navigation';
        navigation.build();

        _$failedField = 'foodDiaryDays';
        foodDiaryDays.build();
        _$failedField = 'mealsSnapshots';
        mealsSnapshots.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
