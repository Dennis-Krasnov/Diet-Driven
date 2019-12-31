// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Settings> _$settingsSerializer = new _$SettingsSerializer();
Serializer<DiarySettings> _$diarySettingsSerializer =
    new _$DiarySettingsSerializer();
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
  Iterable<Object> serialize(Serializers serializers, Settings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.diary != null) {
      result
        ..add('diary')
        ..add(serializers.serialize(object.diary,
            specifiedType: const FullType(DiarySettings)));
    }
    if (object.navigation != null) {
      result
        ..add('navigation')
        ..add(serializers.serialize(object.navigation,
            specifiedType: const FullType(NavigationSettings)));
    }
    if (object.theme != null) {
      result
        ..add('theme')
        ..add(serializers.serialize(object.theme,
            specifiedType: const FullType(ThemeSettings)));
    }
    return result;
  }

  @override
  Settings deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'diary':
          result.diary.replace(serializers.deserialize(value,
              specifiedType: const FullType(DiarySettings)) as DiarySettings);
          break;
        case 'navigation':
          result.navigation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NavigationSettings))
              as NavigationSettings);
          break;
        case 'theme':
          result.theme.replace(serializers.deserialize(value,
              specifiedType: const FullType(ThemeSettings)) as ThemeSettings);
          break;
      }
    }

    return result.build();
  }
}

class _$DiarySettingsSerializer implements StructuredSerializer<DiarySettings> {
  @override
  final Iterable<Type> types = const [DiarySettings, _$DiarySettings];
  @override
  final String wireName = 'DiarySettings';

  @override
  Iterable<Object> serialize(Serializers serializers, DiarySettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'macroOrder',
      serializers.serialize(object.macroOrder,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Nutrient)])),
    ];

    return result;
  }

  @override
  DiarySettings deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiarySettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'macroOrder':
          result.macroOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Nutrient)]))
              as BuiltList<dynamic>);
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
  Iterable<Object> serialize(Serializers serializers, NavigationSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  NavigationSettings deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new NavigationSettingsBuilder().build();
  }
}

class _$ThemeSettingsSerializer implements StructuredSerializer<ThemeSettings> {
  @override
  final Iterable<Type> types = const [ThemeSettings, _$ThemeSettings];
  @override
  final String wireName = 'ThemeSettings';

  @override
  Iterable<Object> serialize(Serializers serializers, ThemeSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.darkMode != null) {
      result
        ..add('darkMode')
        ..add(serializers.serialize(object.darkMode,
            specifiedType: const FullType(bool)));
    }
    if (object.primaryColour != null) {
      result
        ..add('primaryColour')
        ..add(serializers.serialize(object.primaryColour,
            specifiedType: const FullType(String)));
    }
    if (object.macroColours != null) {
      result
        ..add('macroColours')
        ..add(serializers.serialize(object.macroColours,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(Nutrient), const FullType(String)])));
    }
    if (object.darkMacroColours != null) {
      result
        ..add('darkMacroColours')
        ..add(serializers.serialize(object.darkMacroColours,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(Nutrient), const FullType(String)])));
    }
    return result;
  }

  @override
  ThemeSettings deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
        case 'primaryColour':
          result.primaryColour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'macroColours':
          result.macroColours.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(Nutrient),
                const FullType(String)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
        case 'darkMacroColours':
          result.darkMacroColours.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(Nutrient),
                const FullType(String)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Settings extends Settings {
  @override
  final DiarySettings diary;
  @override
  final NavigationSettings navigation;
  @override
  final ThemeSettings theme;

  factory _$Settings([void Function(SettingsBuilder) updates]) =>
      (new SettingsBuilder()..update(updates)).build();

  _$Settings._({this.diary, this.navigation, this.theme}) : super._();

  @override
  Settings rebuild(void Function(SettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsBuilder toBuilder() => new SettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings &&
        diary == other.diary &&
        navigation == other.navigation &&
        theme == other.theme;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, diary.hashCode), navigation.hashCode), theme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Settings')
          ..add('diary', diary)
          ..add('navigation', navigation)
          ..add('theme', theme))
        .toString();
  }
}

class SettingsBuilder implements Builder<Settings, SettingsBuilder> {
  _$Settings _$v;

  DiarySettingsBuilder _diary;
  DiarySettingsBuilder get diary =>
      _$this._diary ??= new DiarySettingsBuilder();
  set diary(DiarySettingsBuilder diary) => _$this._diary = diary;

  NavigationSettingsBuilder _navigation;
  NavigationSettingsBuilder get navigation =>
      _$this._navigation ??= new NavigationSettingsBuilder();
  set navigation(NavigationSettingsBuilder navigation) =>
      _$this._navigation = navigation;

  ThemeSettingsBuilder _theme;
  ThemeSettingsBuilder get theme =>
      _$this._theme ??= new ThemeSettingsBuilder();
  set theme(ThemeSettingsBuilder theme) => _$this._theme = theme;

  SettingsBuilder();

