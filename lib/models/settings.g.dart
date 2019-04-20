// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Settings> _$settingsSerializer = new _$SettingsSerializer();
Serializer<NavigationSettings> _$navigationSettingsSerializer =
    new _$NavigationSettingsSerializer();

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
          result.navigationSettings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NavigationSettings))
              as NavigationSettings);
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
            specifiedType: const FullType(String)));
    }
    if (object.bottomNavigationPages != null) {
      result
        ..add('bottomNavigationPages')
        ..add(serializers.serialize(object.bottomNavigationPages,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
              specifiedType: const FullType(String)) as String;
          break;
        case 'bottomNavigationPages':
          result.bottomNavigationPages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
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

  _$Settings._({this.navigationSettings}) : super._();

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
          new _$Settings._(navigationSettings: _navigationSettings?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'navigationSettings';
        _navigationSettings?.build();
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
  @override
  final BuiltList<String> bottomNavigationPages;

  factory _$NavigationSettings([void updates(NavigationSettingsBuilder b)]) =>
      (new NavigationSettingsBuilder()..update(updates)).build();

  _$NavigationSettings._({this.defaultPage, this.bottomNavigationPages})
      : super._();

  @override
  NavigationSettings rebuild(void updates(NavigationSettingsBuilder b)) =>
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

  String _defaultPage;
  String get defaultPage => _$this._defaultPage;
  set defaultPage(String defaultPage) => _$this._defaultPage = defaultPage;

  ListBuilder<String> _bottomNavigationPages;
  ListBuilder<String> get bottomNavigationPages =>
      _$this._bottomNavigationPages ??= new ListBuilder<String>();
  set bottomNavigationPages(ListBuilder<String> bottomNavigationPages) =>
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
  void update(void updates(NavigationSettingsBuilder b)) {
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
