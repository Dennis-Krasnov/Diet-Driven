library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  FoodRecord,
  FoodDiaryDay,

  UserData,
  NavigationSettings,

//  Uncertainty,
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer
final Serializers jsonSerializers = (serializers.toBuilder()
  // Supporting lists
  ..addBuilderFactory(const FullType(BuiltList, const [const FullType(FoodRecord)]), () => new ListBuilder<FoodRecord>())
  ..addBuilderFactory(const FullType(BuiltList, const [const FullType(FoodDiaryDay)]), () => new ListBuilder<FoodDiaryDay>())
  // Converting to JSON
  ..addPlugin(new StandardJsonPlugin())
).build();

//var serializersWithBuilder = (serializers.toBuilder()..addBuilderFactory( const FullType(BuiltSet, const[const FullType(GroupMessageReadBy)])) .build()
