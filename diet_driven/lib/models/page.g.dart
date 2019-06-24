// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Page _$diary = const Page._('diary');
const Page _$track = const Page._('track');
const Page _$reports = const Page._('reports');
const Page _$recipes = const Page._('recipes');
const Page _$settings = const Page._('settings');

Page _$valueOf(String name) {
  switch (name) {
    case 'diary':
      return _$diary;
    case 'track':
      return _$track;
    case 'reports':
      return _$reports;
    case 'recipes':
      return _$recipes;
    case 'settings':
      return _$settings;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Page> _$values = new BuiltSet<Page>(const <Page>[
  _$diary,
  _$track,
  _$reports,
  _$recipes,
  _$settings,
]);

Serializer<Page> _$pageSerializer = new _$PageSerializer();

class _$PageSerializer implements PrimitiveSerializer<Page> {
  @override
  final Iterable<Type> types = const <Type>[Page];
  @override
  final String wireName = 'Page';

  @override
  Object serialize(Serializers serializers, Page object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Page deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Page.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
