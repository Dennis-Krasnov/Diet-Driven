// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsArrived extends SettingsArrived {
  @override
  final Settings settings;

  factory _$SettingsArrived([void updates(SettingsArrivedBuilder b)]) =>
      (new SettingsArrivedBuilder()..update(updates)).build();

  _$SettingsArrived._({this.settings}) : super._() {
    if (settings == null) {
      throw new BuiltValueNullFieldError('SettingsArrived', 'settings');
    }
  }

  @override
  SettingsArrived rebuild(void updates(SettingsArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsArrivedBuilder toBuilder() =>
      new SettingsArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsArrived && settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc(0, settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsArrived')
          ..add('settings', settings))
        .toString();
  }
}

class SettingsArrivedBuilder
    implements Builder<SettingsArrived, SettingsArrivedBuilder> {
  _$SettingsArrived _$v;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  SettingsArrivedBuilder();

  SettingsArrivedBuilder get _$this {
    if (_$v != null) {
      _settings = _$v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsArrived;
  }

  @override
  void update(void updates(SettingsArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsArrived build() {
    _$SettingsArrived _$result;
    try {
      _$result = _$v ?? new _$SettingsArrived._(settings: settings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'settings';
        settings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsArrived', _$failedField, e.toString());
      }
      rethrow;
    }
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
