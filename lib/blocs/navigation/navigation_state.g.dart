// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigationUninitialized extends NavigationUninitialized {
  @override
  final Page page;

  factory _$NavigationUninitialized(
          [void Function(NavigationUninitializedBuilder) updates]) =>
      (new NavigationUninitializedBuilder()..update(updates)).build();

  _$NavigationUninitialized._({this.page}) : super._();

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
    return other is NavigationUninitialized && page == other.page;
  }

  @override
  int get hashCode {
    return $jf($jc(0, page.hashCode));
  }
}

class NavigationUninitializedBuilder
    implements
        Builder<NavigationUninitialized, NavigationUninitializedBuilder> {
  _$NavigationUninitialized _$v;

  Page _page;
  Page get page => _$this._page;
  set page(Page page) => _$this._page = page;

  NavigationUninitializedBuilder();

  NavigationUninitializedBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _$v = null;
    }
    return this;
  }

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
    final _$result = _$v ?? new _$NavigationUninitialized._(page: page);
    replace(_$result);
    return _$result;
  }
}

class _$DiaryTab extends DiaryTab {
  @override
  final int date;

  factory _$DiaryTab([void Function(DiaryTabBuilder) updates]) =>
      (new DiaryTabBuilder()..update(updates)).build();

  _$DiaryTab._({this.date}) : super._();

  @override
  DiaryTab rebuild(void Function(DiaryTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryTabBuilder toBuilder() => new DiaryTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryTab && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryTab')..add('date', date))
        .toString();
  }
}

class DiaryTabBuilder implements Builder<DiaryTab, DiaryTabBuilder> {
  _$DiaryTab _$v;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  DiaryTabBuilder();

  DiaryTabBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiaryTab other) {
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
    final _$result = _$v ?? new _$DiaryTab._(date: date);
    replace(_$result);
    return _$result;
  }
}

class _$TrackTab extends TrackTab {
  factory _$TrackTab([void Function(TrackTabBuilder) updates]) =>
      (new TrackTabBuilder()..update(updates)).build();

  _$TrackTab._() : super._();

  @override
  TrackTab rebuild(void Function(TrackTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackTabBuilder toBuilder() => new TrackTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackTab;
  }

  @override
  int get hashCode {
    return 713278670;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('TrackTab').toString();
  }
}

class TrackTabBuilder implements Builder<TrackTab, TrackTabBuilder> {
  _$TrackTab _$v;

  TrackTabBuilder();

  @override
  void replace(TrackTab other) {
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
    final _$result = _$v ?? new _$TrackTab._();
    replace(_$result);
    return _$result;
  }
}

class _$DietTab extends DietTab {
  factory _$DietTab([void Function(DietTabBuilder) updates]) =>
      (new DietTabBuilder()..update(updates)).build();

  _$DietTab._() : super._();

  @override
  DietTab rebuild(void Function(DietTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DietTabBuilder toBuilder() => new DietTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DietTab;
  }

  @override
  int get hashCode {
    return 867275950;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('DietTab').toString();
  }
}

class DietTabBuilder implements Builder<DietTab, DietTabBuilder> {
  _$DietTab _$v;

  DietTabBuilder();

  @override
  void replace(DietTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DietTab;
  }

  @override
  void update(void Function(DietTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DietTab build() {
    final _$result = _$v ?? new _$DietTab._();
    replace(_$result);
    return _$result;
  }
}

class _$ProfileTab extends ProfileTab {
  @override
  final String setting;
  @override
  final SubscriptionType subscriptionType;

  factory _$ProfileTab([void Function(ProfileTabBuilder) updates]) =>
      (new ProfileTabBuilder()..update(updates)).build();

  _$ProfileTab._({this.setting, this.subscriptionType}) : super._();

  @override
  ProfileTab rebuild(void Function(ProfileTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileTabBuilder toBuilder() => new ProfileTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileTab &&
        setting == other.setting &&
        subscriptionType == other.subscriptionType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, setting.hashCode), subscriptionType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileTab')
          ..add('setting', setting)
          ..add('subscriptionType', subscriptionType))
        .toString();
  }
}

class ProfileTabBuilder implements Builder<ProfileTab, ProfileTabBuilder> {
  _$ProfileTab _$v;

  String _setting;
  String get setting => _$this._setting;
  set setting(String setting) => _$this._setting = setting;

  SubscriptionType _subscriptionType;
  SubscriptionType get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  ProfileTabBuilder();

  ProfileTabBuilder get _$this {
    if (_$v != null) {
      _setting = _$v.setting;
      _subscriptionType = _$v.subscriptionType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileTab other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileTab;
  }

  @override
  void update(void Function(ProfileTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileTab build() {
    final _$result = _$v ??
        new _$ProfileTab._(
            setting: setting, subscriptionType: subscriptionType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
