// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavigationSettings> _$navigationSettingsSerializer =
    new _$NavigationSettingsSerializer();

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
      'defaultPage',
      serializers.serialize(object.defaultPage,
          specifiedType: const FullType(String)),
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
        case 'defaultPage':
          result.defaultPage = serializers.deserialize(value,
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

class _$NavigationSettings extends NavigationSettings {
  @override
  final String defaultPage;

  factory _$NavigationSettings([void updates(NavigationSettingsBuilder b)]) =>
      (new NavigationSettingsBuilder()..update(updates)).build()
          as _$NavigationSettings;

  _$NavigationSettings._({this.defaultPage}) : super._() {
    if (defaultPage == null) {
      throw new BuiltValueNullFieldError('NavigationSettings', 'defaultPage');
    }
  }

  @override
  NavigationSettings rebuild(void updates(NavigationSettingsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigationSettingsBuilder toBuilder() =>
      new _$NavigationSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationSettings && defaultPage == other.defaultPage;
  }

  @override
  int get hashCode {
    return $jf($jc(0, defaultPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationSettings')
          ..add('defaultPage', defaultPage))
        .toString();
  }
}

class _$NavigationSettingsBuilder extends NavigationSettingsBuilder {
  _$NavigationSettings _$v;

  @override
  String get defaultPage {
    _$this;
    return super.defaultPage;
  }

  @override
  set defaultPage(String defaultPage) {
    _$this;
    super.defaultPage = defaultPage;
  }

  _$NavigationSettingsBuilder() : super._();

  NavigationSettingsBuilder get _$this {
    if (_$v != null) {
      super.defaultPage = _$v.defaultPage;
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
    final _$result =
        _$v ?? new _$NavigationSettings._(defaultPage: defaultPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
