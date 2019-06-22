// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FetchConfiguration extends FetchConfiguration {
  factory _$FetchConfiguration(
          [void Function(FetchConfigurationBuilder) updates]) =>
      (new FetchConfigurationBuilder()..update(updates)).build();

  _$FetchConfiguration._() : super._();

  @override
  FetchConfiguration rebuild(
          void Function(FetchConfigurationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FetchConfigurationBuilder toBuilder() =>
      new FetchConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FetchConfiguration;
  }

  @override
  int get hashCode {
    return 715745706;
  }
}

class FetchConfigurationBuilder
    implements Builder<FetchConfiguration, FetchConfigurationBuilder> {
  _$FetchConfiguration _$v;

  FetchConfigurationBuilder();

  @override
  void replace(FetchConfiguration other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FetchConfiguration;
  }

  @override
  void update(void Function(FetchConfigurationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FetchConfiguration build() {
    final _$result = _$v ?? new _$FetchConfiguration._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
