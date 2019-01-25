library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/uncertainty.dart';

part 'serializers.g.dart';

//@SerializerPlugin

//@SerializerPlugin
//StandardJsonPlugin();

@SerializersFor(const [
  FoodRecord,
  Uncertainty
])


final Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();