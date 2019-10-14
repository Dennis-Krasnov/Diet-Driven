// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_links.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class DeepLinkBuilder {
  void replace(DeepLink other);
  void update(void Function(DeepLinkBuilder) updates);
  bool get fullScreen;
  set fullScreen(bool fullScreen);
}

class _$DiaryDeepLink extends DiaryDeepLink {
  @override
  final int date;
  @override
  final bool fullScreen;

  factory _$DiaryDeepLink([void Function(DiaryDeepLinkBuilder) updates]) =>
      (new DiaryDeepLinkBuilder()..update(updates)).build();

  _$DiaryDeepLink._({this.date, this.fullScreen}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('DiaryDeepLink', 'date');
    }
  }

  @override
  DiaryDeepLink rebuild(void Function(DiaryDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryDeepLinkBuilder toBuilder() => new DiaryDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryDeepLink &&
        date == other.date &&
        fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, date.hashCode), fullScreen.hashCode));
  }
}

class DiaryDeepLinkBuilder
    implements Builder<DiaryDeepLink, DiaryDeepLinkBuilder>, DeepLinkBuilder {
  _$DiaryDeepLink _$v;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  DiaryDeepLinkBuilder();

  DiaryDeepLinkBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiaryDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryDeepLink;
  }

  @override
  void update(void Function(DiaryDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryDeepLink build() {
    final _$result =
        _$v ?? new _$DiaryDeepLink._(date: date, fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

class _$DiaryFoodRecordDeepLink extends DiaryFoodRecordDeepLink {
  @override
  final String uid;
  @override
  final bool fullScreen;

  factory _$DiaryFoodRecordDeepLink(
          [void Function(DiaryFoodRecordDeepLinkBuilder) updates]) =>
      (new DiaryFoodRecordDeepLinkBuilder()..update(updates)).build();

  _$DiaryFoodRecordDeepLink._({this.uid, this.fullScreen}) : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('DiaryFoodRecordDeepLink', 'uid');
    }
  }

  @override
  DiaryFoodRecordDeepLink rebuild(
          void Function(DiaryFoodRecordDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryFoodRecordDeepLinkBuilder toBuilder() =>
      new DiaryFoodRecordDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryFoodRecordDeepLink &&
        uid == other.uid &&
        fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, uid.hashCode), fullScreen.hashCode));
  }
}

