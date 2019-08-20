/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'food_diary_day_events.g.dart';

abstract class FoodDiaryDayEvent {}

/// Subscribes to bloc state stream.
abstract class InitFoodDiaryDay implements FoodDiaryDayEvent, Built<InitFoodDiaryDay, InitFoodDiaryDayBuilder> {
  factory InitFoodDiaryDay([void Function(InitFoodDiaryDayBuilder) updates]) = _$InitFoodDiaryDay;
  InitFoodDiaryDay._();
}

/// Reactively updates current [authentication], [userDocument], [settings], [subscription]. // TODOCUMENT
abstract class RemoteFoodDiaryDayArrived implements FoodDiaryDayEvent, Built<RemoteFoodDiaryDayArrived, RemoteFoodDiaryDayArrivedBuilder> {
  // ...s

  factory RemoteFoodDiaryDayArrived([void Function(RemoteFoodDiaryDayArrivedBuilder) updates]) = _$RemoteFoodDiaryDayArrived;
  RemoteFoodDiaryDayArrived._();
}
