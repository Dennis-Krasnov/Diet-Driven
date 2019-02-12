// GENERATED CODE - DO NOT MODIFY BY HAND

part of navigation_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigationState extends NavigationState {
  @override
  final Page activePage;
  @override
  final Page defaultPage;
  @override
  final List<Page> bottomNavigation;
  @override
  final Page bottomNavigationPage;

  factory _$NavigationState([void updates(NavigationStateBuilder b)]) =>
      (new NavigationStateBuilder()..update(updates)).build()
          as _$NavigationState;

  _$NavigationState._(
      {this.activePage,
      this.defaultPage,
      this.bottomNavigation,
      this.bottomNavigationPage})
      : super._() {
    if (activePage == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'activePage');
    }
    if (defaultPage == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'defaultPage');
    }
    if (bottomNavigation == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'bottomNavigation');
    }
  }

  @override
  NavigationState rebuild(void updates(NavigationStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigationStateBuilder toBuilder() =>
      new _$NavigationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationState &&
        activePage == other.activePage &&
        defaultPage == other.defaultPage &&
        bottomNavigation == other.bottomNavigation &&
        bottomNavigationPage == other.bottomNavigationPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, activePage.hashCode), defaultPage.hashCode),
            bottomNavigation.hashCode),
        bottomNavigationPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationState')
          ..add('activePage', activePage)
          ..add('defaultPage', defaultPage)
          ..add('bottomNavigation', bottomNavigation)
          ..add('bottomNavigationPage', bottomNavigationPage))
        .toString();
  }
}

class _$NavigationStateBuilder extends NavigationStateBuilder {
  _$NavigationState _$v;

  @override
  Page get activePage {
    _$this;
    return super.activePage;
  }

  @override
  set activePage(Page activePage) {
    _$this;
    super.activePage = activePage;
  }

  @override
  Page get defaultPage {
    _$this;
    return super.defaultPage;
  }

  @override
  set defaultPage(Page defaultPage) {
    _$this;
    super.defaultPage = defaultPage;
  }

  @override
  List<Page> get bottomNavigation {
    _$this;
    return super.bottomNavigation;
  }

  @override
  set bottomNavigation(List<Page> bottomNavigation) {
    _$this;
    super.bottomNavigation = bottomNavigation;
  }

  @override
  Page get bottomNavigationPage {
    _$this;
    return super.bottomNavigationPage;
  }

  @override
  set bottomNavigationPage(Page bottomNavigationPage) {
    _$this;
    super.bottomNavigationPage = bottomNavigationPage;
  }

  _$NavigationStateBuilder() : super._();

  NavigationStateBuilder get _$this {
    if (_$v != null) {
      super.activePage = _$v.activePage;
      super.defaultPage = _$v.defaultPage;
      super.bottomNavigation = _$v.bottomNavigation;
      super.bottomNavigationPage = _$v.bottomNavigationPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationState;
  }

  @override
  void update(void updates(NavigationStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationState build() {
    final _$result = _$v ??
        new _$NavigationState._(
            activePage: activePage,
            defaultPage: defaultPage,
            bottomNavigation: bottomNavigation,
            bottomNavigationPage: bottomNavigationPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
