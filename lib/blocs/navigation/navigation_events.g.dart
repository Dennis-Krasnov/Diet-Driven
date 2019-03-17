// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigateToPage extends NavigateToPage {
  @override
  final String page;

  factory _$NavigateToPage([void updates(NavigateToPageBuilder b)]) =>
      (new NavigateToPageBuilder()..update(updates)).build();

  _$NavigateToPage._({this.page}) : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('NavigateToPage', 'page');
    }
  }

  @override
  NavigateToPage rebuild(void updates(NavigateToPageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToPageBuilder toBuilder() =>
      new NavigateToPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToPage && page == other.page;
  }

  @override
  int get hashCode {
    return $jf($jc(0, page.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToPage')..add('page', page))
        .toString();
  }
}

class NavigateToPageBuilder
    implements Builder<NavigateToPage, NavigateToPageBuilder> {
  _$NavigateToPage _$v;

  String _page;
  String get page => _$this._page;
  set page(String page) => _$this._page = page;

  NavigateToPageBuilder();

  NavigateToPageBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigateToPage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToPage;
  }

  @override
  void update(void updates(NavigateToPageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToPage build() {
    final _$result = _$v ?? new _$NavigateToPage._(page: page);
    replace(_$result);
    return _$result;
  }
}

class _$ReorderNavigation extends ReorderNavigation {
  @override
  final BuiltList<String> bottomNavigationPages;

  factory _$ReorderNavigation([void updates(ReorderNavigationBuilder b)]) =>
      (new ReorderNavigationBuilder()..update(updates)).build();

  _$ReorderNavigation._({this.bottomNavigationPages}) : super._() {
    if (bottomNavigationPages == null) {
      throw new BuiltValueNullFieldError(
          'ReorderNavigation', 'bottomNavigationPages');
    }
  }

  @override
  ReorderNavigation rebuild(void updates(ReorderNavigationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ReorderNavigationBuilder toBuilder() =>
      new ReorderNavigationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReorderNavigation &&
        bottomNavigationPages == other.bottomNavigationPages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, bottomNavigationPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReorderNavigation')
          ..add('bottomNavigationPages', bottomNavigationPages))
        .toString();
  }
}

class ReorderNavigationBuilder
    implements Builder<ReorderNavigation, ReorderNavigationBuilder> {
  _$ReorderNavigation _$v;

  ListBuilder<String> _bottomNavigationPages;
  ListBuilder<String> get bottomNavigationPages =>
      _$this._bottomNavigationPages ??= new ListBuilder<String>();
  set bottomNavigationPages(ListBuilder<String> bottomNavigationPages) =>
      _$this._bottomNavigationPages = bottomNavigationPages;

  ReorderNavigationBuilder();

  ReorderNavigationBuilder get _$this {
    if (_$v != null) {
      _bottomNavigationPages = _$v.bottomNavigationPages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReorderNavigation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReorderNavigation;
  }

  @override
  void update(void updates(ReorderNavigationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ReorderNavigation build() {
    _$ReorderNavigation _$result;
    try {
      _$result = _$v ??
          new _$ReorderNavigation._(
              bottomNavigationPages: bottomNavigationPages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bottomNavigationPages';
        bottomNavigationPages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReorderNavigation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
