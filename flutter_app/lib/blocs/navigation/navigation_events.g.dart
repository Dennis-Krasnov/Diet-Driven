// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class NavigationEventBuilder {
  void replace(NavigationEvent other);
  void update(void Function(NavigationEventBuilder) updates);
  ListBuilder<DeepLink> get deepLink;
  set deepLink(ListBuilder<DeepLink> deepLink);
}

class _$InitNavigation extends InitNavigation {
  @override
  final BuiltList<DeepLink> deepLink;

  factory _$InitNavigation([void Function(InitNavigationBuilder) updates]) =>
      (new InitNavigationBuilder()..update(updates)).build();

  _$InitNavigation._({this.deepLink}) : super._();

  @override
  InitNavigation rebuild(void Function(InitNavigationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitNavigationBuilder toBuilder() =>
      new InitNavigationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitNavigation && deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc(0, deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitNavigation')
          ..add('deepLink', deepLink))
        .toString();
  }
}

class InitNavigationBuilder
    implements
        Builder<InitNavigation, InitNavigationBuilder>,
        NavigationEventBuilder {
  _$InitNavigation _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  InitNavigationBuilder();

  InitNavigationBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant InitNavigation other) {
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
    _$InitNavigation _$result;
    try {
      _$result = _$v ?? new _$InitNavigation._(deepLink: _deepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InitNavigation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToDiary extends NavigateToDiary {
  @override
  final BuiltList<DeepLink> deepLink;

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
    implements
        Builder<NavigateToDiary, NavigateToDiaryBuilder>,
        NavigationEventBuilder {
  _$NavigateToDiary _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  NavigateToDiaryBuilder();

  NavigateToDiaryBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
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
    _$NavigateToDiary _$result;
    try {
      _$result = _$v ?? new _$NavigateToDiary._(deepLink: _deepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigateToDiary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToTrack extends NavigateToTrack {
  @override
  final BuiltList<DeepLink> deepLink;

  factory _$NavigateToTrack([void Function(NavigateToTrackBuilder) updates]) =>
      (new NavigateToTrackBuilder()..update(updates)).build();

  _$NavigateToTrack._({this.deepLink}) : super._();

  @override
  NavigateToTrack rebuild(void Function(NavigateToTrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToTrackBuilder toBuilder() =>
      new NavigateToTrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToTrack && deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc(0, deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToTrack')
          ..add('deepLink', deepLink))
        .toString();
  }
}

class NavigateToTrackBuilder
    implements
        Builder<NavigateToTrack, NavigateToTrackBuilder>,
        NavigationEventBuilder {
  _$NavigateToTrack _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  NavigateToTrackBuilder();

  NavigateToTrackBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
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
    _$NavigateToTrack _$result;
    try {
      _$result = _$v ?? new _$NavigateToTrack._(deepLink: _deepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigateToTrack', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToReports extends NavigateToReports {
  @override
  final BuiltList<DeepLink> deepLink;

  factory _$NavigateToReports(
          [void Function(NavigateToReportsBuilder) updates]) =>
      (new NavigateToReportsBuilder()..update(updates)).build();

  _$NavigateToReports._({this.deepLink}) : super._();

  @override
  NavigateToReports rebuild(void Function(NavigateToReportsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToReportsBuilder toBuilder() =>
      new NavigateToReportsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToReports && deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc(0, deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToReports')
          ..add('deepLink', deepLink))
        .toString();
  }
}

class NavigateToReportsBuilder
    implements
        Builder<NavigateToReports, NavigateToReportsBuilder>,
        NavigationEventBuilder {
  _$NavigateToReports _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  NavigateToReportsBuilder();

  NavigateToReportsBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
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
    _$NavigateToReports _$result;
    try {
      _$result = _$v ?? new _$NavigateToReports._(deepLink: _deepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigateToReports', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToSettings extends NavigateToSettings {
  @override
  final BuiltList<DeepLink> deepLink;

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
    implements
        Builder<NavigateToSettings, NavigateToSettingsBuilder>,
        NavigationEventBuilder {
  _$NavigateToSettings _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  NavigateToSettingsBuilder();

  NavigateToSettingsBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
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
    _$NavigateToSettings _$result;
    try {
      _$result =
          _$v ?? new _$NavigateToSettings._(deepLink: _deepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigateToSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigateToLogging extends NavigateToLogging {
  @override
  final BuiltList<DeepLink> deepLink;

  factory _$NavigateToLogging(
          [void Function(NavigateToLoggingBuilder) updates]) =>
      (new NavigateToLoggingBuilder()..update(updates)).build();

  _$NavigateToLogging._({this.deepLink}) : super._();

  @override
  NavigateToLogging rebuild(void Function(NavigateToLoggingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToLoggingBuilder toBuilder() =>
      new NavigateToLoggingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToLogging && deepLink == other.deepLink;
  }

  @override
  int get hashCode {
    return $jf($jc(0, deepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigateToLogging')
          ..add('deepLink', deepLink))
        .toString();
  }
}

class NavigateToLoggingBuilder
    implements
        Builder<NavigateToLogging, NavigateToLoggingBuilder>,
        NavigationEventBuilder {
  _$NavigateToLogging _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  NavigateToLoggingBuilder();

  NavigateToLoggingBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigateToLogging other) {
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
    _$NavigateToLogging _$result;
    try {
      _$result = _$v ?? new _$NavigateToLogging._(deepLink: _deepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigateToLogging', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
