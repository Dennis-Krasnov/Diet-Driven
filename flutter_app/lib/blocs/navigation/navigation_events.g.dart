// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitNavigation extends InitNavigation {
  factory _$InitNavigation([void Function(InitNavigationBuilder) updates]) =>
      (new InitNavigationBuilder()..update(updates)).build();

  _$InitNavigation._() : super._();

  @override
  InitNavigation rebuild(void Function(InitNavigationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitNavigationBuilder toBuilder() =>
      new InitNavigationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitNavigation;
  }

  @override
  int get hashCode {
    return 596236327;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('InitNavigation').toString();
  }
}

class InitNavigationBuilder
    implements Builder<InitNavigation, InitNavigationBuilder> {
  _$InitNavigation _$v;

  InitNavigationBuilder();

  @override
  void replace(InitNavigation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitNavigation;
  }

  @override
  void update(void Function(InitNavigationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitNavigation build() {
    final _$result = _$v ?? new _$InitNavigation._();
    replace(_$result);
    return _$result;
  }
}

class _$ResetNavigation extends ResetNavigation {
  @override
  final Page defaultPage;

  factory _$ResetNavigation([void Function(ResetNavigationBuilder) updates]) =>
      (new ResetNavigationBuilder()..update(updates)).build();

  _$ResetNavigation._({this.defaultPage}) : super._() {
    if (defaultPage == null) {
      throw new BuiltValueNullFieldError('ResetNavigation', 'defaultPage');
    }
  }

  @override
  ResetNavigation rebuild(void Function(ResetNavigationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetNavigationBuilder toBuilder() =>
      new ResetNavigationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetNavigation && defaultPage == other.defaultPage;
  }

  @override
  int get hashCode {
    return $jf($jc(0, defaultPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResetNavigation')
          ..add('defaultPage', defaultPage))
        .toString();
  }
}

class ResetNavigationBuilder
    implements Builder<ResetNavigation, ResetNavigationBuilder> {
  _$ResetNavigation _$v;

  Page _defaultPage;
  Page get defaultPage => _$this._defaultPage;
  set defaultPage(Page defaultPage) => _$this._defaultPage = defaultPage;

  ResetNavigationBuilder();

  ResetNavigationBuilder get _$this {
    if (_$v != null) {
      _defaultPage = _$v.defaultPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetNavigation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetNavigation;
  }

  @override
  void update(void Function(ResetNavigationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetNavigation build() {
    final _$result = _$v ?? new _$ResetNavigation._(defaultPage: defaultPage);
    replace(_$result);
    return _$result;
  }
}

class _$Navigate extends Navigate {
  @override
  final Page page;
  @override
  final BuiltList<DeepLink> deepLinks;

  factory _$Navigate([void Function(NavigateBuilder) updates]) =>
      (new NavigateBuilder()..update(updates)).build();

  _$Navigate._({this.page, this.deepLinks}) : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('Navigate', 'page');
    }
    if (deepLinks == null) {
      throw new BuiltValueNullFieldError('Navigate', 'deepLinks');
    }
  }

  @override
  Navigate rebuild(void Function(NavigateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateBuilder toBuilder() => new NavigateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Navigate &&
        page == other.page &&
        deepLinks == other.deepLinks;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), deepLinks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Navigate')
          ..add('page', page)
          ..add('deepLinks', deepLinks))
        .toString();
  }
}

class NavigateBuilder implements Builder<Navigate, NavigateBuilder> {
  _$Navigate _$v;

  Page _page;
  Page get page => _$this._page;
  set page(Page page) => _$this._page = page;

  ListBuilder<DeepLink> _deepLinks;
  ListBuilder<DeepLink> get deepLinks =>
      _$this._deepLinks ??= new ListBuilder<DeepLink>();
  set deepLinks(ListBuilder<DeepLink> deepLinks) =>
      _$this._deepLinks = deepLinks;

  NavigateBuilder();

  NavigateBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _deepLinks = _$v.deepLinks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Navigate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Navigate;
  }

  @override
  void update(void Function(NavigateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Navigate build() {
    _$Navigate _$result;
    try {
      _$result =
          _$v ?? new _$Navigate._(page: page, deepLinks: deepLinks.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLinks';
        deepLinks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Navigate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SwitchTab extends SwitchTab {
  @override
  final Page to;

  factory _$SwitchTab([void Function(SwitchTabBuilder) updates]) =>
      (new SwitchTabBuilder()..update(updates)).build();

  _$SwitchTab._({this.to}) : super._() {
    if (to == null) {
      throw new BuiltValueNullFieldError('SwitchTab', 'to');
    }
  }

  @override
  SwitchTab rebuild(void Function(SwitchTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwitchTabBuilder toBuilder() => new SwitchTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwitchTab && to == other.to;
  }

  @override
  int get hashCode {
    return $jf($jc(0, to.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SwitchTab')..add('to', to)).toString();
  }
}

class SwitchTabBuilder implements Builder<SwitchTab, SwitchTabBuilder> {
  _$SwitchTab _$v;

  Page _to;
  Page get to => _$this._to;
  set to(Page to) => _$this._to = to;

  SwitchTabBuilder();

  SwitchTabBuilder get _$this {
    if (_$v != null) {
      _to = _$v.to;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SwitchTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SwitchTab;
  }

  @override
  void update(void Function(SwitchTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SwitchTab build() {
    final _$result = _$v ?? new _$SwitchTab._(to: to);
    replace(_$result);
    return _$result;
  }
}

class _$Push extends Push {
  @override
  final DeepLink deepLink;
  @override
  final Completer completer;

  factory _$Push([void Function(PushBuilder) updates]) =>
      (new PushBuilder()..update(updates)).build();

  _$Push._({this.deepLink, this.completer}) : super._() {
    if (deepLink == null) {
      throw new BuiltValueNullFieldError('Push', 'deepLink');
    }
  }

  @override
  Push rebuild(void Function(PushBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PushBuilder toBuilder() => new PushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Push &&
        deepLink == other.deepLink &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Push')
          ..add('deepLink', deepLink)
          ..add('completer', completer))
        .toString();
  }
}

class PushBuilder implements Builder<Push, PushBuilder> {
  _$Push _$v;

  DeepLink _deepLink;
  DeepLink get deepLink => _$this._deepLink;
  set deepLink(DeepLink deepLink) => _$this._deepLink = deepLink;

  Completer _completer;
  Completer get completer => _$this._completer;
  set completer(Completer completer) => _$this._completer = completer;

  PushBuilder();

  PushBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink;
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Push other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Push;
  }

  @override
  void update(void Function(PushBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Push build() {
    final _$result =
        _$v ?? new _$Push._(deepLink: deepLink, completer: completer);
    replace(_$result);
    return _$result;
  }
}

class _$Pop extends Pop {
  factory _$Pop([void Function(PopBuilder) updates]) =>
      (new PopBuilder()..update(updates)).build();

  _$Pop._() : super._();

  @override
  Pop rebuild(void Function(PopBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PopBuilder toBuilder() => new PopBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pop;
  }

  @override
  int get hashCode {
    return 27312366;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Pop').toString();
  }
}

class PopBuilder implements Builder<Pop, PopBuilder> {
  _$Pop _$v;

  PopBuilder();

  @override
  void replace(Pop other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pop;
  }

  @override
  void update(void Function(PopBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pop build() {
    final _$result = _$v ?? new _$Pop._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
