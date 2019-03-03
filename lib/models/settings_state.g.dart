// GENERATED CODE - DO NOT MODIFY BY HAND

part of settings_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SettingsState> _$settingsStateSerializer =
    new _$SettingsStateSerializer();

class _$SettingsStateSerializer implements StructuredSerializer<SettingsState> {
  @override
  final Iterable<Type> types = const [SettingsState, _$SettingsState];
  @override
  final String wireName = 'SettingsState';

  @override
  Iterable serialize(Serializers serializers, SettingsState object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  SettingsState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new SettingsStateBuilder().build();
  }
}

class _$SettingsState extends SettingsState {
  factory _$SettingsState([void updates(SettingsStateBuilder b)]) =>
      (new SettingsStateBuilder()..update(updates)).build();

  _$SettingsState._() : super._();

  @override
  SettingsState rebuild(void updates(SettingsStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsStateBuilder toBuilder() => new SettingsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsState;
  }

  @override
  int get hashCode {
    return 925887568;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SettingsState').toString();
  }
}

class SettingsStateBuilder
    implements Builder<SettingsState, SettingsStateBuilder> {
  _$SettingsState _$v;

  SettingsStateBuilder();

  @override
  void replace(SettingsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsState;
  }

  @override
  void update(void updates(SettingsStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsState build() {
    final _$result = _$v ?? new _$SettingsState._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
