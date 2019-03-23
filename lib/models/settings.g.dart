// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserData> _$userDataSerializer = new _$UserDataSerializer();
Serializer<NavigationSettings> _$navigationSettingsSerializer =
    new _$NavigationSettingsSerializer();

class _$UserDataSerializer implements StructuredSerializer<UserData> {
  @override
  final Iterable<Type> types = const [UserData, _$UserData];
  @override
  final String wireName = 'UserData';

  @override
  Iterable serialize(Serializers serializers, UserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'staleRemoteConfig',
      serializers.serialize(object.staleRemoteConfig,
          specifiedType: const FullType(bool)),
      'currentSubscription',
      serializers.serialize(object.currentSubscription,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'staleRemoteConfig':
          result.staleRemoteConfig = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'currentSubscription':
          result.currentSubscription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NavigationSettingsSerializer
    implements StructuredSerializer<NavigationSettings> {
  @override
  final Iterable<Type> types = const [NavigationSettings, _$NavigationSettings];
  @override
  final String wireName = 'NavigationSettings';

  @override
  Iterable serialize(Serializers serializers, NavigationSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'temp',
      serializers.serialize(object.temp, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NavigationSettings deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NavigationSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Settings extends Settings {
  @override
  final NavigationSettings navigationSettings;

  factory _$Settings([void updates(SettingsBuilder b)]) =>
      (new SettingsBuilder()..update(updates)).build();

  _$Settings._({this.navigationSettings}) : super._() {
    if (navigationSettings == null) {
      throw new BuiltValueNullFieldError('Settings', 'navigationSettings');
    }
  }

  @override
  Settings rebuild(void updates(SettingsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsBuilder toBuilder() => new SettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings && navigationSettings == other.navigationSettings;
  }

  @override
  int get hashCode {
    return $jf($jc(0, navigationSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Settings')
          ..add('navigationSettings', navigationSettings))
        .toString();
  }
}

class SettingsBuilder implements Builder<Settings, SettingsBuilder> {
  _$Settings _$v;

  NavigationSettingsBuilder _navigationSettings;
  NavigationSettingsBuilder get navigationSettings =>
      _$this._navigationSettings ??= new NavigationSettingsBuilder();
  set navigationSettings(NavigationSettingsBuilder navigationSettings) =>
      _$this._navigationSettings = navigationSettings;

  SettingsBuilder();

  SettingsBuilder get _$this {
    if (_$v != null) {
      _navigationSettings = _$v.navigationSettings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Settings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Settings;
  }

  @override
  void update(void updates(SettingsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Settings build() {
    _$Settings _$result;
    try {
      _$result = _$v ??
          new _$Settings._(navigationSettings: navigationSettings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'navigationSettings';
        navigationSettings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Settings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserData extends UserData {
  @override
  final bool staleRemoteConfig;
  @override
  final String currentSubscription;

  factory _$UserData([void updates(UserDataBuilder b)]) =>
      (new UserDataBuilder()..update(updates)).build();

  _$UserData._({this.staleRemoteConfig, this.currentSubscription}) : super._() {
    if (staleRemoteConfig == null) {
      throw new BuiltValueNullFieldError('UserData', 'staleRemoteConfig');
    }
    if (currentSubscription == null) {
      throw new BuiltValueNullFieldError('UserData', 'currentSubscription');
    }
  }

  @override
  UserData rebuild(void updates(UserDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataBuilder toBuilder() => new UserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserData &&
        staleRemoteConfig == other.staleRemoteConfig &&
        currentSubscription == other.currentSubscription;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, staleRemoteConfig.hashCode), currentSubscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserData')
          ..add('staleRemoteConfig', staleRemoteConfig)
          ..add('currentSubscription', currentSubscription))
        .toString();
  }
}

class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  _$UserData _$v;

  bool _staleRemoteConfig;
  bool get staleRemoteConfig => _$this._staleRemoteConfig;
  set staleRemoteConfig(bool staleRemoteConfig) =>
      _$this._staleRemoteConfig = staleRemoteConfig;

  String _currentSubscription;
  String get currentSubscription => _$this._currentSubscription;
  set currentSubscription(String currentSubscription) =>
      _$this._currentSubscription = currentSubscription;

  UserDataBuilder();

  UserDataBuilder get _$this {
    if (_$v != null) {
      _staleRemoteConfig = _$v.staleRemoteConfig;
      _currentSubscription = _$v.currentSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserData;
  }

  @override
  void update(void updates(UserDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserData build() {
    final _$result = _$v ??
        new _$UserData._(
            staleRemoteConfig: staleRemoteConfig,
            currentSubscription: currentSubscription);
    replace(_$result);
    return _$result;
  }
}

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

class _$NavigationSettings extends NavigationSettings {
  @override
  final String temp;

  factory _$NavigationSettings([void updates(NavigationSettingsBuilder b)]) =>
      (new NavigationSettingsBuilder()..update(updates)).build();

  _$NavigationSettings._({this.temp}) : super._() {
    if (temp == null) {
      throw new BuiltValueNullFieldError('NavigationSettings', 'temp');
    }
  }

  @override
  NavigationSettings rebuild(void updates(NavigationSettingsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationSettingsBuilder toBuilder() =>
      new NavigationSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationSettings && temp == other.temp;
  }

  @override
  int get hashCode {
    return $jf($jc(0, temp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationSettings')
          ..add('temp', temp))
        .toString();
  }
}

class NavigationSettingsBuilder
    implements Builder<NavigationSettings, NavigationSettingsBuilder> {
  _$NavigationSettings _$v;

  String _temp;
  String get temp => _$this._temp;
  set temp(String temp) => _$this._temp = temp;

  NavigationSettingsBuilder();

  NavigationSettingsBuilder get _$this {
    if (_$v != null) {
      _temp = _$v.temp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationSettings;
  }

  @override
  void update(void updates(NavigationSettingsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationSettings build() {
    final _$result = _$v ?? new _$NavigationSettings._(temp: temp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
