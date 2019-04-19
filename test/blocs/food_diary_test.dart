import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  // Mocks
  DiaryRepository diaryRepository;

  FoodDiaryBloc foodDiaryBloc;
  final String userId = "Jerry";
  final int daysSinceEpoch = 243;

  setUp(() {
    diaryRepository = MockDiaryRepository();

    foodDiaryBloc = FoodDiaryBloc(
      diaryRepository: diaryRepository,
      userId: userId,
      daysSinceEpoch: daysSinceEpoch
    );
  });

  test("Initial state is correct", () {
    expect(foodDiaryBloc.initialState, FoodDiaryUninitialized());
  });

  group("Manual", () {
    test("Receives food diary", () {
//      final userData = UserData((b) => b..userId = "1234");

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder([
          FoodDiaryUninitialized(),
          FoodDiaryReady((b) => b
//            ..diaryDayStream = ...
          ),
        ])
      );

      foodDiaryBloc.dispatch(RemoteDiaryDayArrived((b) => b
//        ..diaryDayStream = ...
      ));
    });
  });
}
