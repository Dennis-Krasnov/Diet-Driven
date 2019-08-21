// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfigurationUninitialized extends ConfigurationUninitialized {
  factory _$ConfigurationUninitialized(
          [void Function(ConfigurationUninitializedBuilder) updates]) =>
      (new ConfigurationUninitializedBuilder()..update(updates)).build();

  _$ConfigurationUninitialized._() : super._();

  @override
  ConfigurationUninitialized rebuild(
          void Function(ConfigurationUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationUninitializedBuilder toBuilder() =>
      new ConfigurationUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationUninitialized;
  }

  @override
  int get hashCode {
    return 787888127;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ConfigurationUninitialized').toString();
  }
}

class ConfigurationUninitializedBuilder
    implements
        Builder<ConfigurationUninitialized, ConfigurationUninitializedBuilder> {
  _$ConfigurationUninitialized _$v;

  ConfigurationUninitializedBuilder();

  @override
  void replace(ConfigurationUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigurationUninitialized;
  }

  @override
  void update(void Function(ConfigurationUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationUninitialized build() {
    final _$result = _$v ?? new _$ConfigurationUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$ConfigurationFailed extends ConfigurationFailed {
  @override
  final Object error;
  @override
  final StackTrace stacktrace;

  factory _$ConfigurationFailed(
          [void Function(ConfigurationFailedBuilder) updates]) =>
      (new ConfigurationFailedBuilder()..update(updates)).build();

  _$ConfigurationFailed._({this.error, this.stacktrace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('ConfigurationFailed', 'error');
    }
  }

  @override
  ConfigurationFailed rebuild(
          void Function(ConfigurationFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationFailedBuilder toBuilder() =>
      new ConfigurationFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationFailed &&
        error == other.error &&
        stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), stacktrace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationFailed')
          ..add('error', error)
          ..add('stacktrace', stacktrace))
        .toString();
  }
}

class ConfigurationFailedBuilder
    implements
        Builder<ConfigurationFailed, ConfigurationFailedBuilder>,
        BuiltErrorBuilder {
  _$ConfigurationFailed _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  ConfigurationFailedBuilder();

  ConfigurationFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigurationFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigurationFailed;
  }

  @override
  void update(void Function(ConfigurationFailedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationFailed build() {
    final _$result = _$v ??
        new _$ConfigurationFailed._(error: error, stacktrace: stacktrace);
    replace(_$result);
    return _$result;
  }
}

class _$ConfigurationLoaded extends ConfigurationLoaded {
  @override
  final RemoteConfiguration remoteConfiguration;
  @override
  final PackageInfo packageInfo;
  @override
  final ConnectivityResult connectivity;

  factory _$ConfigurationLoaded(
          [void Function(ConfigurationLoadedBuilder) updates]) =>
      (new ConfigurationLoadedBuilder()..update(updates)).build();

  _$ConfigurationLoaded._(
      {this.remoteConfiguration, this.packageInfo, this.connectivity})
      : super._() {
    if (remoteConfiguration == null) {
      throw new BuiltValueNullFieldError(
          'ConfigurationLoaded', 'remoteConfiguration');
    }
    if (packageInfo == null) {
      throw new BuiltValueNullFieldError('ConfigurationLoaded', 'packageInfo');
    }
    if (connectivity == null) {
      throw new BuiltValueNullFieldError('ConfigurationLoaded', 'connectivity');
    }
  }

  @override
  ConfigurationLoaded rebuild(
          void Function(ConfigurationLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationLoadedBuilder toBuilder() =>
      new ConfigurationLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationLoaded &&
        remoteConfiguration == other.remoteConfiguration &&
        packageInfo == other.packageInfo &&
        connectivity == other.connectivity;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, remoteConfiguration.hashCode), packageInfo.hashCode),
        connectivity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationLoaded')
          ..add('remoteConfiguration', remoteConfiguration)
          ..add('packageInfo', packageInfo)
          ..add('connectivity', connectivity))
        .toString();
  }
}

class ConfigurationLoadedBuilder
    implements Builder<ConfigurationLoaded, ConfigurationLoadedBuilder> {
  _$ConfigurationLoaded _$v;

  RemoteConfigurationBuilder _remoteConfiguration;
  RemoteConfigurationBuilder get remoteConfiguration =>
      _$this._remoteConfiguration ??= new RemoteConfigurationBuilder();
  set remoteConfiguration(RemoteConfigurationBuilder remoteConfiguration) =>
      _$this._remoteConfiguration = remoteConfiguration;

  PackageInfo _packageInfo;
  PackageInfo get packageInfo => _$this._packageInfo;
  set packageInfo(PackageInfo packageInfo) => _$this._packageInfo = packageInfo;

  ConnectivityResult _connectivity;
  ConnectivityResult get connectivity => _$this._connectivity;
  set connectivity(ConnectivityResult connectivity) =>
      _$this._connectivity = connectivity;

  ConfigurationLoadedBuilder();

  ConfigurationLoadedBuilder get _$this {
    if (_$v != null) {
      _remoteConfiguration = _$v.remoteConfiguration?.toBuilder();
      _packageInfo = _$v.packageInfo;
      _connectivity = _$v.connectivity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigurationLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigurationLoaded;
  }

  @override
  void update(void Function(ConfigurationLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationLoaded build() {
    _$ConfigurationLoaded _$result;
    try {
      _$result = _$v ??
          new _$ConfigurationLoaded._(
              remoteConfiguration: remoteConfiguration.build(),
              packageInfo: packageInfo,
              connectivity: connectivity);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'remoteConfiguration';
        remoteConfiguration.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ConfigurationLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
