// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigationUninitialized extends NavigationUninitialized {
  factory _$NavigationUninitialized(
          [void Function(NavigationUninitializedBuilder) updates]) =>
      (new NavigationUninitializedBuilder()..update(updates)).build();

  _$NavigationUninitialized._() : super._();

  @override
  NavigationUninitialized rebuild(
          void Function(NavigationUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationUninitializedBuilder toBuilder() =>
      new NavigationUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationUninitialized;
  }

  @override
  int get hashCode {
    return 70461045;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NavigationUninitialized').toString();
  }
}

class NavigationUninitializedBuilder
    implements
        Builder<NavigationUninitialized, NavigationUninitializedBuilder> {
  _$NavigationUninitialized _$v;

  NavigationUninitializedBuilder();

  @override
  void replace(NavigationUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationUninitialized;
  }

  @override
  void update(void Function(NavigationUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationUninitialized build() {
    final _$result = _$v ?? new _$NavigationUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$NavigationRoute extends NavigationRoute {
  @override
  final Page page;
  @override
  final BuiltMap<Page, BuiltList<DeepLink>> pageDeepLinks;
  @override
  final bool shouldAnimatePush;

  factory _$NavigationRoute([void Function(NavigationRouteBuilder) updates]) =>
      (new NavigationRouteBuilder()..update(updates)).build();

  _$NavigationRoute._({this.page, this.pageDeepLinks, this.shouldAnimatePush})
      : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('NavigationRoute', 'page');
    }
    if (pageDeepLinks == null) {
      throw new BuiltValueNullFieldError('NavigationRoute', 'pageDeepLinks');
    }
    if (shouldAnimatePush == null) {
      throw new BuiltValueNullFieldError(
          'NavigationRoute', 'shouldAnimatePush');
    }
  }

  @override
  NavigationRoute rebuild(void Function(NavigationRouteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationRouteBuilder toBuilder() =>
      new NavigationRouteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationRoute &&
        page == other.page &&
        pageDeepLinks == other.pageDeepLinks &&
        shouldAnimatePush == other.shouldAnimatePush;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, page.hashCode), pageDeepLinks.hashCode),
        shouldAnimatePush.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationRoute')
          ..add('page', page)
          ..add('pageDeepLinks', pageDeepLinks)
          ..add('shouldAnimatePush', shouldAnimatePush))
        .toString();
  }
}

class NavigationRouteBuilder
    implements Builder<NavigationRoute, NavigationRouteBuilder> {
  _$NavigationRoute _$v;

  Page _page;
  Page get page => _$this._page;
  set page(Page page) => _$this._page = page;

  MapBuilder<Page, BuiltList<DeepLink>> _pageDeepLinks;
  MapBuilder<Page, BuiltList<DeepLink>> get pageDeepLinks =>
      _$this._pageDeepLinks ??= new MapBuilder<Page, BuiltList<DeepLink>>();
  set pageDeepLinks(MapBuilder<Page, BuiltList<DeepLink>> pageDeepLinks) =>
      _$this._pageDeepLinks = pageDeepLinks;

  bool _shouldAnimatePush;
  bool get shouldAnimatePush => _$this._shouldAnimatePush;
  set shouldAnimatePush(bool shouldAnimatePush) =>
      _$this._shouldAnimatePush = shouldAnimatePush;

  NavigationRouteBuilder();

  NavigationRouteBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _pageDeepLinks = _$v.pageDeepLinks?.toBuilder();
      _shouldAnimatePush = _$v.shouldAnimatePush;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationRoute other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationRoute;
  }

  @override
  void update(void Function(NavigationRouteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationRoute build() {
    _$NavigationRoute _$result;
    try {
      _$result = _$v ??
          new _$NavigationRoute._(
              page: page,
              pageDeepLinks: pageDeepLinks.build(),
              shouldAnimatePush: shouldAnimatePush);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pageDeepLinks';
        pageDeepLinks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigationRoute', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
