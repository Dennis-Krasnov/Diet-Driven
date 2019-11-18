// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FoodDiaryDay.serializer)
      ..add(FoodRecord.serializer)
      ..add(MealData.serializer)
      ..add(MealInfo.serializer)
      ..add(NavigationSettings.serializer)
      ..add(Nutrient.serializer)
      ..add(NutrientMap.serializer)
      ..add(NutrientType.serializer)
      ..add(SearchResult.serializer)
      ..add(Settings.serializer)
      ..add(SubscriptionType.serializer)
      ..add(ThemeSettings.serializer)
      ..add(UserDocument.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FoodRecord)]),
          () => new ListBuilder<FoodRecord>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FoodRecord)]),
          () => new ListBuilder<FoodRecord>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MealData)]),
          () => new ListBuilder<MealData>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(Nutrient), const FullType(num)]),
          () => new MapBuilder<Nutrient, num>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
