// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteSettingsArrived extends RemoteSettingsArrived {
  @override
  final Settings settings;

  factory _$RemoteSettingsArrived(
          [void updates(RemoteSettingsArrivedBuilder b)]) =>
      (new RemoteSettingsArrivedBuilder()..update(updates)).build();

  _$RemoteSettingsArrived._({this.settings}) : super._() {
    if (settings == null) {
      throw new BuiltValueNullFieldError('RemoteSettingsArrived', 'settings');
    }
  }

  @override
  RemoteSettingsArrived rebuild(void updates(RemoteSettingsArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteSettingsArrivedBuilder toBuilder() =>
      new RemoteSettingsArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteSettingsArrived && settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc(0, settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteSettingsArrived')
          ..add('settings', settings))
        .toString();
  }
}

class RemoteSettingsArrivedBuilder
    implements Builder<RemoteSettingsArrived, RemoteSettingsArrivedBuilder> {
  _$RemoteSettingsArrived _$v;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  RemoteSettingsArrivedBuilder();

  RemoteSettingsArrivedBuilder get _$this {
    if (_$v != null) {
      _settings = _$v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteSettingsArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteSettingsArrived;
  }

  @override
  void update(void updates(RemoteSettingsArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteSettingsArrived build() {
    _$RemoteSettingsArrived _$result;
    try {
      _$result =
          _$v ?? new _$RemoteSettingsArrived._(settings: settings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'settings';
        settings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoteSettingsArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SettingsError extends SettingsError {
  @override
  final String error;

  factory _$SettingsError([void updates(SettingsErrorBuilder b)]) =>
      (new SettingsErrorBuilder()..update(updates)).build();

  _$SettingsError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SettingsError', 'error');
    }
  }

  @override
  SettingsError rebuild(void updates(SettingsErrorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsErrorBuilder toBuilder() => new SettingsErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsError')..add('error', error))
        .toString();
  }
}

class SettingsErrorBuilder
    implements Builder<SettingsError, SettingsErrorBuilder> {
  _$SettingsError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SettingsErrorBuilder();

  SettingsErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsError;
  }

  @override
  void update(void updates(SettingsErrorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsError build() {
    final _$result = _$v ?? new _$SettingsError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$WipeSettings extends WipeSettings {
  factory _$WipeSettings([void updates(WipeSettingsBuilder b)]) =>
      (new WipeSettingsBuilder()..update(updates)).build();

  _$WipeSettings._() : super._();

  @override
  WipeSettings rebuild(void updates(WipeSettingsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  WipeSettingsBuilder toBuilder() => new WipeSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WipeSettings;
  }

  @override
  int get hashCode {
    return 1009509314;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('WipeSettings').toString();
  }
}

class WipeSettingsBuilder
    implements Builder<WipeSettings, WipeSettingsBuilder> {
  _$WipeSettings _$v;

  WipeSettingsBuilder();

  @override
  void replace(WipeSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WipeSettings;
  }

  @override
  void update(void updates(WipeSettingsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$WipeSettings build() {
    final _$result = _$v ?? new _$WipeSettings._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