  SettingsBuilder get _$this {
    if (_$v != null) {
      _diary = _$v.diary?.toBuilder();
      _navigation = _$v.navigation?.toBuilder();
      _theme = _$v.theme?.toBuilder();
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
    _$Settings _$result;
    try {
      _$result = _$v ??
          new _$Settings._(
              diary: _diary?.build(),
              navigation: _navigation?.build(),
              theme: _theme?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diary';
        _diary?.build();
        _$failedField = 'navigation';
        _navigation?.build();
        _$failedField = 'theme';
        _theme?.build();
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

class _$DiarySettings extends DiarySettings {
  @override
  final BuiltList<Nutrient> macroOrder;

  factory _$DiarySettings([void Function(DiarySettingsBuilder) updates]) =>
      (new DiarySettingsBuilder()..update(updates)).build();

  _$DiarySettings._({this.macroOrder}) : super._() {
    if (macroOrder == null) {
      throw new BuiltValueNullFieldError('DiarySettings', 'macroOrder');
    }
  }

  @override
  DiarySettings rebuild(void Function(DiarySettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiarySettingsBuilder toBuilder() => new DiarySettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiarySettings && macroOrder == other.macroOrder;
  }

  @override
  int get hashCode {
    return $jf($jc(0, macroOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiarySettings')
          ..add('macroOrder', macroOrder))
        .toString();
  }
}

class DiarySettingsBuilder
    implements Builder<DiarySettings, DiarySettingsBuilder> {
  _$DiarySettings _$v;

  ListBuilder<Nutrient> _macroOrder;
  ListBuilder<Nutrient> get macroOrder =>
      _$this._macroOrder ??= new ListBuilder<Nutrient>();
  set macroOrder(ListBuilder<Nutrient> macroOrder) =>
      _$this._macroOrder = macroOrder;

  DiarySettingsBuilder();

  DiarySettingsBuilder get _$this {
    if (_$v != null) {
      _macroOrder = _$v.macroOrder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiarySettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiarySettings;
  }

  @override
  void update(void Function(DiarySettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiarySettings build() {
    _$DiarySettings _$result;
    try {
      _$result = _$v ?? new _$DiarySettings._(macroOrder: macroOrder.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'macroOrder';
        macroOrder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DiarySettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigationSettings extends NavigationSettings {
  factory _$NavigationSettings(
          [void Function(NavigationSettingsBuilder) updates]) =>
      (new NavigationSettingsBuilder()..update(updates)).build();

  _$NavigationSettings._() : super._();

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
    return other is NavigationSettings;
  }

  @override
  int get hashCode {
    return 933924940;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NavigationSettings').toString();
  }
}

class NavigationSettingsBuilder
    implements Builder<NavigationSettings, NavigationSettingsBuilder> {
  _$NavigationSettings _$v;

  NavigationSettingsBuilder();

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
    final _$result = _$v ?? new _$NavigationSettings._();
    replace(_$result);
    return _$result;
  }
}

class _$ThemeSettings extends ThemeSettings {
  @override
  final bool darkMode;
  @override
  final String primaryColour;
  @override
  final BuiltMap<Nutrient, String> macroColours;
  @override
  final BuiltMap<Nutrient, String> darkMacroColours;

  factory _$ThemeSettings([void Function(ThemeSettingsBuilder) updates]) =>
      (new ThemeSettingsBuilder()..update(updates)).build();

  _$ThemeSettings._(
      {this.darkMode,
      this.primaryColour,
      this.macroColours,
      this.darkMacroColours})
      : super._();

  @override
  ThemeSettings rebuild(void Function(ThemeSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeSettingsBuilder toBuilder() => new ThemeSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeSettings &&
        darkMode == other.darkMode &&
        primaryColour == other.primaryColour &&
        macroColours == other.macroColours &&
        darkMacroColours == other.darkMacroColours;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, darkMode.hashCode), primaryColour.hashCode),
            macroColours.hashCode),
        darkMacroColours.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeSettings')
          ..add('darkMode', darkMode)
          ..add('primaryColour', primaryColour)
          ..add('macroColours', macroColours)
          ..add('darkMacroColours', darkMacroColours))
        .toString();
  }
}

class ThemeSettingsBuilder
    implements Builder<ThemeSettings, ThemeSettingsBuilder> {
  _$ThemeSettings _$v;

  bool _darkMode;
  bool get darkMode => _$this._darkMode;
  set darkMode(bool darkMode) => _$this._darkMode = darkMode;

  String _primaryColour;
  String get primaryColour => _$this._primaryColour;
  set primaryColour(String primaryColour) =>
      _$this._primaryColour = primaryColour;

  MapBuilder<Nutrient, String> _macroColours;
  MapBuilder<Nutrient, String> get macroColours =>
      _$this._macroColours ??= new MapBuilder<Nutrient, String>();
  set macroColours(MapBuilder<Nutrient, String> macroColours) =>
      _$this._macroColours = macroColours;

  MapBuilder<Nutrient, String> _darkMacroColours;
  MapBuilder<Nutrient, String> get darkMacroColours =>
      _$this._darkMacroColours ??= new MapBuilder<Nutrient, String>();
  set darkMacroColours(MapBuilder<Nutrient, String> darkMacroColours) =>
      _$this._darkMacroColours = darkMacroColours;

  ThemeSettingsBuilder();

  ThemeSettingsBuilder get _$this {
    if (_$v != null) {
      _darkMode = _$v.darkMode;
      _primaryColour = _$v.primaryColour;
      _macroColours = _$v.macroColours?.toBuilder();
      _darkMacroColours = _$v.darkMacroColours?.toBuilder();
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
    _$ThemeSettings _$result;
    try {
      _$result = _$v ??
          new _$ThemeSettings._(
              darkMode: darkMode,
              primaryColour: primaryColour,
              macroColours: _macroColours?.build(),
              darkMacroColours: _darkMacroColours?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'macroColours';
        _macroColours?.build();
        _$failedField = 'darkMacroColours';
        _darkMacroColours?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ThemeSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
