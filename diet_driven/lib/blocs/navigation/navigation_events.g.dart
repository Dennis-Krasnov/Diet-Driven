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

class _$ClearDeepLink extends ClearDeepLink {
  factory _$ClearDeepLink([void Function(ClearDeepLinkBuilder) updates]) =>
      (new ClearDeepLinkBuilder()..update(updates)).build();

  _$ClearDeepLink._() : super._();

  @override
  ClearDeepLink rebuild(void Function(ClearDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearDeepLinkBuilder toBuilder() => new ClearDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearDeepLink;
  }

  @override
  int get hashCode {
    return 860407335;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ClearDeepLink').toString();
  }
}

class ClearDeepLinkBuilder
    implements Builder<ClearDeepLink, ClearDeepLinkBuilder> {
  _$ClearDeepLink _$v;

  ClearDeepLinkBuilder();

  @override
  void replace(ClearDeepLink other) {
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
    final _$result = _$v ?? new _$ClearDeepLink._();
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToDiary extends NavigateToDiary {
  @override
  final DiaryDeepLink deepLink;

  factory _$NavigateToDiary([void Function(NavigateToDiaryBuilder) updates]) =>
      (new NavigateToDiaryBuilder()..update(updates)).build();

  _$NavigateToDiary._({this.deepLink}) : super._();

  @override
  NavigateToDiary rebuild(void Function(NavigateToDiaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToDiaryBuilder toBuilder() =>
      new NavigateToDiaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToDiary && deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc(0, deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToDiary')
          ..add('deepLink', deepLink))
        .toString();
  }
}

class NavigateToDiaryBuilder
    implements Builder<NavigateToDiary, NavigateToDiaryBuilder> {
  _$NavigateToDiary _$v;

  DiaryDeepLink _deepLink;
  DiaryDeepLink get deepLink => _$this._deepLink;
  set deepLink(DiaryDeepLink deepLink) => _$this._deepLink = deepLink;

  NavigateToDiaryBuilder();

  NavigateToDiaryBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigateToDiary other) {
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
    final _$result = _$v ?? new _$NavigateToDiary._(deepLink: deepLink);
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
  factory _$NavigateToTrack([void Function(NavigateToTrackBuilder) updates]) =>
      (new NavigateToTrackBuilder()..update(updates)).build();

  _$NavigateToTrack._() : super._();

  @override
  NavigateToTrack rebuild(void Function(NavigateToTrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToTrackBuilder toBuilder() =>
      new NavigateToTrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToTrack;
  }

  @override
  int get hashCode {
    return 514238572;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NavigateToTrack').toString();
  }
}

class NavigateToTrackBuilder
    implements Builder<NavigateToTrack, NavigateToTrackBuilder> {
  _$NavigateToTrack _$v;

  NavigateToTrackBuilder();

  @override
  void replace(NavigateToTrack other) {
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
    final _$result = _$v ?? new _$NavigateToTrack._();
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToReports extends NavigateToReports {
  factory _$NavigateToReports(
          [void Function(NavigateToReportsBuilder) updates]) =>
      (new NavigateToReportsBuilder()..update(updates)).build();

  _$NavigateToReports._() : super._();

  @override
  NavigateToReports rebuild(void Function(NavigateToReportsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToReportsBuilder toBuilder() =>
      new NavigateToReportsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToReports;
  }

  @override
  int get hashCode {
    return 785110345;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NavigateToReports').toString();
  }
}

class NavigateToReportsBuilder
    implements Builder<NavigateToReports, NavigateToReportsBuilder> {
  _$NavigateToReports _$v;

  NavigateToReportsBuilder();

  @override
  void replace(NavigateToReports other) {
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
    final _$result = _$v ?? new _$NavigateToReports._();
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToSettings extends NavigateToSettings {
  @override
  final SettingsDeepLink deepLink;

  factory _$NavigateToSettings(
          [void Function(NavigateToSettingsBuilder) updates]) =>
      (new NavigateToSettingsBuilder()..update(updates)).build();

  _$NavigateToSettings._({this.deepLink}) : super._();

  @override
  NavigateToSettings rebuild(
          void Function(NavigateToSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToSettingsBuilder toBuilder() =>
      new NavigateToSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToSettings && deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc(0, deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToSettings')
          ..add('deepLink', deepLink))
        .toString();
  }
}

class NavigateToSettingsBuilder
    implements Builder<NavigateToSettings, NavigateToSettingsBuilder> {
  _$NavigateToSettings _$v;

  SettingsDeepLink _deepLink;
  SettingsDeepLink get deepLink => _$this._deepLink;
  set deepLink(SettingsDeepLink deepLink) => _$this._deepLink = deepLink;

  NavigateToSettingsBuilder();

  NavigateToSettingsBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigateToSettings other) {
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
    final _$result = _$v ?? new _$NavigateToSettings._(deepLink: deepLink);
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

class _$DiarySettingsDeepLink extends DiarySettingsDeepLink {
  factory _$DiarySettingsDeepLink(
          [void Function(DiarySettingsDeepLinkBuilder) updates]) =>
      (new DiarySettingsDeepLinkBuilder()..update(updates)).build();

  _$DiarySettingsDeepLink._() : super._();

  @override
  DiarySettingsDeepLink rebuild(
          void Function(DiarySettingsDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiarySettingsDeepLinkBuilder toBuilder() =>
      new DiarySettingsDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiarySettingsDeepLink;
  }

  @override
  int get hashCode {
    return 736479308;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('DiarySettingsDeepLink').toString();
  }
}

class DiarySettingsDeepLinkBuilder
    implements Builder<DiarySettingsDeepLink, DiarySettingsDeepLinkBuilder> {
  _$DiarySettingsDeepLink _$v;

  DiarySettingsDeepLinkBuilder();

  @override
  void replace(DiarySettingsDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiarySettingsDeepLink;
  }

  @override
  void update(void Function(DiarySettingsDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiarySettingsDeepLink build() {
    final _$result = _$v ?? new _$DiarySettingsDeepLink._();
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToLogging extends NavigateToLogging {
  factory _$NavigateToLogging(
          [void Function(NavigateToLoggingBuilder) updates]) =>
      (new NavigateToLoggingBuilder()..update(updates)).build();

  _$NavigateToLogging._() : super._();

  @override
  NavigateToLogging rebuild(void Function(NavigateToLoggingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToLoggingBuilder toBuilder() =>
      new NavigateToLoggingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToLogging;
  }

  @override
  int get hashCode {
    return 441653569;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NavigateToLogging').toString();
  }
}

class NavigateToLoggingBuilder
    implements Builder<NavigateToLogging, NavigateToLoggingBuilder> {
  _$NavigateToLogging _$v;

  NavigateToLoggingBuilder();

  @override
  void replace(NavigateToLogging other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToLogging;
  }

  @override
  void update(void Function(NavigateToLoggingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToLogging build() {
    final _$result = _$v ?? new _$NavigateToLogging._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
