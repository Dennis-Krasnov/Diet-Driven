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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
