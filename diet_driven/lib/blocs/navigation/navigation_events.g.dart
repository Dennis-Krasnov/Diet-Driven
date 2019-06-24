// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class NavigationEventBuilder {
  void replace(NavigationEvent other);
  void update(void Function(NavigationEventBuilder) updates);
  bool get onlyIfUninitialized;
  set onlyIfUninitialized(bool onlyIfUninitialized);
}

class _$ClearDeepLink extends ClearDeepLink {
  @override
  final bool onlyIfUninitialized;

  factory _$ClearDeepLink([void Function(ClearDeepLinkBuilder) updates]) =>
      (new ClearDeepLinkBuilder()..update(updates)).build() as _$ClearDeepLink;

  _$ClearDeepLink._({this.onlyIfUninitialized}) : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'ClearDeepLink', 'onlyIfUninitialized');
    }
  }

  @override
  ClearDeepLink rebuild(void Function(ClearDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ClearDeepLinkBuilder toBuilder() =>
      new _$ClearDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearDeepLink &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc(0, onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClearDeepLink')
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$ClearDeepLinkBuilder extends ClearDeepLinkBuilder {
  _$ClearDeepLink _$v;

  @override
  bool get onlyIfUninitialized {
    _$this;
    return super.onlyIfUninitialized;
  }

  @override
  set onlyIfUninitialized(bool onlyIfUninitialized) {
    _$this;
    super.onlyIfUninitialized = onlyIfUninitialized;
  }

  _$ClearDeepLinkBuilder() : super._();

  ClearDeepLinkBuilder get _$this {
    if (_$v != null) {
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ClearDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClearDeepLink;
  }

  @override
  void update(void Function(ClearDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClearDeepLink build() {
    final _$result =
        _$v ?? new _$ClearDeepLink._(onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToDiary extends NavigateToDiary {
  @override
  final DiaryDeepLink deepLink;
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToDiary([void Function(NavigateToDiaryBuilder) updates]) =>
      (new NavigateToDiaryBuilder()..update(updates)).build()
          as _$NavigateToDiary;

  _$NavigateToDiary._({this.deepLink, this.onlyIfUninitialized}) : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToDiary', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToDiary rebuild(void Function(NavigateToDiaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigateToDiaryBuilder toBuilder() =>
      new _$NavigateToDiaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToDiary &&
        deepLink == other.deepLink &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToDiary')
          ..add('deepLink', deepLink)
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToDiaryBuilder extends NavigateToDiaryBuilder {
  _$NavigateToDiary _$v;

  @override
  DiaryDeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(DiaryDeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  @override
  bool get onlyIfUninitialized {
    _$this;
    return super.onlyIfUninitialized;
  }

  @override
  set onlyIfUninitialized(bool onlyIfUninitialized) {
    _$this;
    super.onlyIfUninitialized = onlyIfUninitialized;
  }

  _$NavigateToDiaryBuilder() : super._();

  NavigateToDiaryBuilder get _$this {
    if (_$v != null) {
      super.deepLink = _$v.deepLink;
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToDiary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToDiary;
  }

  @override
  void update(void Function(NavigateToDiaryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToDiary build() {
    final _$result = _$v ??
        new _$NavigateToDiary._(
            deepLink: deepLink, onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

class _$DateDeepLink extends DateDeepLink {
  @override
  final int date;

  factory _$DateDeepLink([void Function(DateDeepLinkBuilder) updates]) =>
      (new DateDeepLinkBuilder()..update(updates)).build();

  _$DateDeepLink._({this.date}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('DateDeepLink', 'date');
    }
  }

  @override
  DateDeepLink rebuild(void Function(DateDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateDeepLinkBuilder toBuilder() => new DateDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateDeepLink && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateDeepLink')..add('date', date))
        .toString();
  }
}

class DateDeepLinkBuilder
    implements Builder<DateDeepLink, DateDeepLinkBuilder> {
  _$DateDeepLink _$v;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  DateDeepLinkBuilder();

  DateDeepLinkBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DateDeepLink;
  }

  @override
  void update(void Function(DateDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DateDeepLink build() {
    final _$result = _$v ?? new _$DateDeepLink._(date: date);
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToTrack extends NavigateToTrack {
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToTrack([void Function(NavigateToTrackBuilder) updates]) =>
      (new NavigateToTrackBuilder()..update(updates)).build()
          as _$NavigateToTrack;

  _$NavigateToTrack._({this.onlyIfUninitialized}) : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToTrack', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToTrack rebuild(void Function(NavigateToTrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigateToTrackBuilder toBuilder() =>
      new _$NavigateToTrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToTrack &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc(0, onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToTrack')
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToTrackBuilder extends NavigateToTrackBuilder {
  _$NavigateToTrack _$v;

  @override
  bool get onlyIfUninitialized {
    _$this;
    return super.onlyIfUninitialized;
  }

  @override
  set onlyIfUninitialized(bool onlyIfUninitialized) {
    _$this;
    super.onlyIfUninitialized = onlyIfUninitialized;
  }

  _$NavigateToTrackBuilder() : super._();

  NavigateToTrackBuilder get _$this {
    if (_$v != null) {
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToTrack other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToTrack;
  }

  @override
  void update(void Function(NavigateToTrackBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToTrack build() {
    final _$result = _$v ??
        new _$NavigateToTrack._(onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToReports extends NavigateToReports {
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToReports(
          [void Function(NavigateToReportsBuilder) updates]) =>
      (new NavigateToReportsBuilder()..update(updates)).build()
          as _$NavigateToReports;

  _$NavigateToReports._({this.onlyIfUninitialized}) : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToReports', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToReports rebuild(void Function(NavigateToReportsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigateToReportsBuilder toBuilder() =>
      new _$NavigateToReportsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToReports &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc(0, onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToReports')
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToReportsBuilder extends NavigateToReportsBuilder {
  _$NavigateToReports _$v;

  @override
  bool get onlyIfUninitialized {
    _$this;
    return super.onlyIfUninitialized;
  }

  @override
  set onlyIfUninitialized(bool onlyIfUninitialized) {
    _$this;
    super.onlyIfUninitialized = onlyIfUninitialized;
  }

  _$NavigateToReportsBuilder() : super._();

  NavigateToReportsBuilder get _$this {
    if (_$v != null) {
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToReports other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToReports;
  }

  @override
  void update(void Function(NavigateToReportsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToReports build() {
    final _$result = _$v ??
        new _$NavigateToReports._(onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToSettings extends NavigateToSettings {
  @override
  final SettingsDeepLink deepLink;
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToSettings(
          [void Function(NavigateToSettingsBuilder) updates]) =>
      (new NavigateToSettingsBuilder()..update(updates)).build()
          as _$NavigateToSettings;

  _$NavigateToSettings._({this.deepLink, this.onlyIfUninitialized})
      : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToSettings', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToSettings rebuild(
          void Function(NavigateToSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigateToSettingsBuilder toBuilder() =>
      new _$NavigateToSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToSettings &&
        deepLink == other.deepLink &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToSettings')
          ..add('deepLink', deepLink)
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToSettingsBuilder extends NavigateToSettingsBuilder {
  _$NavigateToSettings _$v;

  @override
  SettingsDeepLink get deepLink {
    _$this;
    return super.deepLink;
  }

  @override
  set deepLink(SettingsDeepLink deepLink) {
    _$this;
    super.deepLink = deepLink;
  }

  @override
  bool get onlyIfUninitialized {
    _$this;
    return super.onlyIfUninitialized;
  }

  @override
  set onlyIfUninitialized(bool onlyIfUninitialized) {
    _$this;
    super.onlyIfUninitialized = onlyIfUninitialized;
  }

  _$NavigateToSettingsBuilder() : super._();

  NavigateToSettingsBuilder get _$this {
    if (_$v != null) {
      super.deepLink = _$v.deepLink;
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToSettings;
  }

  @override
  void update(void Function(NavigateToSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToSettings build() {
    final _$result = _$v ??
        new _$NavigateToSettings._(
            deepLink: deepLink, onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

class _$ProfileDeepLink extends ProfileDeepLink {
  factory _$ProfileDeepLink([void Function(ProfileDeepLinkBuilder) updates]) =>
      (new ProfileDeepLinkBuilder()..update(updates)).build();

  _$ProfileDeepLink._() : super._();

  @override
  ProfileDeepLink rebuild(void Function(ProfileDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDeepLinkBuilder toBuilder() =>
      new ProfileDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileDeepLink;
  }

  @override
  int get hashCode {
    return 999881030;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ProfileDeepLink').toString();
  }
}

class ProfileDeepLinkBuilder
    implements Builder<ProfileDeepLink, ProfileDeepLinkBuilder> {
  _$ProfileDeepLink _$v;

  ProfileDeepLinkBuilder();

  @override
  void replace(ProfileDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileDeepLink;
  }

  @override
  void update(void Function(ProfileDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileDeepLink build() {
    final _$result = _$v ?? new _$ProfileDeepLink._();
    replace(_$result);
    return _$result;
  }
}

class _$SubscriptionDeepLink extends SubscriptionDeepLink {
  @override
  final SubscriptionType subscriptionType;

  factory _$SubscriptionDeepLink(
          [void Function(SubscriptionDeepLinkBuilder) updates]) =>
      (new SubscriptionDeepLinkBuilder()..update(updates)).build();

  _$SubscriptionDeepLink._({this.subscriptionType}) : super._();

  @override
  SubscriptionDeepLink rebuild(
          void Function(SubscriptionDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionDeepLinkBuilder toBuilder() =>
      new SubscriptionDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionDeepLink &&
        subscriptionType == other.subscriptionType;
  }

  @override
  int get hashCode {
    return $jf($jc(0, subscriptionType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionDeepLink')
          ..add('subscriptionType', subscriptionType))
        .toString();
  }
}

class SubscriptionDeepLinkBuilder
    implements Builder<SubscriptionDeepLink, SubscriptionDeepLinkBuilder> {
  _$SubscriptionDeepLink _$v;

  SubscriptionType _subscriptionType;
  SubscriptionType get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  SubscriptionDeepLinkBuilder();

  SubscriptionDeepLinkBuilder get _$this {
    if (_$v != null) {
      _subscriptionType = _$v.subscriptionType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubscriptionDeepLink;
  }

  @override
  void update(void Function(SubscriptionDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionDeepLink build() {
    final _$result =
        _$v ?? new _$SubscriptionDeepLink._(subscriptionType: subscriptionType);
    replace(_$result);
    return _$result;
  }
}

class _$ThemeDeepLink extends ThemeDeepLink {
  factory _$ThemeDeepLink([void Function(ThemeDeepLinkBuilder) updates]) =>
      (new ThemeDeepLinkBuilder()..update(updates)).build();

  _$ThemeDeepLink._() : super._();

  @override
  ThemeDeepLink rebuild(void Function(ThemeDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeDeepLinkBuilder toBuilder() => new ThemeDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeDeepLink;
  }

  @override
  int get hashCode {
    return 165948376;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ThemeDeepLink').toString();
  }
}

class ThemeDeepLinkBuilder
    implements Builder<ThemeDeepLink, ThemeDeepLinkBuilder> {
  _$ThemeDeepLink _$v;

  ThemeDeepLinkBuilder();

  @override
  void replace(ThemeDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThemeDeepLink;
  }

  @override
  void update(void Function(ThemeDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeDeepLink build() {
    final _$result = _$v ?? new _$ThemeDeepLink._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
