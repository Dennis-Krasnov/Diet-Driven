// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_edit_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateDarkMode extends UpdateDarkMode {
  @override
  final bool darkMode;
  @override
  final Completer<void> completer;

  factory _$UpdateDarkMode([void Function(UpdateDarkModeBuilder) updates]) =>
      (new UpdateDarkModeBuilder()..update(updates)).build();

  _$UpdateDarkMode._({this.darkMode, this.completer}) : super._() {
    if (darkMode == null) {
      throw new BuiltValueNullFieldError('UpdateDarkMode', 'darkMode');
    }
  }

  @override
  UpdateDarkMode rebuild(void Function(UpdateDarkModeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateDarkModeBuilder toBuilder() =>
      new UpdateDarkModeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateDarkMode &&
        darkMode == other.darkMode &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, darkMode.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateDarkMode')
          ..add('darkMode', darkMode)
          ..add('completer', completer))
        .toString();
  }
}

class UpdateDarkModeBuilder
    implements Builder<UpdateDarkMode, UpdateDarkModeBuilder> {
  _$UpdateDarkMode _$v;

  bool _darkMode;
  bool get darkMode => _$this._darkMode;
  set darkMode(bool darkMode) => _$this._darkMode = darkMode;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  UpdateDarkModeBuilder();

  UpdateDarkModeBuilder get _$this {
    if (_$v != null) {
      _darkMode = _$v.darkMode;
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateDarkMode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateDarkMode;
  }

  @override
  void update(void Function(UpdateDarkModeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateDarkMode build() {
    final _$result =
        _$v ?? new _$UpdateDarkMode._(darkMode: darkMode, completer: completer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