class DiaryFoodRecordDeepLinkBuilder
    implements
        Builder<DiaryFoodRecordDeepLink, DiaryFoodRecordDeepLinkBuilder>,
        DeepLinkBuilder {
  _$DiaryFoodRecordDeepLink _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  DiaryFoodRecordDeepLinkBuilder();

  DiaryFoodRecordDeepLinkBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiaryFoodRecordDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryFoodRecordDeepLink;
  }

  @override
  void update(void Function(DiaryFoodRecordDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryFoodRecordDeepLink build() {
    final _$result = _$v ??
        new _$DiaryFoodRecordDeepLink._(uid: uid, fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

class _$DiaryLoggingDeepLink extends DiaryLoggingDeepLink {
  @override
  final String type;
  @override
  final bool fullScreen;

  factory _$DiaryLoggingDeepLink(
          [void Function(DiaryLoggingDeepLinkBuilder) updates]) =>
      (new DiaryLoggingDeepLinkBuilder()..update(updates)).build();

  _$DiaryLoggingDeepLink._({this.type, this.fullScreen}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('DiaryLoggingDeepLink', 'type');
    }
  }

  @override
  DiaryLoggingDeepLink rebuild(
          void Function(DiaryLoggingDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryLoggingDeepLinkBuilder toBuilder() =>
      new DiaryLoggingDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryLoggingDeepLink &&
        type == other.type &&
        fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), fullScreen.hashCode));
  }
}

class DiaryLoggingDeepLinkBuilder
    implements
        Builder<DiaryLoggingDeepLink, DiaryLoggingDeepLinkBuilder>,
        DeepLinkBuilder {
  _$DiaryLoggingDeepLink _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  DiaryLoggingDeepLinkBuilder();

  DiaryLoggingDeepLinkBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiaryLoggingDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryLoggingDeepLink;
  }

  @override
  void update(void Function(DiaryLoggingDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryLoggingDeepLink build() {
    final _$result =
        _$v ?? new _$DiaryLoggingDeepLink._(type: type, fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

class _$DiaryLoggingSearchDeepLink extends DiaryLoggingSearchDeepLink {
  @override
  final String query;
  @override
  final bool fullScreen;

  factory _$DiaryLoggingSearchDeepLink(
          [void Function(DiaryLoggingSearchDeepLinkBuilder) updates]) =>
      (new DiaryLoggingSearchDeepLinkBuilder()..update(updates)).build();

  _$DiaryLoggingSearchDeepLink._({this.query, this.fullScreen}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('DiaryLoggingSearchDeepLink', 'query');
    }
  }

  @override
  DiaryLoggingSearchDeepLink rebuild(
          void Function(DiaryLoggingSearchDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryLoggingSearchDeepLinkBuilder toBuilder() =>
      new DiaryLoggingSearchDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryLoggingSearchDeepLink &&
        query == other.query &&
        fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, query.hashCode), fullScreen.hashCode));
  }
}

class DiaryLoggingSearchDeepLinkBuilder
    implements
        Builder<DiaryLoggingSearchDeepLink, DiaryLoggingSearchDeepLinkBuilder>,
        DeepLinkBuilder {
  _$DiaryLoggingSearchDeepLink _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  DiaryLoggingSearchDeepLinkBuilder();

  DiaryLoggingSearchDeepLinkBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiaryLoggingSearchDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiaryLoggingSearchDeepLink;
  }

  @override
  void update(void Function(DiaryLoggingSearchDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryLoggingSearchDeepLink build() {
    final _$result = _$v ??
        new _$DiaryLoggingSearchDeepLink._(
            query: query, fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

class _$SettingsDeepLink extends SettingsDeepLink {
  @override
  final bool fullScreen;

  factory _$SettingsDeepLink(
          [void Function(SettingsDeepLinkBuilder) updates]) =>
      (new SettingsDeepLinkBuilder()..update(updates)).build();

  _$SettingsDeepLink._({this.fullScreen}) : super._();

  @override
  SettingsDeepLink rebuild(void Function(SettingsDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsDeepLinkBuilder toBuilder() =>
      new SettingsDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsDeepLink && fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc(0, fullScreen.hashCode));
  }
}

class SettingsDeepLinkBuilder
    implements
        Builder<SettingsDeepLink, SettingsDeepLinkBuilder>,
        DeepLinkBuilder {
  _$SettingsDeepLink _$v;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  SettingsDeepLinkBuilder();

  SettingsDeepLinkBuilder get _$this {
    if (_$v != null) {
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SettingsDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsDeepLink;
  }

  @override
  void update(void Function(SettingsDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsDeepLink build() {
    final _$result = _$v ?? new _$SettingsDeepLink._(fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

class _$ThemeSettingsDeepLink extends ThemeSettingsDeepLink {
  @override
  final bool fullScreen;

  factory _$ThemeSettingsDeepLink(
          [void Function(ThemeSettingsDeepLinkBuilder) updates]) =>
      (new ThemeSettingsDeepLinkBuilder()..update(updates)).build();

  _$ThemeSettingsDeepLink._({this.fullScreen}) : super._();

  @override
  ThemeSettingsDeepLink rebuild(
          void Function(ThemeSettingsDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeSettingsDeepLinkBuilder toBuilder() =>
      new ThemeSettingsDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeSettingsDeepLink && fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc(0, fullScreen.hashCode));
  }
}

class ThemeSettingsDeepLinkBuilder
    implements
        Builder<ThemeSettingsDeepLink, ThemeSettingsDeepLinkBuilder>,
        DeepLinkBuilder {
  _$ThemeSettingsDeepLink _$v;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  ThemeSettingsDeepLinkBuilder();

  ThemeSettingsDeepLinkBuilder get _$this {
    if (_$v != null) {
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemeSettingsDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThemeSettingsDeepLink;
  }

  @override
  void update(void Function(ThemeSettingsDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeSettingsDeepLink build() {
    final _$result =
        _$v ?? new _$ThemeSettingsDeepLink._(fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

class _$DiarySettingsDeepLink extends DiarySettingsDeepLink {
  @override
  final bool fullScreen;

  factory _$DiarySettingsDeepLink(
          [void Function(DiarySettingsDeepLinkBuilder) updates]) =>
      (new DiarySettingsDeepLinkBuilder()..update(updates)).build();

  _$DiarySettingsDeepLink._({this.fullScreen}) : super._();

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
    return other is DiarySettingsDeepLink && fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc(0, fullScreen.hashCode));
  }
}

class DiarySettingsDeepLinkBuilder
    implements
        Builder<DiarySettingsDeepLink, DiarySettingsDeepLinkBuilder>,
        DeepLinkBuilder {
  _$DiarySettingsDeepLink _$v;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  DiarySettingsDeepLinkBuilder();

  DiarySettingsDeepLinkBuilder get _$this {
    if (_$v != null) {
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DiarySettingsDeepLink other) {
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
    final _$result =
        _$v ?? new _$DiarySettingsDeepLink._(fullScreen: fullScreen);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
