// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitConfiguration extends InitConfiguration {
  factory _$InitConfiguration(
          [void Function(InitConfigurationBuilder) updates]) =>
      (new InitConfigurationBuilder()..update(updates)).build();

  _$InitConfiguration._() : super._();

  @override
  InitConfiguration rebuild(void Function(InitConfigurationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitConfigurationBuilder toBuilder() =>
      new InitConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitConfiguration;
  }

  @override
  int get hashCode {
    return 432678889;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('InitConfiguration').toString();
  }
}

class InitConfigurationBuilder
    implements Builder<InitConfiguration, InitConfigurationBuilder> {
  _$InitConfiguration _$v;

  InitConfigurationBuilder();

  @override
  void replace(InitConfiguration other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitConfiguration;
  }

  @override
  void update(void Function(InitConfigurationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitConfiguration build() {
    final _$result = _$v ?? new _$InitConfiguration._();
    replace(_$result);
    return _$result;
  }
}

class _$IngressConfigurationArrived extends IngressConfigurationArrived {
  @override
  final RemoteConfiguration remoteConfiguration;
  @override
  final PackageInformation packageInfo;
  @override
  final ConnectivityStatus connectivity;

  factory _$IngressConfigurationArrived(
          [void Function(IngressConfigurationArrivedBuilder) updates]) =>
      (new IngressConfigurationArrivedBuilder()..update(updates)).build();

  _$IngressConfigurationArrived._(
      {this.remoteConfiguration, this.packageInfo, this.connectivity})
      : super._() {
    if (remoteConfiguration == null) {
      throw new BuiltValueNullFieldError(
          'IngressConfigurationArrived', 'remoteConfiguration');
    }
    if (packageInfo == null) {
      throw new BuiltValueNullFieldError(
          'IngressConfigurationArrived', 'packageInfo');
    }
    if (connectivity == null) {
      throw new BuiltValueNullFieldError(
          'IngressConfigurationArrived', 'connectivity');
    }
  }

  @override
  IngressConfigurationArrived rebuild(
          void Function(IngressConfigurationArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IngressConfigurationArrivedBuilder toBuilder() =>
      new IngressConfigurationArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IngressConfigurationArrived &&
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
    return (newBuiltValueToStringHelper('IngressConfigurationArrived')
          ..add('remoteConfiguration', remoteConfiguration)
          ..add('packageInfo', packageInfo)
          ..add('connectivity', connectivity))
        .toString();
  }
}

class IngressConfigurationArrivedBuilder
    implements
        Builder<IngressConfigurationArrived,
            IngressConfigurationArrivedBuilder> {
  _$IngressConfigurationArrived _$v;

  RemoteConfigurationBuilder _remoteConfiguration;
  RemoteConfigurationBuilder get remoteConfiguration =>
      _$this._remoteConfiguration ??= new RemoteConfigurationBuilder();
  set remoteConfiguration(RemoteConfigurationBuilder remoteConfiguration) =>
      _$this._remoteConfiguration = remoteConfiguration;

  PackageInformationBuilder _packageInfo;
  PackageInformationBuilder get packageInfo =>
      _$this._packageInfo ??= new PackageInformationBuilder();
  set packageInfo(PackageInformationBuilder packageInfo) =>
      _$this._packageInfo = packageInfo;

  ConnectivityStatus _connectivity;
  ConnectivityStatus get connectivity => _$this._connectivity;
  set connectivity(ConnectivityStatus connectivity) =>
      _$this._connectivity = connectivity;

  IngressConfigurationArrivedBuilder();

  IngressConfigurationArrivedBuilder get _$this {
    if (_$v != null) {
      _remoteConfiguration = _$v.remoteConfiguration?.toBuilder();
      _packageInfo = _$v.packageInfo?.toBuilder();
      _connectivity = _$v.connectivity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IngressConfigurationArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$IngressConfigurationArrived;
  }

  @override
  void update(void Function(IngressConfigurationArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IngressConfigurationArrived build() {
    _$IngressConfigurationArrived _$result;
    try {
      _$result = _$v ??
          new _$IngressConfigurationArrived._(
              remoteConfiguration: remoteConfiguration.build(),
              packageInfo: packageInfo.build(),
              connectivity: connectivity);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'remoteConfiguration';
        remoteConfiguration.build();
        _$failedField = 'packageInfo';
        packageInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'IngressConfigurationArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ConfigurationError extends ConfigurationError {
  @override
  final Object error;
  @override
  final StackTrace stacktrace;

  factory _$ConfigurationError(
          [void Function(ConfigurationErrorBuilder) updates]) =>
      (new ConfigurationErrorBuilder()..update(updates)).build();

  _$ConfigurationError._({this.error, this.stacktrace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('ConfigurationError', 'error');
    }
  }

  @override
  ConfigurationError rebuild(
          void Function(ConfigurationErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationErrorBuilder toBuilder() =>
      new ConfigurationErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationError &&
        error == other.error &&
        stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), stacktrace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationError')
          ..add('error', error)
          ..add('stacktrace', stacktrace))
        .toString();
  }
}

class ConfigurationErrorBuilder
    implements
        Builder<ConfigurationError, ConfigurationErrorBuilder>,
        BuiltErrorBuilder {
  _$ConfigurationError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  ConfigurationErrorBuilder();

  ConfigurationErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigurationError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigurationError;
  }

  @override
  void update(void Function(ConfigurationErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationError build() {
    final _$result =
        _$v ?? new _$ConfigurationError._(error: error, stacktrace: stacktrace);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
