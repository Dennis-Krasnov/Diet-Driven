library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  FoodRecord,
  FoodDiaryDay,
//  Uncertainty,
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer, must type if used in BuiltList
final Serializers jsonSerializers = (serializers.toBuilder()
  ..addBuilderFactory(const FullType(BuiltList, const [const FullType(FoodRecord)]), () => new ListBuilder<FoodRecord>())
  ..addPlugin(new StandardJsonPlugin())
).build();