library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/models/models.dart';

part 'serializers.g.dart';

@SerializersFor([
  FoodRecord,
  FoodDiaryDay,

  Page,

//  UserData,
  UserDocument,
  Settings,
  SubscriptionType,
  ThemeSettings,
  NavigationSettings,

//  Uncertainty,
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer
final Serializers jsonSerializers = (serializers.toBuilder()
  // Supporting built collections with custom classes
  ..addBuilderFactory(const FullType(BuiltList, [FullType(FoodRecord)]), () => ListBuilder<FoodRecord>())
  ..addBuilderFactory(const FullType(BuiltList, [FullType(FoodDiaryDay)]), () =>ListBuilder<FoodDiaryDay>())
  // Converting to JSON
  ..addPlugin(StandardJsonPlugin())
).build();

//var serializersWithBuilder = (serializers.toBuilder()..addBuilderFactory( const FullType(BuiltSet, const[const FullType(GroupMessageReadBy)])) .build()
