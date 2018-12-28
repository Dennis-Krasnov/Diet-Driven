// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final int count;
  @override
  final Page activePage;
  @override
  final List<Page> bottomNavigation;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.count, this.activePage, this.bottomNavigation})
      : super._() {
    if (count == null) {
      throw new BuiltValueNullFieldError('AppState', 'count');
    }
    if (activePage == null) {
      throw new BuiltValueNullFieldError('AppState', 'activePage');
    }
    if (bottomNavigation == null) {
      throw new BuiltValueNullFieldError('AppState', 'bottomNavigation');
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
        count == other.count &&
        activePage == other.activePage &&
        bottomNavigation == other.bottomNavigation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, count.hashCode), activePage.hashCode),
        bottomNavigation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('count', count)
          ..add('activePage', activePage)
          ..add('bottomNavigation', bottomNavigation))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  Page _activePage;
  Page get activePage => _$this._activePage;
  set activePage(Page activePage) => _$this._activePage = activePage;

  List<Page> _bottomNavigation;
  List<Page> get bottomNavigation => _$this._bottomNavigation;
  set bottomNavigation(List<Page> bottomNavigation) =>
      _$this._bottomNavigation = bottomNavigation;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _activePage = _$v.activePage;
      _bottomNavigation = _$v.bottomNavigation;
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
    final _$result = _$v ??
        new _$AppState._(
            count: count,
            activePage: activePage,
            bottomNavigation: bottomNavigation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
