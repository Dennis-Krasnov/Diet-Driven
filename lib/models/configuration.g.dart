// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteConfiguration extends RemoteConfiguration {
  @override
  final bool defaultConfiguration;
  @override
  final int bonus;

  factory _$RemoteConfiguration([void updates(RemoteConfigurationBuilder b)]) =>
      (new RemoteConfigurationBuilder()..update(updates)).build();

  _$RemoteConfiguration._({this.defaultConfiguration, this.bonus}) : super._() {
    if (defaultConfiguration == null) {
      throw new BuiltValueNullFieldError(
          'RemoteConfiguration', 'defaultConfiguration');
    }
    if (bonus == null) {
      throw new BuiltValueNullFieldError('RemoteConfiguration', 'bonus');
    }
  }

  @override
  RemoteConfiguration rebuild(void updates(RemoteConfigurationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteConfigurationBuilder toBuilder() =>
      new RemoteConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteConfiguration &&
        defaultConfiguration == other.defaultConfiguration &&
        bonus == other.bonus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, defaultConfiguration.hashCode), bonus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfiguration')
          ..add('defaultConfiguration', defaultConfiguration)
          ..add('bonus', bonus))
        .toString();
  }
}

class RemoteConfigurationBuilder
    implements Builder<RemoteConfiguration, RemoteConfigurationBuilder> {
  _$RemoteConfiguration _$v;

  bool _defaultConfiguration;
  bool get defaultConfiguration => _$this._defaultConfiguration;
  set defaultConfiguration(bool defaultConfiguration) =>
      _$this._defaultConfiguration = defaultConfiguration;

  int _bonus;
  int get bonus => _$this._bonus;
  set bonus(int bonus) => _$this._bonus = bonus;

  RemoteConfigurationBuilder();

  RemoteConfigurationBuilder get _$this {
    if (_$v != null) {
      _defaultConfiguration = _$v.defaultConfiguration;
      _bonus = _$v.bonus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteConfiguration other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteConfiguration;
  }

  @override
  void update(void updates(RemoteConfigurationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteConfiguration build() {
    final _$result = _$v ??
        new _$RemoteConfiguration._(
            defaultConfiguration: defaultConfiguration, bonus: bonus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
