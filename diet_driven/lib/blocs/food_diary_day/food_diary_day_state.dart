import 'package:built_value/built_value.dart';

part 'food_diary_day_state.g.dart';

abstract class FoodDiaryDayState {}

///
abstract class FoodDiaryDayUninitialized implements FoodDiaryDayState, Built<FoodDiaryDayUninitialized, FoodDiaryDayUninitializedBuilder> {
  factory FoodDiaryDayUninitialized([void Function(FoodDiaryDayUninitializedBuilder) updates]) = _$FoodDiaryDayUninitialized;
  FoodDiaryDayUninitialized._();
}

abstract class FoodDiaryDayLoaded implements FoodDiaryDayState, Built<FoodDiaryDayLoaded, FoodDiaryDayLoadedBuilder> {
  int get date;

  factory FoodDiaryDayLoaded([void Function(FoodDiaryDayLoadedBuilder) updates]) = _$FoodDiaryDayLoaded;
  FoodDiaryDayLoaded._();
}
