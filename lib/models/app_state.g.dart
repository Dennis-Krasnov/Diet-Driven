// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final FirebaseUser user;
  @override
  final bool loading;
  @override
  final BuiltMap<Connection, List<int>> subscriptions;
  @override
  final BuiltList<int> widgets;
  @override
  final Page activePage;
  @override
  final Page defaultPage;
  @override
  final List<Page> bottomNavigation;
  @override
  final Page bottomNavigationPage;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user,
      this.loading,
      this.subscriptions,
      this.widgets,
      this.activePage,
      this.defaultPage,
      this.bottomNavigation,
      this.bottomNavigationPage})
      : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('AppState', 'loading');
    }
    if (subscriptions == null) {
      throw new BuiltValueNullFieldError('AppState', 'subscriptions');
    }
    if (widgets == null) {
      throw new BuiltValueNullFieldError('AppState', 'widgets');
    }
    if (activePage == null) {
      throw new BuiltValueNullFieldError('AppState', 'activePage');
    }
    if (defaultPage == null) {
      throw new BuiltValueNullFieldError('AppState', 'defaultPage');
    }
    if (bottomNavigation == null) {
      throw new BuiltValueNullFieldError('AppState', 'bottomNavigation');
    }
    if (bottomNavigationPage == null) {
      throw new BuiltValueNullFieldError('AppState', 'bottomNavigationPage');
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
        loading == other.loading &&
        subscriptions == other.subscriptions &&
        widgets == other.widgets &&
        activePage == other.activePage &&
        defaultPage == other.defaultPage &&
        bottomNavigation == other.bottomNavigation &&
        bottomNavigationPage == other.bottomNavigationPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, user.hashCode), loading.hashCode),
                            subscriptions.hashCode),
                        widgets.hashCode),
                    activePage.hashCode),
                defaultPage.hashCode),
            bottomNavigation.hashCode),
        bottomNavigationPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('loading', loading)
          ..add('subscriptions', subscriptions)
          ..add('widgets', widgets)
          ..add('activePage', activePage)
          ..add('defaultPage', defaultPage)
          ..add('bottomNavigation', bottomNavigation)
          ..add('bottomNavigationPage', bottomNavigationPage))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  FirebaseUser _user;
  FirebaseUser get user => _$this._user;
  set user(FirebaseUser user) => _$this._user = user;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  MapBuilder<Connection, List<int>> _subscriptions;
  MapBuilder<Connection, List<int>> get subscriptions =>
      _$this._subscriptions ??= new MapBuilder<Connection, List<int>>();
  set subscriptions(MapBuilder<Connection, List<int>> subscriptions) =>
      _$this._subscriptions = subscriptions;

  ListBuilder<int> _widgets;
  ListBuilder<int> get widgets => _$this._widgets ??= new ListBuilder<int>();
  set widgets(ListBuilder<int> widgets) => _$this._widgets = widgets;

  Page _activePage;
  Page get activePage => _$this._activePage;
  set activePage(Page activePage) => _$this._activePage = activePage;

  Page _defaultPage;
  Page get defaultPage => _$this._defaultPage;
  set defaultPage(Page defaultPage) => _$this._defaultPage = defaultPage;

  List<Page> _bottomNavigation;
  List<Page> get bottomNavigation => _$this._bottomNavigation;
  set bottomNavigation(List<Page> bottomNavigation) =>
      _$this._bottomNavigation = bottomNavigation;

  Page _bottomNavigationPage;
  Page get bottomNavigationPage => _$this._bottomNavigationPage;
  set bottomNavigationPage(Page bottomNavigationPage) =>
      _$this._bottomNavigationPage = bottomNavigationPage;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _loading = _$v.loading;
      _subscriptions = _$v.subscriptions?.toBuilder();
      _widgets = _$v.widgets?.toBuilder();
      _activePage = _$v.activePage;
      _defaultPage = _$v.defaultPage;
      _bottomNavigation = _$v.bottomNavigation;
      _bottomNavigationPage = _$v.bottomNavigationPage;
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
              user: user,
              loading: loading,
              subscriptions: subscriptions.build(),
              widgets: widgets.build(),
              activePage: activePage,
              defaultPage: defaultPage,
              bottomNavigation: bottomNavigation,
              bottomNavigationPage: bottomNavigationPage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subscriptions';
        subscriptions.build();
        _$failedField = 'widgets';
        widgets.build();
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
