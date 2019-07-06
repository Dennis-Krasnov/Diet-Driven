// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class NavigationStateBuilder {
  void replace(NavigationState other);
  void update(void Function(NavigationStateBuilder) updates);
  Page get page;
  set page(Page page);

  DeepLink get deepLink;
  set deepLink(DeepLink deepLink);
}

class _$NavigationUninitialized extends NavigationUninitialized {
  @override
  final Page page;
  @override
  final DeepLink deepLink;

  factory _$NavigationUninitialized(
          [void Function(NavigationUninitializedBuilder) updates]) =>
      (new NavigationUninitializedBuilder()..update(updates)).build();

  _$NavigationUninitialized._({this.page, this.deepLink}) : super._();

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
    return other is NavigationUninitialized &&
        page == other.page &&
        deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLink.hashCode));
  }
}

class NavigationUninitializedBuilder
    implements
        Builder<NavigationUninitialized, NavigationUninitializedBuilder>,
        NavigationStateBuilder {
  _$NavigationUninitialized _$v;

  Page _page;
  Page get page => _$this._page;
  set page(Page page) => _$this._page = page;

  DeepLink _deepLink;
  DeepLink get deepLink => _$this._deepLink;
  set deepLink(DeepLink deepLink) => _$this._deepLink = deepLink;

  NavigationUninitializedBuilder();

  NavigationUninitializedBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationUninitialized other) {
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
    final _$result =
        _$v ?? new _$NavigationUninitialized._(page: page, deepLink: deepLink);
    replace(_$result);
    return _$result;
  }
}

class _$DiaryTab extends DiaryTab {
  @override
  final Page page;
  @override
  final DeepLink deepLink;

  factory _$DiaryTab([void Function(DiaryTabBuilder) updates]) =>
      (new DiaryTabBuilder()..update(updates)).build() as _$DiaryTab;

  _$DiaryTab._({this.page, this.deepLink}) : super._();

  @override
  DiaryTab rebuild(void Function(DiaryTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$DiaryTabBuilder toBuilder() => new _$DiaryTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryTab &&
        page == other.page &&
        deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryTab')
          ..add('page', page)
          ..add('deepLink', deepLink))
        .toString();
  }
}

class _$DiaryTabBuilder extends DiaryTabBuilder {
  _$DiaryTab _$v;

  @override
  Page get page {
    _$this;
    return super.page;
  }

  @override
  set page(Page page) {
    _$this;
    super.page = page;
  }

