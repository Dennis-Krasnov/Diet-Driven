// GENERATED CODE - DO NOT MODIFY BY HAND

part of settings;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Settings> _$settingsSerializer = new _$SettingsSerializer();

class _$SettingsSerializer implements StructuredSerializer<Settings> {
  @override
  final Iterable<Type> types = const [Settings, _$Settings];
  @override
  final String wireName = 'Settings';

  @override
  Iterable serialize(Serializers serializers, Settings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'effectiveAsOf',
      serializers.serialize(object.effectiveAsOf,
          specifiedType: const FullType(int)),
    ];

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
        case 'effectiveAsOf':
          result.effectiveAsOf = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Settings extends Settings {
  @override
  final int effectiveAsOf;

  factory _$Settings([void updates(SettingsBuilder b)]) =>
      (new SettingsBuilder()..update(updates)).build();

  _$Settings._({this.effectiveAsOf}) : super._() {
    if (effectiveAsOf == null) {
      throw new BuiltValueNullFieldError('Settings', 'effectiveAsOf');
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
    return other is Settings && effectiveAsOf == other.effectiveAsOf;
  }

  @override
  int get hashCode {
    return $jf($jc(0, effectiveAsOf.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Settings')
          ..add('effectiveAsOf', effectiveAsOf))
        .toString();
  }
}

class SettingsBuilder implements Builder<Settings, SettingsBuilder> {
  _$Settings _$v;

  int _effectiveAsOf;
  int get effectiveAsOf => _$this._effectiveAsOf;
  set effectiveAsOf(int effectiveAsOf) => _$this._effectiveAsOf = effectiveAsOf;

  SettingsBuilder();

  SettingsBuilder get _$this {
    if (_$v != null) {
      _effectiveAsOf = _$v.effectiveAsOf;
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
    final _$result = _$v ?? new _$Settings._(effectiveAsOf: effectiveAsOf);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
