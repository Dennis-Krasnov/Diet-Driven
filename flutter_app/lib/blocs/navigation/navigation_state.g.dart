// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class NavigationStateBuilder {
  void replace(NavigationState other);
  void update(void Function(NavigationStateBuilder) updates);
  ListBuilder<DeepLink> get deepLink;
  set deepLink(ListBuilder<DeepLink> deepLink);

  ListBuilder<DeepLink> get previousDeepLink;
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink);
}

class _$NavigationUninitialized extends NavigationUninitialized {
  @override
  final BuiltList<DeepLink> deepLink;
  @override
  final BuiltList<DeepLink> previousDeepLink;

  factory _$NavigationUninitialized(
          [void Function(NavigationUninitializedBuilder) updates]) =>
      (new NavigationUninitializedBuilder()..update(updates)).build();

  _$NavigationUninitialized._({this.deepLink, this.previousDeepLink})
      : super._();

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
        deepLink == other.deepLink &&
        previousDeepLink == other.previousDeepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), previousDeepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationUninitialized')
          ..add('deepLink', deepLink)
          ..add('previousDeepLink', previousDeepLink))
        .toString();
  }
}

class NavigationUninitializedBuilder
    implements
        Builder<NavigationUninitialized, NavigationUninitializedBuilder>,
        NavigationStateBuilder {
  _$NavigationUninitialized _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  ListBuilder<DeepLink> _previousDeepLink;
  ListBuilder<DeepLink> get previousDeepLink =>
      _$this._previousDeepLink ??= new ListBuilder<DeepLink>();
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink) =>
      _$this._previousDeepLink = previousDeepLink;

  NavigationUninitializedBuilder();

  NavigationUninitializedBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _previousDeepLink = _$v.previousDeepLink?.toBuilder();
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
    _$NavigationUninitialized _$result;
    try {
      _$result = _$v ??
          new _$NavigationUninitialized._(
              deepLink: _deepLink?.build(),
              previousDeepLink: _previousDeepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
        _$failedField = 'previousDeepLink';
        _previousDeepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigationUninitialized', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DiaryTab extends DiaryTab {
  @override
  final BuiltList<DeepLink> deepLink;
  @override
  final BuiltList<DeepLink> previousDeepLink;

  factory _$DiaryTab([void Function(DiaryTabBuilder) updates]) =>
      (new DiaryTabBuilder()..update(updates)).build();

  _$DiaryTab._({this.deepLink, this.previousDeepLink}) : super._();

  @override
  DiaryTab rebuild(void Function(DiaryTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryTabBuilder toBuilder() => new DiaryTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryTab &&
        deepLink == other.deepLink &&
        previousDeepLink == other.previousDeepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), previousDeepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryTab')
          ..add('deepLink', deepLink)
          ..add('previousDeepLink', previousDeepLink))
        .toString();
  }
}

class DiaryTabBuilder
    implements Builder<DiaryTab, DiaryTabBuilder>, NavigationStateBuilder {
  _$DiaryTab _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  ListBuilder<DeepLink> _previousDeepLink;
  ListBuilder<DeepLink> get previousDeepLink =>
      _$this._previousDeepLink ??= new ListBuilder<DeepLink>();
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink) =>
      _$this._previousDeepLink = previousDeepLink;

  DiaryTabBuilder();

  DiaryTabBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _previousDeepLink = _$v.previousDeepLink?.toBuilder();
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
    _$DiaryTab _$result;
    try {
      _$result = _$v ??
          new _$DiaryTab._(
              deepLink: _deepLink?.build(),
              previousDeepLink: _previousDeepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
        _$failedField = 'previousDeepLink';
        _previousDeepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DiaryTab', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TrackTab extends TrackTab {
  @override
  final BuiltList<DeepLink> deepLink;
  @override
  final BuiltList<DeepLink> previousDeepLink;

  factory _$TrackTab([void Function(TrackTabBuilder) updates]) =>
      (new TrackTabBuilder()..update(updates)).build();

  _$TrackTab._({this.deepLink, this.previousDeepLink}) : super._();

  @override
  TrackTab rebuild(void Function(TrackTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackTabBuilder toBuilder() => new TrackTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackTab &&
        deepLink == other.deepLink &&
        previousDeepLink == other.previousDeepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), previousDeepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrackTab')
          ..add('deepLink', deepLink)
          ..add('previousDeepLink', previousDeepLink))
        .toString();
  }
}

class TrackTabBuilder
    implements Builder<TrackTab, TrackTabBuilder>, NavigationStateBuilder {
  _$TrackTab _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  ListBuilder<DeepLink> _previousDeepLink;
  ListBuilder<DeepLink> get previousDeepLink =>
      _$this._previousDeepLink ??= new ListBuilder<DeepLink>();
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink) =>
      _$this._previousDeepLink = previousDeepLink;

  TrackTabBuilder();

  TrackTabBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _previousDeepLink = _$v.previousDeepLink?.toBuilder();
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
    _$TrackTab _$result;
    try {
      _$result = _$v ??
          new _$TrackTab._(
              deepLink: _deepLink?.build(),
              previousDeepLink: _previousDeepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
        _$failedField = 'previousDeepLink';
        _previousDeepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TrackTab', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ReportsTab extends ReportsTab {
  @override
  final BuiltList<DeepLink> deepLink;
  @override
  final BuiltList<DeepLink> previousDeepLink;

  factory _$ReportsTab([void Function(ReportsTabBuilder) updates]) =>
      (new ReportsTabBuilder()..update(updates)).build();

  _$ReportsTab._({this.deepLink, this.previousDeepLink}) : super._();

  @override
  ReportsTab rebuild(void Function(ReportsTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportsTabBuilder toBuilder() => new ReportsTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsTab &&
        deepLink == other.deepLink &&
        previousDeepLink == other.previousDeepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), previousDeepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReportsTab')
          ..add('deepLink', deepLink)
          ..add('previousDeepLink', previousDeepLink))
        .toString();
  }
}