  @override
  DeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(DeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  _$DiaryTabBuilder() : super._();

  DiaryTabBuilder get _$this {
    if (_$v != null) {
      super.page = _$v.page;
      super.deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiaryTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryTab;
  }

  @override
  void update(void Function(DiaryTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryTab build() {
    final _$result = _$v ?? new _$DiaryTab._(page: page, deepLink: deepLink);
    replace(_$result);
    return _$result;
  }
}

class _$TrackTab extends TrackTab {
  @override
  final Page page;
  @override
  final DeepLink deepLink;

  factory _$TrackTab([void Function(TrackTabBuilder) updates]) =>
      (new TrackTabBuilder()..update(updates)).build() as _$TrackTab;

  _$TrackTab._({this.page, this.deepLink}) : super._();

  @override
  TrackTab rebuild(void Function(TrackTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$TrackTabBuilder toBuilder() => new _$TrackTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackTab &&
        page == other.page &&
        deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrackTab')
          ..add('page', page)
          ..add('deepLink', deepLink))
        .toString();
  }
}

class _$TrackTabBuilder extends TrackTabBuilder {
  _$TrackTab _$v;

  @override
  Page get page {
    _$this;
    return super.page;
  }

  @override
  set page(Page page) {
    _$this;
    super.page = page;
  }

  @override
  DeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(DeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  _$TrackTabBuilder() : super._();

  TrackTabBuilder get _$this {
    if (_$v != null) {
      super.page = _$v.page;
      super.deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TrackTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TrackTab;
  }

  @override
  void update(void Function(TrackTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TrackTab build() {
    final _$result = _$v ?? new _$TrackTab._(page: page, deepLink: deepLink);
    replace(_$result);
    return _$result;
  }
}

class _$ReportsTab extends ReportsTab {
  @override
  final Page page;
  @override
  final DeepLink deepLink;

  factory _$ReportsTab([void Function(ReportsTabBuilder) updates]) =>
      (new ReportsTabBuilder()..update(updates)).build() as _$ReportsTab;

  _$ReportsTab._({this.page, this.deepLink}) : super._();

  @override
  ReportsTab rebuild(void Function(ReportsTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ReportsTabBuilder toBuilder() => new _$ReportsTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsTab &&
        page == other.page &&
        deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReportsTab')
          ..add('page', page)
          ..add('deepLink', deepLink))
        .toString();
  }
}

class _$ReportsTabBuilder extends ReportsTabBuilder {
  _$ReportsTab _$v;

  @override
  Page get page {
    _$this;
    return super.page;
  }

  @override
  set page(Page page) {
    _$this;
    super.page = page;
  }

  @override
  DeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(DeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  _$ReportsTabBuilder() : super._();

  ReportsTabBuilder get _$this {
    if (_$v != null) {
      super.page = _$v.page;
      super.deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReportsTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReportsTab;
  }

  @override
  void update(void Function(ReportsTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReportsTab build() {
    final _$result = _$v ?? new _$ReportsTab._(page: page, deepLink: deepLink);
    replace(_$result);
    return _$result;
  }
}

class _$SettingsTab extends SettingsTab {
  @override
  final Page page;
  @override
  final DeepLink deepLink;

  factory _$SettingsTab([void Function(SettingsTabBuilder) updates]) =>
      (new SettingsTabBuilder()..update(updates)).build() as _$SettingsTab;

  _$SettingsTab._({this.page, this.deepLink}) : super._();

  @override
  SettingsTab rebuild(void Function(SettingsTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$SettingsTabBuilder toBuilder() => new _$SettingsTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsTab &&
        page == other.page &&
        deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsTab')
          ..add('page', page)
          ..add('deepLink', deepLink))
        .toString();
  }
}

class _$SettingsTabBuilder extends SettingsTabBuilder {
  _$SettingsTab _$v;

  @override
  Page get page {
    _$this;
    return super.page;
  }

  @override
  set page(Page page) {
    _$this;
    super.page = page;
  }

  @override
  DeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(DeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  _$SettingsTabBuilder() : super._();

  SettingsTabBuilder get _$this {
    if (_$v != null) {
      super.page = _$v.page;
      super.deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SettingsTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsTab;
  }

  @override
  void update(void Function(SettingsTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsTab build() {
    final _$result = _$v ?? new _$SettingsTab._(page: page, deepLink: deepLink);
    replace(_$result);
    return _$result;
  }
}

class _$LoggingTab extends LoggingTab {
  @override
  final Page page;
  @override
  final DeepLink deepLink;

  factory _$LoggingTab([void Function(LoggingTabBuilder) updates]) =>
      (new LoggingTabBuilder()..update(updates)).build() as _$LoggingTab;

  _$LoggingTab._({this.page, this.deepLink}) : super._();

  @override
  LoggingTab rebuild(void Function(LoggingTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$LoggingTabBuilder toBuilder() => new _$LoggingTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoggingTab &&
        page == other.page &&
        deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoggingTab')
          ..add('page', page)
          ..add('deepLink', deepLink))
        .toString();
  }
}

class _$LoggingTabBuilder extends LoggingTabBuilder {
  _$LoggingTab _$v;

  @override
  Page get page {
    _$this;
    return super.page;
  }

  @override
  set page(Page page) {
    _$this;
    super.page = page;
  }

  @override
  DeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(DeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  _$LoggingTabBuilder() : super._();

  LoggingTabBuilder get _$this {
    if (_$v != null) {
      super.page = _$v.page;
      super.deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LoggingTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoggingTab;
  }

  @override
  void update(void Function(LoggingTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoggingTab build() {
    final _$result = _$v ?? new _$LoggingTab._(page: page, deepLink: deepLink);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
