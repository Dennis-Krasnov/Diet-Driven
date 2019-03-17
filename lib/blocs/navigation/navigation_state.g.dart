// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigationState extends NavigationState {
  @override
  final BuiltList<String> bottomNavigationPages;
  @override
  final String currentPage;

  factory _$NavigationState([void updates(NavigationStateBuilder b)]) =>
      (new NavigationStateBuilder()..update(updates)).build();

  _$NavigationState._({this.bottomNavigationPages, this.currentPage})
      : super._() {
    if (bottomNavigationPages == null) {
      throw new BuiltValueNullFieldError(
          'NavigationState', 'bottomNavigationPages');
    }
    if (currentPage == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'currentPage');
    }
  }

  @override
  NavigationState rebuild(void updates(NavigationStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationStateBuilder toBuilder() =>
      new NavigationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationState &&
        bottomNavigationPages == other.bottomNavigationPages &&
        currentPage == other.currentPage;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, bottomNavigationPages.hashCode), currentPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationState')
          ..add('bottomNavigationPages', bottomNavigationPages)
          ..add('currentPage', currentPage))
        .toString();
  }
}

class NavigationStateBuilder
    implements Builder<NavigationState, NavigationStateBuilder> {
  _$NavigationState _$v;

  ListBuilder<String> _bottomNavigationPages;
  ListBuilder<String> get bottomNavigationPages =>
      _$this._bottomNavigationPages ??= new ListBuilder<String>();
  set bottomNavigationPages(ListBuilder<String> bottomNavigationPages) =>
      _$this._bottomNavigationPages = bottomNavigationPages;

  String _currentPage;
  String get currentPage => _$this._currentPage;
  set currentPage(String currentPage) => _$this._currentPage = currentPage;

  NavigationStateBuilder();

  NavigationStateBuilder get _$this {
    if (_$v != null) {
      _bottomNavigationPages = _$v.bottomNavigationPages?.toBuilder();
      _currentPage = _$v.currentPage;
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
    _$NavigationState _$result;
    try {
      _$result = _$v ??
          new _$NavigationState._(
              bottomNavigationPages: bottomNavigationPages.build(),
              currentPage: currentPage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bottomNavigationPages';
        bottomNavigationPages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigationState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
