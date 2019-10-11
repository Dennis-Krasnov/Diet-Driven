// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConnectivityStatus _$wifi = const ConnectivityStatus._('wifi');
const ConnectivityStatus _$mobile = const ConnectivityStatus._('mobile');
const ConnectivityStatus _$disconnected =
    const ConnectivityStatus._('disconnected');

ConnectivityStatus _$valueOf(String name) {
  switch (name) {
    case 'wifi':
      return _$wifi;
    case 'mobile':
      return _$mobile;
    case 'disconnected':
      return _$disconnected;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ConnectivityStatus> _$values =
    new BuiltSet<ConnectivityStatus>(const <ConnectivityStatus>[
  _$wifi,
  _$mobile,
  _$disconnected,
]);

class _$RemoteConfiguration extends RemoteConfiguration {
  @override
  final bool liveConfiguration;
  @override
  final int bonus;

  factory _$RemoteConfiguration(
          [void Function(RemoteConfigurationBuilder) updates]) =>
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
  RemoteConfiguration rebuild(
          void Function(RemoteConfigurationBuilder) updates) =>
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
  void update(void Function(RemoteConfigurationBuilder) updates) {
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

class _$PackageInformation extends PackageInformation {
  @override
  final String appName;
  @override
  final String packageName;
  @override
  final String version;
  @override
  final String buildNumber;

  factory _$PackageInformation(
          [void Function(PackageInformationBuilder) updates]) =>
      (new PackageInformationBuilder()..update(updates)).build();

  _$PackageInformation._(
      {this.appName, this.packageName, this.version, this.buildNumber})
      : super._() {
    if (appName == null) {
      throw new BuiltValueNullFieldError('PackageInformation', 'appName');
    }
    if (packageName == null) {
      throw new BuiltValueNullFieldError('PackageInformation', 'packageName');
    }
    if (version == null) {
      throw new BuiltValueNullFieldError('PackageInformation', 'version');
    }
    if (buildNumber == null) {
      throw new BuiltValueNullFieldError('PackageInformation', 'buildNumber');
    }
  }

  @override
  PackageInformation rebuild(
          void Function(PackageInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageInformationBuilder toBuilder() =>
      new PackageInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackageInformation &&
        appName == other.appName &&
        packageName == other.packageName &&
        version == other.version &&
        buildNumber == other.buildNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, appName.hashCode), packageName.hashCode),
            version.hashCode),
        buildNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PackageInformation')
          ..add('appName', appName)
          ..add('packageName', packageName)
          ..add('version', version)
          ..add('buildNumber', buildNumber))
        .toString();
  }
}

class PackageInformationBuilder
    implements Builder<PackageInformation, PackageInformationBuilder> {
  _$PackageInformation _$v;

  String _appName;
  String get appName => _$this._appName;
  set appName(String appName) => _$this._appName = appName;

  String _packageName;
  String get packageName => _$this._packageName;
  set packageName(String packageName) => _$this._packageName = packageName;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  String _buildNumber;
  String get buildNumber => _$this._buildNumber;
  set buildNumber(String buildNumber) => _$this._buildNumber = buildNumber;

  PackageInformationBuilder();

  PackageInformationBuilder get _$this {
    if (_$v != null) {
      _appName = _$v.appName;
      _packageName = _$v.packageName;
      _version = _$v.version;
      _buildNumber = _$v.buildNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PackageInformation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PackageInformation;
  }

  @override
  void update(void Function(PackageInformationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PackageInformation build() {
    final _$result = _$v ??
        new _$PackageInformation._(
            appName: appName,
            packageName: packageName,
            version: version,
            buildNumber: buildNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
