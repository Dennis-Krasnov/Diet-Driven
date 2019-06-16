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
      (new NavigateToDiaryBuilder()..update(updates)).build();

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
  NavigateToDiaryBuilder toBuilder() =>
      new NavigateToDiaryBuilder()..replace(this);

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

class NavigateToDiaryBuilder
    implements
        Builder<NavigateToDiary, NavigateToDiaryBuilder>,
        NavigationEventBuilder {
  _$NavigateToDiary _$v;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  bool _onlyIfUninitialized;
  bool get onlyIfUninitialized => _$this._onlyIfUninitialized;
  set onlyIfUninitialized(bool onlyIfUninitialized) =>
      _$this._onlyIfUninitialized = onlyIfUninitialized;

  NavigateToDiaryBuilder();

  NavigateToDiaryBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _onlyIfUninitialized = _$v.onlyIfUninitialized;
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
      (new NavigateToTrackBuilder()..update(updates)).build();

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
  NavigateToTrackBuilder toBuilder() =>
      new NavigateToTrackBuilder()..replace(this);

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

class NavigateToTrackBuilder
    implements
        Builder<NavigateToTrack, NavigateToTrackBuilder>,
        NavigationEventBuilder {
  _$NavigateToTrack _$v;

  bool _onlyIfUninitialized;
  bool get onlyIfUninitialized => _$this._onlyIfUninitialized;
  set onlyIfUninitialized(bool onlyIfUninitialized) =>
      _$this._onlyIfUninitialized = onlyIfUninitialized;

  NavigateToTrackBuilder();

  NavigateToTrackBuilder get _$this {
    if (_$v != null) {
      _onlyIfUninitialized = _$v.onlyIfUninitialized;
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
      (new NavigateToDietBuilder()..update(updates)).build();

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
  NavigateToDietBuilder toBuilder() =>
      new NavigateToDietBuilder()..replace(this);

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

class NavigateToDietBuilder
    implements
        Builder<NavigateToDiet, NavigateToDietBuilder>,
        NavigationEventBuilder {
  _$NavigateToDiet _$v;

  bool _onlyIfUninitialized;
  bool get onlyIfUninitialized => _$this._onlyIfUninitialized;
  set onlyIfUninitialized(bool onlyIfUninitialized) =>
      _$this._onlyIfUninitialized = onlyIfUninitialized;

  NavigateToDietBuilder();

  NavigateToDietBuilder get _$this {
    if (_$v != null) {
      _onlyIfUninitialized = _$v.onlyIfUninitialized;
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
  final bool onlyIfUninitialized;

  factory _$NavigateToProfile(
          [void Function(NavigateToProfileBuilder) updates]) =>
      (new NavigateToProfileBuilder()..update(updates)).build();

  _$NavigateToProfile._({this.setting, this.onlyIfUninitialized}) : super._() {
    if (onlyIfUninitialized == null) {
      throw new BuiltValueNullFieldError(
          'NavigateToProfile', 'onlyIfUninitialized');
    }
  }

  @override
  NavigateToProfile rebuild(void Function(NavigateToProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToProfileBuilder toBuilder() =>
      new NavigateToProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToProfile &&
        setting == other.setting &&
        onlyIfUninitialized == other.onlyIfUninitialized;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, setting.hashCode), onlyIfUninitialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToProfile')
          ..add('setting', setting)
          ..add('onlyIfUninitialized', onlyIfUninitialized))
        .toString();
  }
}

class NavigateToProfileBuilder
    implements
        Builder<NavigateToProfile, NavigateToProfileBuilder>,
        NavigationEventBuilder {
  _$NavigateToProfile _$v;

  String _setting;
  String get setting => _$this._setting;
  set setting(String setting) => _$this._setting = setting;

  bool _onlyIfUninitialized;
  bool get onlyIfUninitialized => _$this._onlyIfUninitialized;
  set onlyIfUninitialized(bool onlyIfUninitialized) =>
      _$this._onlyIfUninitialized = onlyIfUninitialized;

  NavigateToProfileBuilder();

  NavigateToProfileBuilder get _$this {
    if (_$v != null) {
      _setting = _$v.setting;
      _onlyIfUninitialized = _$v.onlyIfUninitialized;
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
            setting: setting, onlyIfUninitialized: onlyIfUninitialized);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
