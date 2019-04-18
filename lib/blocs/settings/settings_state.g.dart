// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsUninitialized extends SettingsUninitialized {
  factory _$SettingsUninitialized(
          [void updates(SettingsUninitializedBuilder b)]) =>
      (new SettingsUninitializedBuilder()..update(updates)).build();

  _$SettingsUninitialized._() : super._();

  @override
  SettingsUninitialized rebuild(void updates(SettingsUninitializedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsUninitializedBuilder toBuilder() =>
      new SettingsUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsUninitialized;
  }

  @override
  int get hashCode {
    return 212135114;
  }
}

class SettingsUninitializedBuilder
    implements Builder<SettingsUninitialized, SettingsUninitializedBuilder> {
  _$SettingsUninitialized _$v;

  SettingsUninitializedBuilder();

  @override
  void replace(SettingsUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsUninitialized;
  }

  @override
  void update(void updates(SettingsUninitializedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsUninitialized build() {
    final _$result = _$v ?? new _$SettingsUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$SettingsFailed extends SettingsFailed {
  @override
  final String error;

  factory _$SettingsFailed([void updates(SettingsFailedBuilder b)]) =>
      (new SettingsFailedBuilder()..update(updates)).build();

  _$SettingsFailed._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SettingsFailed', 'error');
    }
  }

  @override
  SettingsFailed rebuild(void updates(SettingsFailedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsFailedBuilder toBuilder() =>
      new SettingsFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsFailed && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsFailed')..add('error', error))
        .toString();
  }
}

class SettingsFailedBuilder
    implements Builder<SettingsFailed, SettingsFailedBuilder> {
  _$SettingsFailed _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SettingsFailedBuilder();

  SettingsFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsFailed;
  }

  @override
  void update(void updates(SettingsFailedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsFailed build() {
    final _$result = _$v ?? new _$SettingsFailed._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$SettingsLoaded extends SettingsLoaded {
  @override
  final Settings settings;

  factory _$SettingsLoaded([void updates(SettingsLoadedBuilder b)]) =>
      (new SettingsLoadedBuilder()..update(updates)).build();

  _$SettingsLoaded._({this.settings}) : super._() {
    if (settings == null) {
      throw new BuiltValueNullFieldError('SettingsLoaded', 'settings');
    }
  }

  @override
  SettingsLoaded rebuild(void updates(SettingsLoadedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsLoadedBuilder toBuilder() =>
      new SettingsLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsLoaded && settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc(0, settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsLoaded')
          ..add('settings', settings))
        .toString();
  }
}

class SettingsLoadedBuilder
    implements Builder<SettingsLoaded, SettingsLoadedBuilder> {
  _$SettingsLoaded _$v;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  SettingsLoadedBuilder();

  SettingsLoadedBuilder get _$this {
    if (_$v != null) {
      _settings = _$v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsLoaded;
  }

  @override
  void update(void updates(SettingsLoadedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsLoaded build() {
    _$SettingsLoaded _$result;
    try {
      _$result = _$v ?? new _$SettingsLoaded._(settings: settings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'settings';
        settings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