class ReportsTabBuilder
    implements Builder<ReportsTab, ReportsTabBuilder>, NavigationStateBuilder {
  _$ReportsTab _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  ListBuilder<DeepLink> _previousDeepLink;
  ListBuilder<DeepLink> get previousDeepLink =>
      _$this._previousDeepLink ??= new ListBuilder<DeepLink>();
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink) =>
      _$this._previousDeepLink = previousDeepLink;

  ReportsTabBuilder();

  ReportsTabBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _previousDeepLink = _$v.previousDeepLink?.toBuilder();
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
    _$ReportsTab _$result;
    try {
      _$result = _$v ??
          new _$ReportsTab._(
              deepLink: _deepLink?.build(),
              previousDeepLink: _previousDeepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
        _$failedField = 'previousDeepLink';
        _previousDeepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReportsTab', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SettingsTab extends SettingsTab {
  @override
  final BuiltList<DeepLink> deepLink;
  @override
  final BuiltList<DeepLink> previousDeepLink;

  factory _$SettingsTab([void Function(SettingsTabBuilder) updates]) =>
      (new SettingsTabBuilder()..update(updates)).build();

  _$SettingsTab._({this.deepLink, this.previousDeepLink}) : super._();

  @override
  SettingsTab rebuild(void Function(SettingsTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsTabBuilder toBuilder() => new SettingsTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsTab &&
        deepLink == other.deepLink &&
        previousDeepLink == other.previousDeepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), previousDeepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsTab')
          ..add('deepLink', deepLink)
          ..add('previousDeepLink', previousDeepLink))
        .toString();
  }
}

class SettingsTabBuilder
    implements
        Builder<SettingsTab, SettingsTabBuilder>,
        NavigationStateBuilder {
  _$SettingsTab _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  ListBuilder<DeepLink> _previousDeepLink;
  ListBuilder<DeepLink> get previousDeepLink =>
      _$this._previousDeepLink ??= new ListBuilder<DeepLink>();
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink) =>
      _$this._previousDeepLink = previousDeepLink;

  SettingsTabBuilder();

  SettingsTabBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _previousDeepLink = _$v.previousDeepLink?.toBuilder();
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
    _$SettingsTab _$result;
    try {
      _$result = _$v ??
          new _$SettingsTab._(
              deepLink: _deepLink?.build(),
              previousDeepLink: _previousDeepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
        _$failedField = 'previousDeepLink';
        _previousDeepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsTab', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LoggingTab extends LoggingTab {
  @override
  final BuiltList<DeepLink> deepLink;
  @override
  final BuiltList<DeepLink> previousDeepLink;

  factory _$LoggingTab([void Function(LoggingTabBuilder) updates]) =>
      (new LoggingTabBuilder()..update(updates)).build();

  _$LoggingTab._({this.deepLink, this.previousDeepLink}) : super._();

  @override
  LoggingTab rebuild(void Function(LoggingTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoggingTabBuilder toBuilder() => new LoggingTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoggingTab &&
        deepLink == other.deepLink &&
        previousDeepLink == other.previousDeepLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deepLink.hashCode), previousDeepLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoggingTab')
          ..add('deepLink', deepLink)
          ..add('previousDeepLink', previousDeepLink))
        .toString();
  }
}

class LoggingTabBuilder
    implements Builder<LoggingTab, LoggingTabBuilder>, NavigationStateBuilder {
  _$LoggingTab _$v;

  ListBuilder<DeepLink> _deepLink;
  ListBuilder<DeepLink> get deepLink =>
      _$this._deepLink ??= new ListBuilder<DeepLink>();
  set deepLink(ListBuilder<DeepLink> deepLink) => _$this._deepLink = deepLink;

  ListBuilder<DeepLink> _previousDeepLink;
  ListBuilder<DeepLink> get previousDeepLink =>
      _$this._previousDeepLink ??= new ListBuilder<DeepLink>();
  set previousDeepLink(ListBuilder<DeepLink> previousDeepLink) =>
      _$this._previousDeepLink = previousDeepLink;

  LoggingTabBuilder();

  LoggingTabBuilder get _$this {
    if (_$v != null) {
      _deepLink = _$v.deepLink?.toBuilder();
      _previousDeepLink = _$v.previousDeepLink?.toBuilder();
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
    _$LoggingTab _$result;
    try {
      _$result = _$v ??
          new _$LoggingTab._(
              deepLink: _deepLink?.build(),
              previousDeepLink: _previousDeepLink?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deepLink';
        _deepLink?.build();
        _$failedField = 'previousDeepLink';
        _previousDeepLink?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoggingTab', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
