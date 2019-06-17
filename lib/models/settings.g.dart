// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Settings> _$settingsSerializer = new _$SettingsSerializer();
Serializer<NavigationSettings> _$navigationSettingsSerializer =
    new _$NavigationSettingsSerializer();
Serializer<ThemeSettings> _$themeSettingsSerializer =
    new _$ThemeSettingsSerializer();

class _$SettingsSerializer implements StructuredSerializer<Settings> {
  @override
  final Iterable<Type> types = const [Settings, _$Settings];
  @override
  final String wireName = 'Settings';

  @override
  Iterable serialize(Serializers serializers, Settings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.navigationSettings != null) {
      result
        ..add('navigationSettings')
        ..add(serializers.serialize(object.navigationSettings,
            specifiedType: const FullType(NavigationSettings)));
    }
    if (object.themeSettings != null) {
      result
        ..add('themeSettings')
        ..add(serializers.serialize(object.themeSettings,
            specifiedType: const FullType(ThemeSettings)));
    }
    return result;
  }

  @override
  Settings deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'navigationSettings':
          result.navigationSettings = serializers.deserialize(value,
                  specifiedType: const FullType(NavigationSettings))
              as NavigationSettings;
          break;
        case 'themeSettings':
          result.themeSettings = serializers.deserialize(value,
              specifiedType: const FullType(ThemeSettings)) as ThemeSettings;
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
    final result = <Object>[];
    if (object.defaultPage != null) {
      result
        ..add('defaultPage')
        ..add(serializers.serialize(object.defaultPage,
            specifiedType: const FullType(Page)));
    }
    if (object.bottomNavigationPages != null) {
      result
        ..add('bottomNavigationPages')
        ..add(serializers.serialize(object.bottomNavigationPages,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Page)])));
    }
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
              specifiedType: const FullType(Page)) as Page;
          break;
        case 'bottomNavigationPages':
          result.bottomNavigationPages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Page)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ThemeSettingsSerializer implements StructuredSerializer<ThemeSettings> {
  @override
  final Iterable<Type> types = const [ThemeSettings, _$ThemeSettings];
  @override
  final String wireName = 'ThemeSettings';

  @override
  Iterable serialize(Serializers serializers, ThemeSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.darkMode != null) {
      result
        ..add('darkMode')
        ..add(serializers.serialize(object.darkMode,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ThemeSettings deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThemeSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'darkMode':
          result.darkMode = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Settings extends Settings {
  @override
  final NavigationSettings navigationSettings;
  @override
  final ThemeSettings themeSettings;

  factory _$Settings([void Function(SettingsBuilder) updates]) =>
      (new SettingsBuilder()..update(updates)).build() as _$Settings;

  _$Settings._({this.navigationSettings, this.themeSettings}) : super._();

  @override
  Settings rebuild(void Function(SettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$SettingsBuilder toBuilder() => new _$SettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings &&
        navigationSettings == other.navigationSettings &&
        themeSettings == other.themeSettings;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, navigationSettings.hashCode), themeSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Settings')
          ..add('navigationSettings', navigationSettings)
          ..add('themeSettings', themeSettings))
        .toString();
  }
}

class _$SettingsBuilder extends SettingsBuilder {
  _$Settings _$v;

  @override
  NavigationSettings get navigationSettings {
    _$this;
    return super.navigationSettings;
  }

  @override
  set navigationSettings(NavigationSettings navigationSettings) {
    _$this;
    super.navigationSettings = navigationSettings;
  }

  @override
  ThemeSettings get themeSettings {
    _$this;
    return super.themeSettings;
  }

  @override
  set themeSettings(ThemeSettings themeSettings) {
    _$this;
    super.themeSettings = themeSettings;
  }

  _$SettingsBuilder() : super._();

  SettingsBuilder get _$this {
    if (_$v != null) {
      super.navigationSettings = _$v.navigationSettings;
      super.themeSettings = _$v.themeSettings;
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
  void update(void Function(SettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Settings build() {
    final _$result = _$v ??
        new _$Settings._(
            navigationSettings: navigationSettings,
            themeSettings: themeSettings);
    replace(_$result);
    return _$result;
  }
}

class _$NavigationSettings extends NavigationSettings {
  @override
  final Page defaultPage;
  @override
  final BuiltList<Page> bottomNavigationPages;

  factory _$NavigationSettings(
          [void Function(NavigationSettingsBuilder) updates]) =>
      (new NavigationSettingsBuilder()..update(updates)).build();

  _$NavigationSettings._({this.defaultPage, this.bottomNavigationPages})
      : super._();

  @override
  NavigationSettings rebuild(
          void Function(NavigationSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationSettingsBuilder toBuilder() =>
      new NavigationSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationSettings &&
        defaultPage == other.defaultPage &&
        bottomNavigationPages == other.bottomNavigationPages;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, defaultPage.hashCode), bottomNavigationPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationSettings')
          ..add('defaultPage', defaultPage)
          ..add('bottomNavigationPages', bottomNavigationPages))
        .toString();
  }
}

class NavigationSettingsBuilder
    implements Builder<NavigationSettings, NavigationSettingsBuilder> {
  _$NavigationSettings _$v;

  Page _defaultPage;
  Page get defaultPage => _$this._defaultPage;
  set defaultPage(Page defaultPage) => _$this._defaultPage = defaultPage;

  ListBuilder<Page> _bottomNavigationPages;
  ListBuilder<Page> get bottomNavigationPages =>
      _$this._bottomNavigationPages ??= new ListBuilder<Page>();
  set bottomNavigationPages(ListBuilder<Page> bottomNavigationPages) =>
      _$this._bottomNavigationPages = bottomNavigationPages;

  NavigationSettingsBuilder();

  NavigationSettingsBuilder get _$this {
    if (_$v != null) {
      _defaultPage = _$v.defaultPage;
      _bottomNavigationPages = _$v.bottomNavigationPages?.toBuilder();
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
  void update(void Function(NavigationSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationSettings build() {
    _$NavigationSettings _$result;
    try {
      _$result = _$v ??
          new _$NavigationSettings._(
              defaultPage: defaultPage,
              bottomNavigationPages: _bottomNavigationPages?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bottomNavigationPages';
        _bottomNavigationPages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NavigationSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThemeSettings extends ThemeSettings {
  @override
  final bool darkMode;

  factory _$ThemeSettings([void Function(ThemeSettingsBuilder) updates]) =>
      (new ThemeSettingsBuilder()..update(updates)).build() as _$ThemeSettings;

  _$ThemeSettings._({this.darkMode}) : super._();

  @override
  ThemeSettings rebuild(void Function(ThemeSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ThemeSettingsBuilder toBuilder() =>
      new _$ThemeSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeSettings && darkMode == other.darkMode;
  }

  @override
  int get hashCode {
    return $jf($jc(0, darkMode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeSettings')
          ..add('darkMode', darkMode))
        .toString();
  }
}

class _$ThemeSettingsBuilder extends ThemeSettingsBuilder {
  _$ThemeSettings _$v;

  @override
  bool get darkMode {
    _$this;
    return super.darkMode;
  }

  @override
  set darkMode(bool darkMode) {
    _$this;
    super.darkMode = darkMode;
  }

  _$ThemeSettingsBuilder() : super._();

  ThemeSettingsBuilder get _$this {
    if (_$v != null) {
      super.darkMode = _$v.darkMode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemeSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThemeSettings;
  }

  @override
  void update(void Function(ThemeSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeSettings build() {
    final _$result = _$v ?? new _$ThemeSettings._(darkMode: darkMode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
