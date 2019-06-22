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

class _$NavigateToDiary extends NavigateToDiary {
  @override
  final int date;
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToDiary([void Function(NavigateToDiaryBuilder) updates]) =>
      (new NavigateToDiaryBuilder()..update(updates)).build()
          as _$NavigateToDiary;

  _$NavigateToDiary._({this.date, this.onlyIfUninitialized}) : super._() {
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
        date == other.date &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, date.hashCode), onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToDiary')
          ..add('date', date)
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToDiaryBuilder extends NavigateToDiaryBuilder {
  _$NavigateToDiary _$v;

  @override
  int get date {
    _$this;
    return super.date;
  }

  @override
  set date(int date) {
    _$this;
    super.date = date;
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
      super.date = _$v.date;
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
            date: date, onlyIfUninitialized: onlyIfUninitialized);
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

class _$NavigateToDiet extends NavigateToDiet {
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToDiet([void Function(NavigateToDietBuilder) updates]) =>
      (new NavigateToDietBuilder()..update(updates)).build()
          as _$NavigateToDiet;

  _$NavigateToDiet._({this.onlyIfUninitialized}) : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToDiet', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToDiet rebuild(void Function(NavigateToDietBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigateToDietBuilder toBuilder() =>
      new _$NavigateToDietBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToDiet &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc(0, onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToDiet')
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToDietBuilder extends NavigateToDietBuilder {
  _$NavigateToDiet _$v;

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

  _$NavigateToDietBuilder() : super._();

  NavigateToDietBuilder get _$this {
    if (_$v != null) {
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToDiet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToDiet;
  }

  @override
  void update(void Function(NavigateToDietBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToDiet build() {
    final _$result =
        _$v ?? new _$NavigateToDiet._(onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToProfile extends NavigateToProfile {
  @override
  final String setting;
  @override
  final SubscriptionType subscriptionType;
  @override
  final bool onlyIfUninitialized;

  factory _$NavigateToProfile(
          [void Function(NavigateToProfileBuilder) updates]) =>
      (new NavigateToProfileBuilder()..update(updates)).build()
          as _$NavigateToProfile;

  _$NavigateToProfile._(
      {this.setting, this.subscriptionType, this.onlyIfUninitialized})
      : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToProfile', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToProfile rebuild(void Function(NavigateToProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigateToProfileBuilder toBuilder() =>
      new _$NavigateToProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToProfile &&
        setting == other.setting &&
        subscriptionType == other.subscriptionType &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, setting.hashCode), subscriptionType.hashCode),
        onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToProfile')
          ..add('setting', setting)
          ..add('subscriptionType', subscriptionType)
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class _$NavigateToProfileBuilder extends NavigateToProfileBuilder {
  _$NavigateToProfile _$v;

  @override
  String get setting {
    _$this;
    return super.setting;
  }

  @override
  set setting(String setting) {
    _$this;
    super.setting = setting;
  }

  @override
  SubscriptionType get subscriptionType {
    _$this;
    return super.subscriptionType;
  }

  @override
  set subscriptionType(SubscriptionType subscriptionType) {
    _$this;
    super.subscriptionType = subscriptionType;
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

  _$NavigateToProfileBuilder() : super._();

  NavigateToProfileBuilder get _$this {
    if (_$v != null) {
      super.setting = _$v.setting;
      super.subscriptionType = _$v.subscriptionType;
      super.onlyIfUninitialized = _$v.onlyIfUninitialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToProfile;
  }

  @override
  void update(void Function(NavigateToProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToProfile build() {
    final _$result = _$v ??
        new _$NavigateToProfile._(
            setting: setting,
            subscriptionType: subscriptionType,
            onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
