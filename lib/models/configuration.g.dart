// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteConfiguration extends RemoteConfiguration {
  @override
  final bool liveConfiguration;
  @override
  final int bonus;

  factory _$RemoteConfiguration([void updates(RemoteConfigurationBuilder b)]) =>
      (new RemoteConfigurationBuilder()..update(updates)).build()
          as _$RemoteConfiguration;

  _$RemoteConfiguration._({this.liveConfiguration, this.bonus}) : super._() {
    if (liveConfiguration == null) {
      throw new BuiltValueNullFieldError(
          'RemoteConfiguration', 'liveConfiguration');
    }
    if (bonus == null) {
      throw new BuiltValueNullFieldError('RemoteConfiguration', 'bonus');
    }
  }

  @override
  RemoteConfiguration rebuild(void updates(RemoteConfigurationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RemoteConfigurationBuilder toBuilder() =>
      new _$RemoteConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteConfiguration &&
        liveConfiguration == other.liveConfiguration &&
        bonus == other.bonus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, liveConfiguration.hashCode), bonus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfiguration')
          ..add('liveConfiguration', liveConfiguration)
          ..add('bonus', bonus))
        .toString();
  }
}

class _$RemoteConfigurationBuilder extends RemoteConfigurationBuilder {
  _$RemoteConfiguration _$v;

  @override
  bool get liveConfiguration {
    _$this;
    return super.liveConfiguration;
  }

  @override
  set liveConfiguration(bool liveConfiguration) {
    _$this;
    super.liveConfiguration = liveConfiguration;
  }

  @override
  int get bonus {
    _$this;
    return super.bonus;
  }

  @override
  set bonus(int bonus) {
    _$this;
    super.bonus = bonus;
  }

  _$RemoteConfigurationBuilder() : super._();

  RemoteConfigurationBuilder get _$this {
    if (_$v != null) {
      super.liveConfiguration = _$v.liveConfiguration;
      super.bonus = _$v.bonus;
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
            liveConfiguration: liveConfiguration, bonus: bonus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
