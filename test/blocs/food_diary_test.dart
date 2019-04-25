import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import '../test_utils.dart';

void main() {
  FoodDiaryBloc foodDiaryBloc;

  /// Mocks
  DiaryRepository diaryRepository;

  /// Data
  final String userId = "Jerry";
  final int daysSinceEpoch = 243;
  final FoodRecord apple = FoodRecord((b) => b..foodName = "Apple");
  final FoodRecord pear = FoodRecord((b) => b..foodName = "Pear");
  final FoodRecord orange = FoodRecord((b) => b..foodName = "Orange");
  final FoodDiaryDay dayA = FoodDiaryDay((b) => b
    ..date = daysSinceEpoch
    ..foodRecords = ListBuilder([
      apple,
      orange,
    ])
  );
  final FoodDiaryDay dayB = FoodDiaryDay((b) => b
    ..date = daysSinceEpoch
    ..foodRecords = ListBuilder([
      orange,
      pear,
    ])
  );

  ///
  void mockDiaryRepositoryStream({
    List<FoodDiaryDay> foodDiaryDayStream: const []
  }) {
    when(diaryRepository.streamDiaryDay(userId, daysSinceEpoch)).thenAnswer((_) =>
      Observable<FoodDiaryDay>.fromIterable(foodDiaryDayStream)
    );
  }

  setUp(() {
    diaryRepository = MockDiaryRepository();

    mockDiaryRepositoryStream(foodDiaryDayStream: []);

    foodDiaryBloc = FoodDiaryBloc(
      diaryRepository: diaryRepository,
      userId: userId,
      daysSinceEpoch: daysSinceEpoch
    );
  });

  test("Initialize properly", () {
    expect(foodDiaryBloc.initialState, FoodDiaryUninitialized());
  });

  group("Manage diary day stream", () {
    test("Update food diary day", () {
      mockDiaryRepositoryStream(foodDiaryDayStream: [dayA, dayB]);
      foodDiaryBloc = FoodDiaryBloc(
        diaryRepository: diaryRepository,
        userId: userId,
        daysSinceEpoch: daysSinceEpoch
      );

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder([
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..foodDiaryDay = dayA
          ),
          FoodDiaryLoaded((b) => b
            ..foodDiaryDay = dayB
          ),
        ])
      );
    });

    test("Fail on error", () {
      // FIXME: return error inside of stream!
//      reset(diaryRepository);
      when(diaryRepository.streamDiaryDay(userId, daysSinceEpoch)).thenAnswer((_) =>
        Observable.error(Exception("oops"))
      );
//      when(diaryRepository.streamDiaryDay(userId, daysSinceEpoch)).thenThrow(Exception("oops"));
      foodDiaryBloc = FoodDiaryBloc(
        diaryRepository: diaryRepository,
        userId: userId,
        daysSinceEpoch: daysSinceEpoch
      );

      foodDiaryBloc.state.listen(print);

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder([
          FoodDiaryUninitialized(),
          FoodDiaryFailed((b) => b..error = "oops")
        ])
      );

      // FIXME: goes through constructor twice (because of Setup), yet never ends up going into stream.listen(...)

//      await Future.delayed(Duration(milliseconds: 500)); async
    });
  });

  group("Manipulate food records", () {


  });
}

// Tests:
// Manual
// - Pass in a stream to visualize
// - Error fetching stream

// TODO: failure state for each of the following + check that repository is called
// - Save food diary day
// - Add food records
// - Delete food records // TODO: check undo popup appears
// - Edit food records

// Test transform by counting number of repo calls when dispatching exact same events

// Reactive auth state changed triggers
