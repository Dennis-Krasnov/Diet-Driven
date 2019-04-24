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

class _$NavigationLoaded extends NavigationLoaded {
  @override
  final Page currentPage;

  factory _$NavigationLoaded(
          [void Function(NavigationLoadedBuilder) updates]) =>
      (new NavigationLoadedBuilder()..update(updates)).build();

  _$NavigationLoaded._({this.currentPage}) : super._() {
    if (currentPage == null) {
      throw new BuiltValueNullFieldError('NavigationLoaded', 'currentPage');
    }
  }

  @override
  NavigationLoaded rebuild(void Function(NavigationLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationLoadedBuilder toBuilder() =>
      new NavigationLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationLoaded && currentPage == other.currentPage;
  }

  @override
  int get hashCode {
    return $jf($jc(0, currentPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationLoaded')
          ..add('currentPage', currentPage))
        .toString();
  }
}

class NavigationLoadedBuilder
    implements Builder<NavigationLoaded, NavigationLoadedBuilder> {
  _$NavigationLoaded _$v;

  Page _currentPage;
  Page get currentPage => _$this._currentPage;
  set currentPage(Page currentPage) => _$this._currentPage = currentPage;

  NavigationLoadedBuilder();

  NavigationLoadedBuilder get _$this {
    if (_$v != null) {
      _currentPage = _$v.currentPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationLoaded;
  }

  @override
  void update(void Function(NavigationLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationLoaded build() {
    final _$result = _$v ?? new _$NavigationLoaded._(currentPage: currentPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
